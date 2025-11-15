DROP SCHEMA IF EXISTS staging_censo CASCADE;
CREATE SCHEMA staging_censo;

CREATE TABLE staging_censo.raw_censo (
    ano INT,
    cod_ibge VARCHAR(7),
    municipio VARCHAR(255),
    sexo VARCHAR(10),
    idade VARCHAR(20),
    populacao INT
);

COPY staging_censo.raw_censo
FROM './censo2022_sexo_idade.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true, ENCODING 'LATIN1');

INSERT INTO dw_score.DimPopulacao (
    FaixaEtariaPop,
    SexoPop,
    NomeCidadePopulacao,
    UFPopulacao,
    CodigoIBGE
)
SELECT
    idade AS FaixaEtariaPop,
    sexo AS SexoPop,
    municipio AS NomeCidadePopulacao,
    'SP' AS UFPopulacao,
    cod_ibge AS CodigoIBGE
FROM
    staging_censo.raw_censo
WHERE
    ano = 2022
    AND cod_ibge IS NOT NULL
    AND municipio IS NOT NULL
    AND sexo IS NOT NULL
    AND idade IS NOT NULL;

DROP SCHEMA staging_censo CASCADE;
