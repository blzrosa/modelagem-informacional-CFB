CREATE TEMP TABLE temp_farmacias (
    UF CHAR(2),
    Municipio VARCHAR(255),
    Count INT
);

COPY temp_farmacias(UF, Municipio, Count)
FROM './FarmaciasSPCount.csv' DELIMITER ',' CSV HEADER;

WITH cidades_transformadas AS (
    SELECT 
        t.UF,
        t.Municipio,
        t.Count,
        d.KeyCidadePotencial
    FROM temp_farmacias t
    JOIN dw_score.DimCidadePotencial d 
        ON t.Municipio = d.NomeCidadePotencial 
        AND t.UF = d.UFCidadePotencial
)
INSERT INTO dw_score.DimContagemFarmacias (QtdFarmacias, NomeCidadeContagem, UFContagem)
SELECT 
    c.Count AS QtdFarmacias, 
    c.Municipio AS NomeCidadeContagem, 
    c.UF AS UFContagem
FROM cidades_transformadas c;

DROP TABLE temp_farmacias;
