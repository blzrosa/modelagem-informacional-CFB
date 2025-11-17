/*
================================================================
SCRIPT ETL PARA CARGA DAS TABELAS FATO (DETALHADO E AGREGADO)
ORIGEM: Tabelas de Dimensão (dw_score.Dim*)
DESTINO: dw_score.FatoScoreDetalhado, dw_score.FatoScoreAgregado
LÓGICA: Baseada no script main.ipynb
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
================================================
-- Usamos CTEs (WITH) para replicar os passos do main.ipynb
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

-- 2. Filtra População (equivalente ao df_pop_filtrado do notebook)
PopFiltrada AS (
    SELECT
        p.CodigoIBGE,
        p.ContagemPop,
        p.FaixaEtariaPop,
        p.SexoPop,
        pt.PopTotalCidade
    FROM dw_score.DimPopulacao p
    JOIN PopTotal pt ON p.CodigoIBGE = pt.CodigoIBGE
    WHERE pt.PopTotalCidade > 99000 -- Filtro de +99k habitantes
),

-- 3. Filtra PIB (equivalente ao df_pib_pronto do notebook)
PIBFiltrado AS (
    SELECT
        CodigoIBGE,
        ValorPIB
    FROM dw_score.DimPIB
    WHERE
        SetorPIB = 'Comércio e Serviços'
        AND AnoPIB = 2021 -- Ano hardcoded no notebook
),

-- 4. Calcula Score Ponderado de População (Passo B e C do notebook)
--    (Agrega o score_pop_raw por cidade e por estimativa)
ScorePopRaw AS (
    SELECT
        p.CodigoIBGE,
        e.KeyEstimativa,
        SUM(p.ContagemPop * pesos.ValorPeso) AS ScorePopRaw,
        MAX(p.PopTotalCidade) AS PopulacaoTotal -- Apenas para manter o valor
    FROM PopFiltrada p
    -- Junta com os pesos
    JOIN dw_score.DimPesoFaixaEtaria pesos
        ON p.FaixaEtariaPop = pesos.FaixaEtaria
        AND p.SexoPop = pesos.SexoFaixaEtaria
    -- Junta com a DimEstimativa para já ter a Key
    JOIN dw_score.DimEstimativa e
        ON pesos.NomeEstimativa = e.NomeEstimativa
    GROUP BY
        p.CodigoIBGE, e.KeyEstimativa
),

-- 5. Monta a Tabela Base (equivalente ao df_final antes dos cálculos)
FatoStagingRaw AS (
    SELECT
        c.KeyCidadePotencial,
        e.KeyEstimativa,
        2021 AS AnoScore, -- Baseado no ano do PIB
        COALESCE(pop.PopulacaoTotal, 0) AS PopulacaoTotal,
        COALESCE(farm.QtdFarmacias, 0) AS QtdFarmacias,
        COALESCE(pib.ValorPIB, 0) AS ValorPIBComercioServicos,
        COALESCE(pop.ScorePopRaw, 0) AS ScorePopRaw
    FROM
        dw_score.DimCidadePotencial c
    -- CROSS JOIN para garantir que toda cidade tenha todas as estimativas
    CROSS JOIN dw_score.DimEstimativa e
    -- LEFT JOIN com os dados calculados
    LEFT JOIN ScorePopRaw pop
        ON c.CodigoIBGE = pop.CodigoIBGE AND e.KeyEstimativa = pop.KeyEstimativa
    LEFT JOIN dw_score.DimContagemFarmacias farm
        ON c.CodigoIBGE = farm.CodigoIBGE
    LEFT JOIN PIBFiltrado pib
        ON c.CodigoIBGE = pib.CodigoIBGE
    -- Garante que só entrem cidades que passaram no filtro de população (+99k)
    WHERE c.CodigoIBGE IN (SELECT CodigoIBGE FROM PopFiltrada)
),

-- 6. Calcula Scores de Saturação e PIB (Passo E do notebook)
FatoStagingScores AS (
    SELECT
        *,
        -- score_saturacao_raw
        CASE
            WHEN QtdFarmacias = 0 THEN ScorePopRaw
            ELSE ScorePopRaw / QtdFarmacias
        END AS ScoreSaturacaoRaw,
        -- score_pib_raw
        CASE
            WHEN PopulacaoTotal = 0 THEN 0
            ELSE CAST(ValorPIBComercioServicos AS FLOAT) / PopulacaoTotal
        END AS ScorePIBRaw
    FROM FatoStagingRaw
),

-- 7. Prepara Normalização (calcula os valores MÁXIMOS de cada score)
--    (Equivalente ao max_log da função normalizar_log_custom)
FatoStagingNorm AS (
    SELECT
        *,
        -- LOG é o LN (Logaritmo Natural) no PostgreSQL, igual ao np.log
        LOG(MAX(ScorePopRaw) OVER () + 1) AS MaxLogPop,
        LOG(MAX(ScoreSaturacaoRaw) OVER () + 1) AS MaxLogSaturacao,
        LOG(MAX(ScorePIBRaw) OVER () + 1) AS MaxLogPIB
    FROM FatoStagingScores
),

-- 8. Calcula Scores Normalizados (Passo F - 1ª parte)
FatoStagingNormScores AS (
    SELECT
        KeyCidadePotencial, KeyEstimativa, AnoScore,
        PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
        ScorePopRaw, ScoreSaturacaoRaw, ScorePIBRaw,
        
        -- score_pop_norm
        CASE
            WHEN MaxLogPop = 0 THEN 0
            ELSE LOG(ScorePopRaw + 1) / MaxLogPop
        END AS ScorePopNorm,
        
        -- score_saturacao_norm
        CASE
            WHEN MaxLogSaturacao = 0 THEN 0
            ELSE LOG(ScoreSaturacaoRaw + 1) / MaxLogSaturacao
        END AS ScoreSaturacaoNorm,
        
        -- score_pib_norm
        CASE
            WHEN MaxLogPIB = 0 THEN 0
            ELSE LOG(ScorePIBRaw + 1) / MaxLogPIB
        END AS ScorePIBNorm
    FROM FatoStagingNorm
),

-- 9. Calcula Score Final (Ponderado)
FatoStagingFinal AS (
    SELECT
        s.*,
        -- Busca os pesos da DimEstimativa
        e.PesoScorePopulacao,
        e.PesoScoreSaturacao,
        e.PesoScorePIB,
        -- score_final (calculado com os pesos da DimEstimativa)
        (
            (s.ScorePopNorm * e.PesoScorePopulacao) +
            (s.ScoreSaturacaoNorm * e.PesoScoreSaturacao) +
            (s.ScorePIBNorm * e.PesoScorePIB)
        ) AS ScoreFinal
    FROM FatoStagingNormScores s
    JOIN dw_score.DimEstimativa e ON s.KeyEstimativa = e.KeyEstimativa
),

-- 10. Normaliza o Score Final (último passo da normalização)
FatoCalculado AS (
    SELECT
        KeyCidadePotencial, KeyEstimativa, AnoScore,
        PopulacaoTotal, QtdFarmacias, ValorPIBComercioServicos,
        ScorePopRaw, ScoreSaturacaoRaw, ScorePIBRaw,
        ScorePopNorm, ScoreSaturacaoNorm, ScorePIBNorm,
        ScoreFinal,
        
        -- score_final_norm
        CASE
            WHEN LOG(MAX(ScoreFinal) OVER () + 1) = 0 THEN 0
            ELSE LOG(ScoreFinal + 1) / LOG(MAX(ScoreFinal) OVER () + 1)
        END AS ScoreFinalNorm
    FROM FatoStagingFinal
)

-- 11. Carga Final na Tabela FatoScoreDetalhado
INSERT INTO dw_score.FatoScoreDetalhado (
    KeyCidadePotencial,
    KeyEstimativa,
    AnoScore,
    PopulacaoTotal,
    QtdFarmacias,
    ValorPIBComercioServicos,
    ScorePopRaw,
    ScoreSaturacaoRaw,
    ScorePIBRaw,
    ScorePopNorm,
    ScoreSaturacaoNorm,
    ScorePIBNorm,
    ScoreFinal,
    ScoreFinalNorm
)
SELECT
    KeyCidadePotencial,
    KeyEstimativa,
    AnoScore,
    PopulacaoTotal,
    QtdFarmacias,
    ValorPIBComercioServicos,
    ScorePopRaw,
    ScoreSaturacaoRaw,
    ScorePIBRaw,
    ScorePopNorm,
    ScoreSaturacaoNorm,
    ScorePIBNorm,
    ScoreFinal,
    ScoreFinalNorm
FROM
    FatoCalculado;

/*
==================================================
==  PARTE 2: CÁLCULO E INSERÇÃO NO FATO AGREGADO
==================================================
-- Esta parte USA a FatoScoreDetalhado recém-populada
*/
INSERT INTO dw_score.FatoScoreAgregado (
    KeyCidadePotencial,
    AnoScore,
    PopulacaoTotal,
    QtdFarmacias,
    ValorPIBComercioServicos,
    ScoreFinalNormMedio,
    ScoreFinalNormMax,
    RankingGlobal
)
WITH Agregacao AS (
    SELECT
        KeyCidadePotencial,
        AnoScore,
        
        -- Métricas de fonte (são iguais, basta pegar a primeira)
        MAX(PopulacaoTotal) AS PopulacaoTotal,
        MAX(QtdFarmacias) AS QtdFarmacias,
        MAX(ValorPIBComercioServicos) AS ValorPIBComercioServicos,
        
        -- Métricas agregadas (o propósito desta tabela)
        AVG(ScoreFinalNorm) AS ScoreFinalNormMedio,
        MAX(ScoreFinalNorm) AS ScoreFinalNormMax
        
    FROM dw_score.FatoScoreDetalhado
    GROUP BY KeyCidadePotencial, AnoScore
)
-- Calcula o Ranking Global baseado na média
SELECT
    KeyCidadePotencial,
    AnoScore,
    PopulacaoTotal,
    QtdFarmacias,
    ValorPIBComercioServicos,
    ScoreFinalNormMedio,
    ScoreFinalNormMax,
    RANK() OVER (ORDER BY ScoreFinalNormMedio DESC) AS RankingGlobal
FROM
    Agregacao;

-- Finaliza a transação
COMMIT;