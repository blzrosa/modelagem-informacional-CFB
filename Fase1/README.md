# Projeto de Modelagem de Dados para a Farmácia CFB

**Integrantes do grupo:**
- Adriel Dias Faria dos Santos
- Artur Vidal Krause
- Bruno Luís Zerbinatto Rosa
- Gabriel Schuenker Rosa de Oliveira

Este repositório contém a documentação e os scripts para a criação e manutenção de um sistema de banco de dados transacional (OLTP) e um Data Warehouse (OLAP) para a Farmácia CFB. 

O projeto foi desenvolvido como parte da disciplina de Modelagem Informacional de Requisitos do prof. Júlio César Chaves, no 4º semestre do curso de Ciência de Dados e Inteligência Artificial.

## 1\. Descrição do Projeto

A Farmácia CFB, administrada por Clara, Francisco e Beatriz, busca inovar ao oferecer um aplicativo móvel para seus clientes. O principal diferencial deste aplicativo é a capacidade de registrar o histórico de medicamentos adquiridos, cadastrar vacinas e, crucialmente, emitir alertas sobre possíveis interações medicamentosas.

O sistema foi projetado para dar suporte tanto às operações do dia a dia da farmácia (vendas, estoque, cadastro de clientes) quanto às análises gerenciais estratégicas, através de um Data Warehouse para análise de receitas.

## 2\. Tecnologias Utilizadas

  * **Banco de Dados:** PostgreSQL
  * **Modelagem de Dados:** Erdplus
  * **Metodologia:** Modelagem Informacional de Requisitos (MIR)

## 3\. Modelagem do Banco de Dados Operacional (OLTP)

O banco de dados operacional foi estruturado para suportar as transações diárias da farmácia.

### Modelo Conceitual

O modelo conceitual representa as principais entidades do negócio e seus relacionamentos, como Clientes, Produtos, Estoque e Fornecedores.

### Esquema Relacional

O esquema relacional é a tradução do modelo conceitual para uma estrutura de tabelas e chaves, pronta para ser implementada no PostgreSQL.

## 4\. Modelagem do Data Warehouse (OLAP)

Para suportar as análises de negócio, foi modelado um Data Warehouse em esquema **Constelação**, com duas tabelas fato para análise de receitas em diferentes granularidades.

  * `FatoReceitaDetalhada`: Armazena dados transacionais de cada venda.
  * `FatoReceitaAgregada`: Consolida os dados de receita por dia, cliente, produto e categoria.

## 5\. Processos de Negócio (Sequências Admissíveis)

Os principais fluxos de trabalho do sistema foram mapeados como sequências de objetivos informacionais.

### Processo de Venda

Inicia com um lembrete ao cliente, passa pela consulta de estoque e verificação de interações pelo atendente, e culmina no registro da venda.

### Processo de Cadastro e Lembrete

Fluxo centrado no cliente, desde o seu cadastro inicial, passando pelo registro do histórico de saúde e vacinas, até a criação e recebimento de lembretes.

### Processo de Reposição de Estoque

Fluxo que envolve a Administração e o Fornecedor, desde o cadastro do fornecedor, consulta de estoque e históricos, até o pedido de novos produtos.

## 6\. Scripts SQL

O diretório `sql_scripts/` contém todos os arquivos necessários para criar, popular e manter os bancos de dados.

### Estrutura dos Scripts

  * `DDL_OPER.sql`: Cria as tabelas do banco de dados operacional (Schema `oper`).
  * `DDL_DW.sql`: Cria as tabelas do Data Warehouse (Schema `dw`).
  * `DML_tables_auxiliary.sql`: Script para ´popular a tabela de UF.
  * `DML_transactions.sql`: Script inicial para popular o banco de dados `oper` com dados básicos (municípios, categorias, clientes, etc.).
  * `DML_DW_insert_dates.sql`: Popula a dimensão `DimCalendario` do Data Warehouse com um intervalo de datas.
  * `ETL_adding_new_data.sql`: Script de ETL (Extração, Transformação e Carga) que realiza a carga incremental de dados do schema `oper` para o `dw`.

### Como Executar

0. **Conexão ao PostgreSQL:**

      * Acesse o terminal do PostgreSQL com o comando:
        ```bash
        psql -h 10.61.49.146 -p 5432 -U cfb_mi -d cfb_dw
        ```
        senha: `1234567890`

1.  **Criação das Estruturas:**

      * Execute `DDL_OPER.sql` para criar o banco de dados transacional.
      * Execute `DDL_DW.sql` para criar o Data Warehouse.

2.  **Carga de Dados Iniciais:**

      * Execute `DML_transactions.sql` para popular o banco operacional com dados essenciais.
      * Execute `DML_DW_insert_dates.sql` para popular a dimensão de calendário do DW.

3.  **Processo de ETL:**

      * Execute `ETL_adding_new_data.sql` para transferir e transformar os dados do ambiente operacional para o Data Warehouse. Este script é incremental e pode ser executado periodicamente para manter o DW atualizado.

## 7\. Análise e Exportação de Dados

O Data Warehouse permite a criação de relatórios analíticos. Foram disponibilizados scripts para exportar os dados das tabelas fato para arquivos CSV.

  * `gerar_csv_detalhada.sql`: Exporta os dados de `FatoReceitaDetalhada`.
  * `gerar_csv_agregada.sql`: Exporta os dados de `FatoReceitaAgregada`.

Para executar, utilize o comando `\i` no terminal `psql`, por exemplo:

```sql
\i gerar_csv_detalhada.sql;
\i gerar_csv_agredada.sql;
```

