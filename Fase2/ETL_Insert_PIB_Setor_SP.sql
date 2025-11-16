/*
SCRIPT ETL PARA CARGA DA FATO PIB POR SETOR
ORIGEM: dados/processados/pib_sp_processado_por_setor.csv
DESTINO: dw_score.FactPIB
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