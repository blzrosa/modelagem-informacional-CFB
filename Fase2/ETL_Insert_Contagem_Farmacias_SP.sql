/*
SCRIPT ETL PARA CARGA DA FATO CONTAGEM FARMÁCIAS
ORIGEM: dados/processados/farmacias_sp_processadas.csv
DESTINO: dw_score.FactContagemFarmacias
*/

DROP SCHEMA IF EXISTS staging_farmacias_processadas CASCADE;
CREATE SCHEMA staging_farmacias_processadas;

CREATE TABLE staging_farmacias_processadas.processada (
    QtdFarmacias INT,
    NomeCidadeContagem VARCHAR(255),
    UFContagem CHAR(2),
    CodigoIBGE CHAR(7)
);

COPY staging_farmacias_processadas.processada
FROM './dados/processados/farmacias_sp_processadas.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

INSERT INTO dw_score.FactContagemFarmacias (
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