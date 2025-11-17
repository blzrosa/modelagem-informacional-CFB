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