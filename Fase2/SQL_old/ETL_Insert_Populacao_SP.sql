/*
SCRIPT ETL PARA CARGA DA DIMENSÃO POPULAÇÃO
ORIGEM: dados/processados/populacao_sp_processada.csv
DESTINO: dw_score.DimPopulacao
*/

DROP SCHEMA IF EXISTS staging_populacao_processada CASCADE;
CREATE SCHEMA staging_populacao_processada;

-- 2. Criação da Tabela de Staging (refletindo o CSV processado)
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