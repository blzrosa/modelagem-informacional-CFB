DROP SCHEMA IF EXISTS staging_farmacias CASCADE;
CREATE SCHEMA staging_farmacias;

CREATE TABLE staging_farmacias.raw_farmacias (
    UF VARCHAR(10),
    MUNICIPIO_DESCRICAO VARCHAR(255),
    Codigo_IBGE VARCHAR(10),
    Estabelecimentos VARCHAR(20)
);

COPY staging_farmacias.raw_farmacias
FROM './farmacias_sp.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

INSERT INTO dw_score.DimContagemFarmacias (
    QtdFarmacias,
    NomeCidadeContagem,
    UFContagem,
    CodigoIBGE
)
SELECT
    CASE 
        WHEN Estabelecimentos ~ '^\d+$' THEN Estabelecimentos::INT
        ELSE NULL
    END AS QtdFarmacias,
    MUNICIPIO_DESCRICAO,
    UF,
    Codigo_IBGE
FROM
    staging_farmacias.raw_farmacias
WHERE
    Codigo_IBGE IS NOT NULL
    AND Codigo_IBGE != 'Totais'
    AND Estabelecimentos ~ '^\d+$';

DROP SCHEMA staging_farmacias CASCADE;
