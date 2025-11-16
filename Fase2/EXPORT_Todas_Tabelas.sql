/*
=========================================================
== SCRIPT DE EXPORTAÇÃO (BACKUP) PARA CSV
== Alvo: Todas as tabelas do schema dw_score
== Método: \copy (client-side)
=========================================================
*/

-- Cria a pasta se não existir
\! mkdir -p dados/exportados

\echo 'Iniciando exportacao das tabelas do schema dw_score...'

\copy dw_score.DimCidadePotencial   TO './dados/exportados/DimCidadePotencial.csv'   CSV HEADER DELIMITER ';'
\copy dw_score.DimPopulacao         TO './dados/exportados/DimPopulacao.csv'         CSV HEADER DELIMITER ';'
\copy dw_score.DimPesoFaixaEtaria   TO './dados/exportados/DimPesoFaixaEtaria.csv'   CSV HEADER DELIMITER ';'
\copy dw_score.DimContagemFarmacias TO './dados/exportados/DimContagemFarmacias.csv' CSV HEADER DELIMITER ';'
\copy dw_score.DimPIB               TO './dados/exportados/DimPIB.csv'               CSV HEADER DELIMITER ';'
\copy dw_score.FatoScore            TO './dados/exportados/FatoScore.csv'            CSV HEADER DELIMITER ';'

\echo '=== EXPORTACAO CONCLUIDA COM SUCESSO! ==='