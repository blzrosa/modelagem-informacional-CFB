/*
================================================================
== ARQUIVO 4: ETL (Extract, Transform, Load) - FATOS
==
== OBJETIVO: Calcular os scores e popular as tabelas
==           FatoScoreDetalhado e FatoScoreAgregado.
== ORIGEM: Tabelas de Dimensão (dw_score.Dim*)
== LÓGICA: Baseada no script main.ipynb
================================================================
*/

-- Garante que as tabelas Fato sejam limpas para o recálculo
TRUNCATE TABLE dw_score.FatoScoreAgregado RESTART IDENTITY;
TRUNCATE TABLE dw_score.FatoScoreDetalhado RESTART IDENTITY CASCADE;

-- Inicia a transação
BEGIN;

/*
================================================
==  PARTE 1: CÁLCULO E INSERÇÃO NO FATO DETALHADO
== (Usando CTEs para replicar os passos do main.ipynb)
================================================
*/
WITH
-- 1. Calcula População Total por cidade (para o filtro de +99k)
PopTotal AS (
    SELECT
        CodigoIBGE,
        SUM(ContagemPop) AS PopTotalCidade
    FROM dw_score.DimPopulacao
    GROUP BY CodigoIBGE
),

-- 2. Filtra População (+99k habitantes)
PopFiltrada AS (
    SELECT
        p.CodigoIBGE,
        p.ContagemPop,
        p.FaixaEtariaPop,
        p.SexoPop,
        pt.PopTotalCidade
    FROM dw_score.DimPopulacao p
    JOIN PopTotal pt ON p.CodigoIBGE = pt.CodigoIBGE
    WHERE pt.PopTotalCidade > 99000
),

-- 3. Filtra PIB ('Comércio e Serviços' e Ano 2021)
PIBFiltrado AS (
    SELECT
        KeyPIB, -- ADICIONADO
        CodigoIBGE,
        ValorPIB
    FROM dw_score.DimPIB
    WHERE
        SetorPIB = 'Comércio e Serviços'
        AND AnoPIB = 2021
),

-- 4. Calcula Score Ponderado de População (agrega por cidade/estimativa)
ScorePopRaw AS (
    SELECT
        p.CodigoIBGE,
        e.KeyEstimativa,
        SUM(p.ContagemPop * pesos.ValorPeso) AS ScorePopRaw,
        MAX(p.PopTotalCidade) AS PopulacaoTotal
    FROM PopFiltrada p
    JOIN dw_score.DimPesoFaixaEtaria pesos
        ON p.FaixaEtariaPop = pesos.FaixaEtaria
        AND p.SexoPop = pesos.SexoFaixaEtaria
    JOIN dw_score.DimEstimativa e
        ON pesos.NomeEstimativa = e.NomeEstimativa
    GROUP BY
        p.CodigoIBGE, e.KeyEstimativa
),

-- 5. Monta a Tabela Base (Junta Cidades, Estimativas e dados de Pop, Farmacia, PIB)
FatoStagingRaw AS (
    SELECT
        c.KeyCidadePotencial,
        e.KeyEstimativa,
        farm.KeyContagemFarmacias, -- ADICIONADO
        pib.KeyPIB,                 -- ADICIONADO
        2021 AS AnoScore, -- Baseado no ano do PIB
        COALESCE(pop.PopulacaoTotal, 0) AS PopulacaoTotal,
        COALESCE(farm.QtdFarmacias, 0) AS QtdFarmacias,
        COALESCE(pib.ValorPIB, 0) AS ValorPIBComercioServicos,
        COALESCE(pop.ScorePopRaw, 0) AS ScorePopRaw
    FROM
        dw_score.DimCidadePotencial c
    CROSS JOIN dw_score.DimEstimativa e
    LEFT JOIN ScorePopRaw pop
        ON c.CodigoIBGE = pop.CodigoIBGE AND e.KeyEstimativa = pop.KeyEstimativa
    LEFT JOIN dw_score.DimContagemFarmacias farm
        ON c.CodigoIBGE = farm.CodigoIBGE
    LEFT JOIN PIBFiltrado pib
        ON c.CodigoIBGE = pib.CodigoIBGE
    WHERE c.CodigoIBGE IN (SELECT CodigoIBGE FROM PopFiltrada)
),

-- 6. Calcula Scores de Saturação e PIB (Raw)
FatoStagingScores AS (
    SELECT
        *, -- As novas Keys passam automaticamente
        CASE
            WHEN QtdFarmacias = 0 THEN ScorePopRaw
            ELSE ScorePopRaw / QtdFarmacias
        END AS ScoreSaturacaoRaw,
        CASE
            WHEN PopulacaoTotal = 0 THEN 0
            ELSE CAST(ValorPIBComercioServicos AS FLOAT) / PopulacaoTotal
        END AS ScorePIBRaw
    FROM FatoStagingRaw
),

-- 7. Prepara Normalização (calcula os valores MÁXIMOS)
FatoStagingNorm AS (
    SELECT
        *, -- As novas Keys passam automaticamente
        LOG(MAX(ScorePopRaw) OVER () + 1) AS MaxLogPop,
        LOG(MAX(ScoreSaturacaoRaw) OVER () + 1) AS MaxLogSaturacao,
        LOG(MAX(ScorePIBRaw) OVER () + 1) AS MaxLogPIB
    FROM FatoStagingScores
),

-- 8. Calcula Scores Normalizados (Log Custom)
FatoStagingNormScores AS (
    SELECT
        KeyCidadePotencial, KeyEstimativa, AnoScore,
        KeyContagemFarmacias, KeyPIB, -- ADICIONADO (para passar adiante)
        PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
        ScorePopRaw, ScoreSaturacaoRaw, ScorePIBRaw,
        
        CASE
            WHEN MaxLogPop = 0 THEN 0
            ELSE LOG(ScorePopRaw + 1) / MaxLogPop
        END AS ScorePopNorm,
        
        CASE
            WHEN MaxLogSaturacao = 0 THEN 0
            ELSE LOG(ScoreSaturacaoRaw + 1) / MaxLogSaturacao
        END AS ScoreSaturacaoNorm,
        
        CASE
            WHEN MaxLogPIB = 0 THEN 0
            ELSE LOG(ScorePIBRaw + 1) / MaxLogPIB
        END AS ScorePIBNorm
    FROM FatoStagingNorm
),

-- 9. Calcula Score Final (Ponderado com pesos da DimEstimativa)
FatoStagingFinal AS (
    SELECT
        s.*, -- As novas Keys passam automaticamente
        e.PesoScorePopulacao,
        e.PesoScoreSaturacao,
        e.PesoScorePIB,
        (
            (s.ScorePopNorm * e.PesoScorePopulacao) +
            (s.ScoreSaturacaoNorm * e.PesoScoreSaturacao) +
            (s.ScorePIBNorm * e.PesoScorePIB)
        ) AS ScoreFinal
    FROM FatoStagingNormScores s
    JOIN dw_score.DimEstimativa e ON s.KeyEstimativa = e.KeyEstimativa
),

-- 10. Normaliza o Score Final
FatoCalculado AS (
    SELECT
        KeyCidadePotencial, KeyEstimativa, AnoScore,
        KeyContagemFarmacias, KeyPIB, -- ADICIONADO (para passar adiante)
        PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
        ScorePopRaw, ScoreSaturacaoRaw, ScorePIBRaw,
        ScorePopNorm, ScoreSaturacaoNorm, ScorePIBNorm,
        ScoreFinal,
        
        CASE
            WHEN LOG(MAX(ScoreFinal) OVER () + 1) = 0 THEN 0
            ELSE LOG(ScoreFinal + 1) / LOG(MAX(ScoreFinal) OVER () + 1)
        END AS ScoreFinalNorm
    FROM FatoStagingFinal
)

-- 11. Carga Final na Tabela FatoScoreDetalhado
INSERT INTO dw_score.FatoScoreDetalhado (
    KeyCidadePotencial, KeyEstimativa, AnoScore,
    KeyContagemFarmacias, KeyPIB, -- ADICIONADO
    PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
    ScorePopRaw, ScoreSaturacaoRaw, ScorePIBRaw,
    ScorePopNorm, ScoreSaturacaoNorm, ScorePIBNorm,
    ScoreFinal, ScoreFinalNorm
)
SELECT * FROM FatoCalculado;
--

/*
==================================================
==  PARTE 2: CÁLCULO E INSERÇÃO NO FATO AGREGADO
== (Agrega os dados do FatoScoreDetalhado)
==================================================
*/
INSERT INTO dw_score.FatoScoreAgregado (
    KeyCidadePotencial, AnoScore,
    KeyContagemFarmacias, KeyPIB, -- ADICIONADO
    PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
    ScoreFinalNormMedio, ScoreFinalNormMax, RankingGlobal
)
WITH Agregacao AS (
    SELECT
        KeyCidadePotencial,
        AnoScore,
        MAX(KeyContagemFarmacias) AS KeyContagemFarmacias, -- ADICIONADO (MAX, MIN, etc. dão o mesmo resultado, pois é 1:1)
        MAX(KeyPIB) AS KeyPIB,                             -- ADICIONADO (Mesma lógica)
        MAX(PopulacaoTotal) AS PopulacaoTotal,
        MAX(QtdFarmacias) AS QtdFarmacias,
        MAX(ValorPIBComercioServicos) AS ValorPIBComercioServicos,
        AVG(ScoreFinalNorm) AS ScoreFinalNormMedio,
        MAX(ScoreFinalNorm) AS ScoreFinalNormMax
    FROM dw_score.FatoScoreDetalhado
    GROUP BY KeyCidadePotencial, AnoScore
)
-- Calcula o Ranking Global baseado na média
SELECT
    KeyCidadePotencial,
    AnoScore,
    KeyContagemFarmacias, KeyPIB, -- ADICIONADO
    PopulacaoTotal,
    QtdFarmacias,
    ValorPIBComercioServicos,
    ScoreFinalNormMedio,
    ScoreFinalNormMax,
    RANK() OVER (ORDER BY ScoreFinalNormMedio DESC) AS RankingGlobal
FROM
    Agregacao;
--

-- Finaliza a transação
COMMIT;
--