-- Criar schema de staging se não existir
DROP SCHEMA IF EXISTS staging_municipios CASCADE;
CREATE SCHEMA staging_municipios;

-- Criar tabela temporária de staging
CREATE TABLE staging_municipios.raw_municipios (
    cod_ibge VARCHAR(7),
    municipio VARCHAR(255),
    area_km VARCHAR(50),
    cod_ra VARCHAR(10),
    ra VARCHAR(255),
    cod_rm VARCHAR(10),
    rm VARCHAR(255),
    cod_drs VARCHAR(10),
    drs VARCHAR(255),
    cod_r_saude VARCHAR(10),
    r_saude VARCHAR(255)
);

-- Importar os dados para a tabela de staging
COPY staging_municipios.raw_municipios
FROM './codigos_municipios_regioes_sp.csv'
WITH (FORMAT csv, DELIMITER ';', HEADER true, ENCODING 'LATIN1');

INSERT INTO dw_score.DimCidadePotencial (
    NomeCidadePotencial, 
    UFCidadePotencial, 
    CodigoIBGE
)
SELECT
    municipio,
    'SP' AS UFCidadePotencial,
    cod_ibge AS CodigoIBGE
FROM
    staging_municipios.raw_municipios
WHERE
    cod_ibge IS NOT NULL 
    AND cod_ibge != ''
    AND municipio IS NOT NULL
    AND municipio != 'Sem especificação de município'
    AND municipio != 'Estado de São Paulo';

DROP SCHEMA staging_municipios CASCADE;
