/*
=========================================================
== ARQUIVO 2: DML (Data Manipulation Language) ESTÁTICO
==
== OBJETIVO: Inserir dados "fixos" nas dimensões.
== CONTEÚDO: DML_Insert_Estimativas.sql
==           DML_Insert_Pesos_Faixa_Etaria.sql
=========================================================
*/

/*
=========================================================
==  1. Carga da DimEstimativa
=========================================================
*/
INSERT INTO dw_score.DimEstimativa 
    (NomeEstimativa, DescricaoEstimativa, PesoScorePopulacao, PesoScoreSaturacao, PesoScorePIB)
VALUES
    ('Uso de medicamentos (Doenças Crônicas)', 
     'Estimativa baseada no perfil de uso de medicamentos para doenças crônicas.',
     0.1, 0.7, 0.2),
     
    ('Prioridade Idosos (60+)',
     'Estimativa que prioriza faixas etárias de 60 anos ou mais.',
     0.1, 0.7, 0.2),
     
    ('Peso Uniforme (Todos)',
     'Estimativa onde todas as faixas etárias possuem o mesmo peso (valor 1.0).',
     0.1, 0.7, 0.2);
--

/*
=========================================================
==  2. Carga da DimPesoFaixaEtaria
=========================================================
*/
INSERT INTO dw_score.DimPesoFaixaEtaria
    (NomeEstimativa, FaixaEtaria, SexoFaixaEtaria, ValorPeso)
VALUES

-- 1. Estimativa: 'Uso de medicamentos (Doenças Crônicas)'
('Uso de medicamentos (Doenças Crônicas)', '00-04', 'H', 42.6),
('Uso de medicamentos (Doenças Crônicas)', '00-04', 'M', 41.4),
('Uso de medicamentos (Doenças Crônicas)', '05-09', 'H', 6.7),
('Uso de medicamentos (Doenças Crônicas)', '05-09', 'M', 3.9),
('Uso de medicamentos (Doenças Crônicas)', '10-14', 'H', 4.5),
('Uso de medicamentos (Doenças Crônicas)', '10-14', 'M', 6.5),
('Uso de medicamentos (Doenças Crônicas)', '15-19', 'H', 4.5),
('Uso de medicamentos (Doenças Crônicas)', '15-19', 'M', 6.5),
('Uso de medicamentos (Doenças Crônicas)', '20-24', 'H', 5.5),
('Uso de medicamentos (Doenças Crônicas)', '20-24', 'M', 6.4),
('Uso de medicamentos (Doenças Crônicas)', '25-29', 'H', 5.5),
('Uso de medicamentos (Doenças Crônicas)', '25-29', 'M', 6.4),
('Uso de medicamentos (Doenças Crônicas)', '30-34', 'H', 34.8),
('Uso de medicamentos (Doenças Crônicas)', '30-34', 'M', 64.5),
('Uso de medicamentos (Doenças Crônicas)', '35-39', 'H', 34.8),
('Uso de medicamentos (Doenças Crônicas)', '35-39', 'M', 64.5),
('Uso de medicamentos (Doenças Crônicas)', '40-44', 'H', 39.0),
('Uso de medicamentos (Doenças Crônicas)', '40-44', 'M', 67.5),
('Uso de medicamentos (Doenças Crônicas)', '45-49', 'H', 39.0),
('Uso de medicamentos (Doenças Crônicas)', '45-49', 'M', 67.5),
('Uso de medicamentos (Doenças Crônicas)', '50-54', 'H', 50.3),
('Uso de medicamentos (Doenças Crônicas)', '50-54', 'M', 76.1),
('Uso de medicamentos (Doenças Crônicas)', '55-59', 'H', 50.3),
('Uso de medicamentos (Doenças Crônicas)', '55-59', 'M', 76.1),
('Uso de medicamentos (Doenças Crônicas)', '60-64', 'H', 68.3),
('Uso de medicamentos (Doenças Crônicas)', '60-64', 'M', 83.8),
('Uso de medicamentos (Doenças Crônicas)', '65-69', 'H', 68.3),
('Uso de medicamentos (Doenças Crônicas)', '65-69', 'M', 83.8),
('Uso de medicamentos (Doenças Crônicas)', '70-74', 'H', 79.8),
('Uso de medicamentos (Doenças Crônicas)', '70-74', 'M', 89.9),
('Uso de medicamentos (Doenças Crônicas)', '75-79', 'H', 79.8),
('Uso de medicamentos (Doenças Crônicas)', '75-79', 'M', 89.9),
('Uso de medicamentos (Doenças Crônicas)', '80-84', 'H', 85.2),
('Uso de medicamentos (Doenças Crônicas)', '80-84', 'M', 90.9),
('Uso de medicamentos (Doenças Crônicas)', '85-89', 'H', 85.2),
('Uso de medicamentos (Doenças Crônicas)', '85-89', 'M', 90.9),
('Uso de medicamentos (Doenças Crônicas)', '90+', 'H', 85.2),
('Uso de medicamentos (Doenças Crônicas)', '90+', 'M', 90.9),
--

-- 2. Estimativa: 'Prioridade Idosos (60+)'
('Prioridade Idosos (60+)', '00-04', 'H', 0.0), ('Prioridade Idosos (60+)', '00-04', 'M', 0.0),
('Prioridade Idosos (60+)', '05-09', 'H', 0.0), ('Prioridade Idosos (60+)', '05-09', 'M', 0.0),
('Prioridade Idosos (60+)', '10-14', 'H', 0.0), ('Prioridade Idosos (60+)', '10-14', 'M', 0.0),
('Prioridade Idosos (60+)', '15-19', 'H', 0.0), ('Prioridade Idosos (60+)', '15-19', 'M', 0.0),
('Prioridade Idosos (60+)', '20-24', 'H', 0.0), ('Prioridade Idosos (60+)', '20-24', 'M', 0.0),
('Prioridade Idosos (60+)', '25-29', 'H', 0.0), ('Prioridade Idosos (60+)', '25-29', 'M', 0.0),
('Prioridade Idosos (60+)', '30-34', 'H', 0.0), ('Prioridade Idosos (60+)', '30-34', 'M', 0.0),
('Prioridade Idosos (60+)', '35-39', 'H', 0.0), ('Prioridade Idosos (60+)', '35-39', 'M', 0.0),
('Prioridade Idosos (60+)', '40-44', 'H', 0.0), ('Prioridade Idosos (60+)', '40-44', 'M', 0.0),
('Prioridade Idosos (60+)', '45-49', 'H', 0.0), ('Prioridade Idosos (60+)', '45-49', 'M', 0.0),
('Prioridade Idosos (60+)', '50-54', 'H', 0.0), ('Prioridade Idosos (60+)', '50-54', 'M', 0.0),
('Prioridade Idosos (60+)', '55-59', 'H', 0.0), ('Prioridade Idosos (60+)', '55-59', 'M', 0.0),
('Prioridade Idosos (60+)', '60-64', 'H', 10.0), ('Prioridade Idosos (60+)', '60-64', 'M', 10.0),
('Prioridade Idosos (60+)', '65-69', 'H', 20.0), ('Prioridade Idosos (60+)', '65-69', 'M', 20.0),
('Prioridade Idosos (60+)', '70-74', 'H', 30.0), ('Prioridade Idosos (60+)', '70-74', 'M', 30.0),
('Prioridade Idosos (60+)', '75-79', 'H', 40.0), ('Prioridade Idosos (60+)', '75-79', 'M', 40.0),
('Prioridade Idosos (60+)', '80-84', 'H', 50.0), ('Prioridade Idosos (60+)', '80-84', 'M', 50.0),
('Prioridade Idosos (60+)', '85-89', 'H', 60.0), ('Prioridade Idosos (60+)', '85-89', 'M', 60.0),
('Prioridade Idosos (60+)', '90+', 'H', 70.0), ('Prioridade Idosos (60+)', '90+', 'M', 70.0),
--

-- 3. Estimativa: 'Peso Uniforme (Todos)'
('Peso Uniforme (Todos)', '00-04', 'H', 1.0), ('Peso Uniforme (Todos)', '00-04', 'M', 1.0),
('Peso Uniforme (Todos)', '05-09', 'H', 1.0), ('Peso Uniforme (Todos)', '05-09', 'M', 1.0),
('Peso Uniforme (Todos)', '10-14', 'H', 1.0), ('Peso Uniforme (Todos)', '10-14', 'M', 1.0),
('Peso Uniforme (Todos)', '15-19', 'H', 1.0), ('Peso Uniforme (Todos)', '15-19', 'M', 1.0),
('Peso Uniforme (Todos)', '20-24', 'H', 1.0), ('Peso Uniforme (Todos)', '20-24', 'M', 1.0),
('Peso Uniforme (Todos)', '25-29', 'H', 1.0), ('Peso Uniforme (Todos)', '25-29', 'M', 1.0),
('Peso Uniforme (Todos)', '30-34', 'H', 1.0), ('Peso Uniforme (Todos)', '30-34', 'M', 1.0),
('Peso Uniforme (Todos)', '35-39', 'H', 1.0), ('Peso Uniforme (Todos)', '35-39', 'M', 1.0),
('Peso Uniforme (Todos)', '40-44', 'H', 1.0), ('Peso Uniforme (Todos)', '40-44', 'M', 1.0),
('Peso Uniforme (Todos)', '45-49', 'H', 1.0), ('Peso Uniforme (Todos)', '45-49', 'M', 1.0),
('Peso Uniforme (Todos)', '50-54', 'H', 1.0), ('Peso Uniforme (Todos)', '50-54', 'M', 1.0),
('Peso Uniforme (Todos)', '55-59', 'H', 1.0), ('Peso Uniforme (Todos)', '55-59', 'M', 1.0),
('Peso Uniforme (Todos)', '60-64', 'H', 1.0), ('Peso Uniforme (Todos)', '60-64', 'M', 1.0),
('Peso Uniforme (Todos)', '65-69', 'H', 1.0), ('Peso Uniforme (Todos)', '65-69', 'M', 1.0),
('Peso Uniforme (Todos)', '70-74', 'H', 1.0), ('Peso Uniforme (Todos)', '70-74', 'M', 1.0),
('Peso Uniforme (Todos)', '75-79', 'H', 1.0), ('Peso Uniforme (Todos)', '75-79', 'M', 1.0),
('Peso Uniforme (Todos)', '80-84', 'H', 1.0), ('Peso Uniforme (Todos)', '80-84', 'M', 1.0),
('Peso Uniforme (Todos)', '85-89', 'H', 1.0), ('Peso Uniforme (Todos)', '85-89', 'M', 1.0),
('Peso Uniforme (Todos)', '90+', 'H', 1.0), ('Peso Uniforme (Todos)', '90+', 'M', 1.0);
--