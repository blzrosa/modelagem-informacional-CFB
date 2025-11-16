/*
=========================================================
==  SCRIPT DE EXPORTAÇÃO (BACKUP) PARA CSV
==
==  Alvo: Todas as tabelas do schema dw_score
==  Método: \copy (psql client-side)
==
=========================================================
*/

\set base_path './dados/exportados/'

\echo 'Exportando dw_score.DimCidadePotencial...'
\copy dw_score.DimCidadePotencial TO :'base_path'DimCidadePotencial.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportando dw_score.DimPopulacao...'
\copy dw_score.DimPopulacao TO :'base_path'DimPopulacao.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportando dw_score.DimPesoFaixaEtaria...'
\copy dw_score.DimPesoFaixaEtaria TO :'base_path'DimPesoFaixaEtaria.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportando dw_score.DimContagemFarmacias...'
\copy dw_score.DimContagemFarmacias TO :'base_path'DimContagemFarmacias.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportando dw_score.DimPIB...'
\copy dw_score.DimPIB TO :'base_path'DimPIB.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportando dw_score.FatoScore...'
\copy dw_score.FatoScore TO :'base_path'FatoScore.csv WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';');

\echo 'Exportação concluída!'