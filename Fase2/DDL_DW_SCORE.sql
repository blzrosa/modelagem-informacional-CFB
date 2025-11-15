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
    UFCidadePotencial CHAR(2) NOT NULL
);

CREATE TABLE dw_score.DimPopulacao (
    KeyPopulacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FaixaEtariaPop VARCHAR(32) NOT NULL,
    SexoPop CHAR(1) NOT NULL,
    NomeCidadePopulacao VARCHAR(255) NOT NULL,
    UFPopulacao CHAR(2) NOT NULL
);

CREATE TABLE dw_score.DimPesoFaixaEtaria (
    KeyPesoFaixaEtaria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NomeEstimativa VARCHAR(255) NOT NULL,
    FaixaEtaria VARCHAR(32) NOT NULL,
    ValorPeso FLOAT NOT NULL
);

CREATE TABLE dw_score.DimContagemFarmacias (
    KeyContagemFarmacias INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    QtdFarmacias INT CHECK(QtdFarmacias >= 0),
    NomeCidadeContagem VARCHAR(255) NOT NULL,
    UFContagem CHAR(2) NOT NULL
);

/*
============
==  FATO  ==
============
*/
CREATE TABLE dw_score.FatoScore (
    ValorScore FLOAT NOT NULL,
    ContagemFarmacias INT NOT NULL CHECK(ContagemFarmacias >= 0),
    PopulacaoTotal INT NOT NULL CHECK(PopulacaoTotal >= 0),

    KeyCidadePotencial NOT NULL REFERENCES dw_score.DimCidadePotencial(KeyCidadePotencial),
    KeyPopulacao NOT NULL REFERENCES dw_score.DimPopulacao(KeyPopulacao),
    KeyPesoFaixaEtaria NOT NULL REFERENCES dw_score.DimPesoFaixaEtaria(KeyPesoFaixaEtaria),
    KeyContagemFarmacias NOT NULL REFERENCES dw_score.DimContagemFarmacias(KeyContagemFarmacias),

    PRIMARY KEY (KeyCidadePotencial, KeyPopulacao, KeyPesoFaixaEtaria)
)