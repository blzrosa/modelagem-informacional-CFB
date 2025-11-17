/*
=========================================================
== ARQUIVO 1: DDL (Data Definition Language)
==
== OBJETIVO: Criar o schema e todas as tabelas do DW.
== CONTEÚDO: Script DDL_Create_DW_Score.sql (v3.0)
=========================================================
*/

DROP SCHEMA IF EXISTS dw_score CASCADE; 
CREATE SCHEMA IF NOT EXISTS dw_score;

/*
=================
==  DIMENSÕES  ==
=================
*/
CREATE TABLE dw_score.DimCidadePotencial (
    KeyCidadePotencial INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeCidadePotencial VARCHAR(255) NOT NULL,
    UFCidadePotencial CHAR(2) NOT NULL,
    CodigoIBGE CHAR(7) NOT NULL UNIQUE
);
--

CREATE TABLE dw_score.DimPopulacao (
    KeyPopulacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ContagemPop INT NOT NULL,
    FaixaEtariaPop VARCHAR(32) NOT NULL,
    SexoPop CHAR(1) NOT NULL,
    NomeCidadePopulacao VARCHAR(255) NOT NULL,
    UFPopulacao CHAR(2) NOT NULL,
    CodigoIBGE CHAR(7) NOT NULL
);
--

CREATE TABLE dw_score.DimPesoFaixaEtaria (
    KeyPesoFaixaEtaria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeEstimativa VARCHAR(255) NOT NULL,
    FaixaEtaria VARCHAR(32) NOT NULL,
    SexoFaixaEtaria CHAR(1) NOT NULL,
    ValorPeso FLOAT NOT NULL
);
--

CREATE TABLE dw_score.DimContagemFarmacias (
    KeyContagemFarmacias INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    QtdFarmacias INT CHECK(QtdFarmacias >= 0),
    NomeCidadeContagem VARCHAR(255) NOT NULL,
    UFContagem CHAR(2) NOT NULL,
    CodigoIBGE CHAR(7) NOT NULL UNIQUE
);
--

CREATE TABLE dw_score.DimPIB (
    KeyPIB INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ValorPIB BIGINT,
    AnoPIB INT NOT NULL,
    SetorPIB VARCHAR(32) NOT NULL,
    NomeCidadePIB VARCHAR(255) NOT NULL,
    UFPIB CHAR(2) NOT NULL,
    CodigoIBGE CHAR(7) NOT NULL
);
--

CREATE TABLE dw_score.DimEstimativa (
    KeyEstimativa INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeEstimativa VARCHAR(255) NOT NULL UNIQUE,
    DescricaoEstimativa TEXT,
    
    PesoScorePopulacao FLOAT NOT NULL,
    PesoScoreSaturacao FLOAT NOT NULL,
    PesoScorePIB FLOAT NOT NULL,
    CHECK(PesoScorePopulacao + PesoScoreSaturacao + PesoScorePIB = 1)
);
--

/*
======================
==  FATOS (PLURAL)  ==
======================
*/

/*
== FATO 1: DETALHADO ==
-- Granularidade: Cidade, Estimativa, Ano
*/
CREATE TABLE dw_score.FatoScoreDetalhado (
    -- Chaves Estrangeiras (PK Composta)
    KeyCidadePotencial INT NOT NULL REFERENCES dw_score.DimCidadePotencial(KeyCidadePotencial),
    KeyEstimativa INT NOT NULL REFERENCES dw_score.DimEstimativa(KeyEstimativa),
    AnoScore INT NOT NULL CHECK(AnoScore >= 0),

    -- Outras Chaves Estrangeiras
    KeyContagemFarmacias INT NULL REFERENCES dw_score.DimContagemFarmacias(KeyContagemFarmacias),
    KeyPIB INT NULL REFERENCES dw_score.DimPIB(KeyPIB),

    -- Métricas de "Fonte" (usadas no cálculo)
    PopulacaoTotal INT NOT NULL CHECK(PopulacaoTotal >= 0),
    QtdFarmacias INT NOT NULL CHECK(QtdFarmacias >= 0),
    ValorPIBComercioServicos BIGINT NOT NULL CHECK(ValorPIBComercioServicos >= 0),

    -- Métricas de Score (Raw)
    ScorePopRaw FLOAT NOT NULL,
    ScoreSaturacaoRaw FLOAT NOT NULL,
    ScorePIBRaw FLOAT NOT NULL,
    
    -- Métricas de Score (Normalizadas)
    ScorePopNorm FLOAT NOT NULL,
    ScoreSaturacaoNorm FLOAT NOT NULL,
    ScorePIBNorm FLOAT NOT NULL,

    -- Score Final
    ScoreFinal FLOAT NOT NULL,
    ScoreFinalNorm FLOAT NOT NULL,

    -- Chave Primária
    PRIMARY KEY (KeyCidadePotencial, KeyEstimativa, AnoScore)
);
--

/*
== FATO 2: AGREGADO ==
-- Granularidade: Cidade, Ano
-- Esta tabela é derivada da FatoScoreDetalhado
*/
CREATE TABLE dw_score.FatoScoreAgregado (
    -- Chaves
    KeyCidadePotencial INT NOT NULL REFERENCES dw_score.DimCidadePotencial(KeyCidadePotencial),
    AnoScore INT NOT NULL CHECK(AnoScore >= 0),

    -- Outras Chaves Estrangeiras
    KeyContagemFarmacias INT NULL REFERENCES dw_score.DimContagemFarmacias(KeyContagemFarmacias),
    KeyPIB INT NULL REFERENCES dw_score.DimPIB(KeyPIB),

    -- Métricas de Fonte (consolidadas)
    PopulacaoTotal INT NOT NULL CHECK(PopulacaoTotal >= 0),
    QtdFarmacias INT NOT NULL CHECK(QtdFarmacias >= 0),
    ValorPIBComercioServicos BIGINT NOT NULL CHECK(ValorPIBComercioServicos >= 0),

    -- Métricas Agregadas (consolidadas das várias estimativas)
    ScoreFinalNormMedio FLOAT NOT NULL, -- A média do ScoreFinalNorm de todas as estimativas
    ScoreFinalNormMax FLOAT NOT NULL,   -- O score máximo que a cidade atingiu (melhor cenário)
    RankingGlobal INT,                  -- Um ranking geral (baseado no score médio)

    -- Chave Primária
    PRIMARY KEY (KeyCidadePotencial, AnoScore)
);
--