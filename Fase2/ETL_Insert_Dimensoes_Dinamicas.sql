/*
=========================================================
== ARQUIVO 3: ETL (Extract, Transform, Load) - DIMENSÕES
==
== OBJETIVO: Carregar dados de CSVs processados para
==           as tabelas de dimensão.
== CONTEÚDO: ETL_Insert_Cidades_Potenciais_SP.sql
==           ETL_Insert_Populacao_SP.sql
==           ETL_Insert_Contagem_Farmacias_SP.sql
==           ETL_Insert_PIB_Setor_SP.sql
=========================================================
*/

/*
=========================================================
==  1. ETL DimCidadePotencial
==  ORIGEM: dados/processados/cidades_sp_processadas.csv
=========================================================
*/
DROP SCHEMA IF EXISTS staging_cidades_processadas CASCADE;
CREATE SCHEMA staging_cidades_processadas;

CREATE TABLE staging_cidades_processadas.processada (
    NomeCidadePotencial VARCHAR(255),
    UFCidadePotencial CHAR(2),
    CodigoIBGE CHAR(7)
);

\copy staging_cidades_processadas.processada FROM './dados/processados/cidades_sp_processadas.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

INSERT INTO dw_score.DimCidadePotencial (
    NomeCidadePotencial,
    UFCidadePotencial,
    CodigoIBGE
)
SELECT
    NomeCidadePotencial,
    UFCidadePotencial,
    CodigoIBGE
FROM
    staging_cidades_processadas.processada;

DROP SCHEMA staging_cidades_processadas CASCADE;
--

/*
=========================================================
==  2. ETL DimPopulacao
==  ORIGEM: dados/processados/populacao_sp_processada.csv
=========================================================
*/
DROP SCHEMA IF EXISTS staging_populacao_processada CASCADE;
CREATE SCHEMA staging_populacao_processada;

CREATE TABLE staging_populacao_processada.processada (
    ContagemPop INT,
    FaixaEtariaPop VARCHAR(32),
    SexoPop CHAR(1),
    NomeCidadePopulacao VARCHAR(255),
    UFPopulacao CHAR(2),
    CodigoIBGE CHAR(7)
);

\copy staging_populacao_processada.processada FROM './dados/processados/populacao_sp_processada.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

INSERT INTO dw_score.DimPopulacao (
    ContagemPop,
    FaixaEtariaPop,
    SexoPop,
    NomeCidadePopulacao,
    UFPopulacao,
    CodigoIBGE
)
SELECT
    ContagemPop,
    FaixaEtariaPop,
    SexoPop,
    NomeCidadePopulacao,
    UFPopulacao,
    CodigoIBGE
FROM
    staging_populacao_processada.processada;

DROP SCHEMA staging_populacao_processada CASCADE;
--

/*
=========================================================
==  3. ETL DimContagemFarmacias
==  ORIGEM: dados/processados/farmacias_sp_processadas.csv
=========================================================
*/
DROP SCHEMA IF EXISTS staging_farmacias_processadas CASCADE;
CREATE SCHEMA staging_farmacias_processadas;

CREATE TABLE staging_farmacias_processadas.processada (
    QtdFarmacias INT,
    NomeCidadeContagem VARCHAR(255),
    UFContagem CHAR(2),
    CodigoIBGE CHAR(7)
);

\copy staging_farmacias_processadas.processada FROM './dados/processados/farmacias_sp_processadas.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

INSERT INTO dw_score.DimContagemFarmacias (
    QtdFarmacias,
    NomeCidadeContagem,
    UFContagem,
    CodigoIBGE
)
SELECT
    QtdFarmacias,
    NomeCidadeContagem,
    UFContagem,
    CodigoIBGE
FROM
    staging_farmacias_processadas.processada;

DROP SCHEMA staging_farmacias_processadas CASCADE;
--

/*
=========================================================
==  4. ETL DimPIB
==  ORIGEM: dados/processados/pib_sp_processado_por_setor.csv
=========================================================
*/
DROP SCHEMA IF EXISTS staging_pib_processado CASCADE;
CREATE SCHEMA staging_pib_processado;

CREATE TABLE staging_pib_processado.processada (
    ValorPIB VARCHAR(50),
    SetorPIB VARCHAR(32),
    AnoPIB INT,
    NomeCidadePIB VARCHAR(255),
    UFPIB CHAR(2),
    CodigoIBGE CHAR(7)
);

\copy staging_pib_processado.processada FROM './dados/processados/pib_sp_processado_por_setor.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

INSERT INTO dw_score.DimPIB (
    ValorPIB,
    SetorPIB,
    AnoPIB,
    NomeCidadePIB,
    UFPIB,
    CodigoIBGE
)
SELECT
    CASE 
        WHEN ValorPIB = '' THEN NULL
        ELSE CAST(ValorPIB AS NUMERIC)
    END AS ValorPIB,
    SetorPIB,
    AnoPIB,
    NomeCidadePIB,
    UFPIB,
    CodigoIBGE
FROM
    staging_pib_processado.processada;

DROP SCHEMA staging_pib_processado CASCADE;
--