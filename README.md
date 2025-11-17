Claro. Baseado no README da Fase 1 e na lista de arquivos da Fase 2 (que sugere uma nova análise de "Score" com dados externos como PIB, população, etc.), preparei uma sugestão de `README.md` que serve para o repositório principal, incorporando ambas as fases.

Este novo README atualiza a descrição, adiciona a Fase 2, e reestrutura as instruções de execução para cobrir todo o projeto.

-----

# Projeto de Modelagem de Dados para a Farmácia CFB

**Integrantes do grupo:**

  - Adriel Dias Faria dos Santos
  - Artur Vidal Krause
  - Bruno Luís Zerbinatto Rosa
  - Gabriel Schuenker Rosa de Oliveira

Este repositório contém a documentação, scripts e notebooks para a criação e manutenção de um sistema de banco de dados transacional (OLTP) e um Data Warehouse (OLAP) para a Farmácia CFB. O projeto foi dividido em duas fases principais.

O projeto foi desenvolvido como parte da disciplina de Modelagem Informacional de Requisitos do prof. Júlio César Chaves, no 4º semestre do curso de Ciência de Dados e Inteligência Artificial.

## 1\. Descrição do Projeto

A Farmácia CFB busca inovar seus serviços e planejar sua expansão estratégica. O projeto de dados suporta essa visão em duas frentes:

  * **Fase 1: Operação e Análise de Receita:** Criação de um sistema OLTP para gerenciar as operações diárias (vendas, estoque, clientes) e um Data Warehouse (OLAP) para análise gerencial da receita. O sistema inclui um aplicativo com alertas de interação medicamentosa.
  * **Fase 2: Análise de Expansão:** Desenvolvimento de um segundo módulo no Data Warehouse focado em análise de expansão. Utilizando dados públicos externos (IBGE, PIB, etc.), este módulo calcula um "score" de potencial para novas filiais em diferentes cidades.

## 2\. Tecnologias Utilizadas

  * **Banco de Dados:** PostgreSQL
  * **Modelagem de Dados:** Erdplus
  * **Processamento de Dados (ETL):** SQL, Python (Pandas, Jupyter Notebooks)
  * **Análise e Visualização:** Python (Matplotlib, Seaborn)
  * **Metodologia:** Modelagem Informacional de Requisitos (MIR)

## 3\. Estrutura do Repositório

```
modelagem-informacional-CFB/
├── Fase1/
│   ├── enunciados/
│   ├── erdplus_files/
│   ├── sql_scripts/      # DDL, DML, ETL da Fase 1 (Receita)
│   └── ...
├── Fase2/
│   ├── apresentacao/
│   ├── dados/            # Dados brutos, processados e exportados
│   ├── diagramas/        # Modelo Erdplus do DW de Score
│   ├── graficos/         # Gráficos de ranking gerados
│   ├── processamento/    # Notebooks Jupyter para ETL
│   ├── DDL_Create_DW_Score.sql
│   ├── ETL_Insert_Fatos_Score.sql
│   └── ...
└── README.md             # Este arquivo
```

## 4\. Fase 1: Sistema Transacional (OLTP) e DW de Receita (OLAP)

Esta fase concentrou-se em estruturar os dados operacionais da farmácia.

### Modelagem OLTP

O banco de dados operacional (`oper`) foi modelado para suportar as transações diárias, como vendas, controle de estoque, cadastro de clientes e histórico de saúde.

### Modelagem OLAP (Receita)

Para suportar as análises de negócio, foi modelado um Data Warehouse (`dw`) em esquema **Constelação**, focado na análise de receitas.

  * `FatoReceitaDetalhada`: Armazena dados transacionais de cada venda.
  * `FatoReceitaAgregada`: Consolida os dados de receita por dia, cliente, produto e categoria.

## 5\. Fase 2: Análise de Expansão (Score de Cidades)

Esta fase adicionou um novo módulo ao Data Warehouse para análise estratégica, com o objetivo de rankear cidades com maior potencial para abertura de novas filiais.

### Fontes de Dados Externas

A análise utiliza dados públicos para contextualizar o potencial de mercado, incluindo:

  * Dados demográficos (População por faixa etária) do Censo 2022 (IBGE).
  * Dados econômicos (PIB por setor).
  * Dados de concorrência (Contagem de farmácias existentes).

### Pipeline de Dados e ETL

O processo de ETL para o DW de Score é orquestrado da seguinte forma:

1.  **Processamento (Notebooks):** Os arquivos em `Fase2/processamento/` (`Populacao.ipynb`, `PIB.ipynb`, `ContagemFarmacias.ipynb`, etc.) tratam e limpam os dados brutos, gerando os arquivos CSV processados.
2.  **Carga (SQL):** Os scripts SQL (`ETL_Insert_...`) carregam os dados processados para as dimensões e tabelas fato no PostgreSQL.

### Modelagem OLAP (Score)

Foi criado um novo esquema **Constelação** (`ConstelationScoreCFB`) para esta análise, contendo:

  * **Dimensões:** `DimCidadePotencial`, `DimPopulacao`, `DimPIB`, `DimContagemFarmacias`, etc.
  * **Tabelas Fato:** `FatoScoreDetalhado` e `FatoScoreAgregado`, que consolidam os indicadores e calculam o score final.

### Análise e Resultados

Os scripts em Python (ex: `plotar_rankings.py`) consomem os dados do DW de Score para gerar rankings visuais (salvos em `Fase2/graficos/`) das cidades mais promissoras.

## 6\. Como Executar o Projeto

### Pré-requisitos

  * Acesso a um servidor PostgreSQL.
  * Ambiente Python com Jupyter, Pandas e Matplotlib.

### Fase 1: Data Warehouse: Receita

0.  **Conexão ao PostgreSQL:** (Credenciais de exemplo do README original)

    ```bash
    psql -h 10.61.49.146 -p 5432 -U cfb_mi -d cfb_dw
    ```

    (senha: `1234567890`)

1.  **Criação das Estruturas (Fase 1):**

      * Execute `Fase1/sql_scripts/DDL_OPER.sql` (Cria o schema `oper`).
      * Execute `Fase1/sql_scripts/DDL_DW.sql` (Cria o schema `dw` para receita).

2.  **Carga de Dados Iniciais (Fase 1):**

      * Execute `Fase1/sql_scripts/DML_transactions.sql` (Popula `oper`).
      * Execute `Fase1/sql_scripts/DML_DW_insert_dates.sql` (Popula `DimCalendario`).

3.  **Processo de ETL (Fase 1):**

      * Execute `Fase1/sql_scripts/ETL_adding_new_data.sql` para carregar dados do `oper` para o `dw` de receita.

### Fase 2: Data Lake: Score

1.  **Processamento de Dados Externos (ETL - Python):**

      * Execute os notebooks Jupyter na pasta `Fase2/processamento/`.
      * *Nota: A ordem de execução exata depende das dependências entre os notebooks (ex: `Populacao.ipynb`, `PIB.ipynb`, `ContagemFarmacias.ipynb` primeiro, depois `CidadePotencial.ipynb`).*
      * Certifique-se que os dados processados sejam salvos na pasta `Fase2/dados/processados/`.

2.  **Criação das Estruturas (Fase 2):**

      * Execute `Fase2/DDL_Create_DW_Score.sql` para criar as novas tabelas de dimensões e fatos de Score no schema `dw`.

3.  **Carga de Dados (ETL - SQL):**

      * Execute `Fase2/DML_Insert_Dimensoes_Estaticas.sql` (Ex: pesos, estimativas).
      * Execute `Fase2/ETL_Insert_Dimensoes_Dinamicas.sql` (Carrega dados processados dos notebooks).
      * Execute `Fase2/ETL_Insert_Fatos_Score.sql` (Popula as tabelas fato de Score).

## 7\. Análise e Exportação de Dados

### Fase 1 (Receita)

Os scripts `gerar_csv_detalhada.sql` e `gerar_csv_agregada.sql` (em `Fase1/sql_scripts/`) exportam os dados de receita.

```sql
\i Fase1/sql_scripts/gerar_csv_detalhada.sql;
\i Fase1/sql_scripts/gerar_csv_agregada.sql;
```

### Fase 2 (Score)

  * O script `Fase2/EXPORT_Todas_Tabelas.sql` pode ser usado para exportar os dados do DW de Score.
  * Para gerar as análises visuais, execute o script `Fase2/plotar_rankings.py` ou o notebook `Fase2/main.ipynb`.