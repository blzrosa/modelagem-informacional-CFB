/*
SCRIPT ETL PARA CARGA DA DIMENSÃO CIDADE POTENCIAL
ORIGEM: dados/processados/cidades_sp_processadas.csv
DESTINO: dw_score.DimCidadePotencial
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