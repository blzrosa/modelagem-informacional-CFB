-- ==================================================
-- ETL - CARGA INCREMENTAL DO DATA WAREHOUSE v2.3  ==
-- ==================================================

-- =======================================
-- ==  CARGA INCREMENTAL DAS DIMENSÕES  ==
-- =======================================

-- Dimensão de Categoria (SCD Tipo 1)
-- Insere novas categorias e atualiza o nome das existentes.
INSERT INTO dw.DimCategoria (IDCategoria, NomeCategoria)
SELECT 
    c.IDCategoria, 
    c.NomeCategoria 
FROM oper.Categoria c
-- O conflito é verificado no IDCategoria, que é a chave de negócio.
ON CONFLICT (IDCategoria) DO UPDATE SET
    NomeCategoria = EXCLUDED.NomeCategoria
WHERE 
    dw.DimCategoria.NomeCategoria IS DISTINCT FROM EXCLUDED.NomeCategoria;

---

-- Dimensão de Produto (SCD Tipo 1)
-- Insere novos produtos e atualiza informações dos existentes.
INSERT INTO dw.DimProduto (IDProduto, NomeProduto, DescricaoProduto, PrecoProduto)
SELECT 
    p.IDProduto, 
    p.NomeProduto, 
    p.DescrProd, 
    p.PrecVenda 
FROM oper.Produto p
ON CONFLICT (IDProduto) DO UPDATE SET
    NomeProduto = EXCLUDED.NomeProduto,
    DescricaoProduto = EXCLUDED.DescricaoProduto,
    PrecoProduto = EXCLUDED.PrecoProduto
WHERE 
    dw.DimProduto.NomeProduto IS DISTINCT FROM EXCLUDED.NomeProduto
    OR dw.DimProduto.DescricaoProduto IS DISTINCT FROM EXCLUDED.DescricaoProduto
    OR dw.DimProduto.PrecoProduto IS DISTINCT FROM EXCLUDED.PrecoProduto;

---

-- Dimensão de Cliente (SCD Tipo 1)
-- Insere novos clientes e atualiza informações dos existentes.
INSERT INTO dw.DimCliente (IDCliente, NomeCliente, EmailCliente)
SELECT 
    c.IDCliente, 
    c.NomeCliente, 
    c.EmailCliente 
FROM oper.Cliente c
ON CONFLICT (IDCliente) DO UPDATE SET
    NomeCliente = EXCLUDED.NomeCliente,
    EmailCliente = EXCLUDED.EmailCliente
WHERE 
    dw.DimCliente.NomeCliente IS DISTINCT FROM EXCLUDED.NomeCliente
    OR dw.DimCliente.EmailCliente IS DISTINCT FROM EXCLUDED.EmailCliente;

---

-- Dimensão de Endereço (SCD Tipo 1)
-- Insere apenas endereços que ainda não existem na dimensão.
INSERT INTO dw.DimEnderecoCliente (Logradouro, Bairro, Municipio, UF, NomeUF)
SELECT
    novos_enderecos.Logradouro,
    novos_enderecos.Bairro,
    novos_enderecos.NomeMunicipio,
    novos_enderecos.IDUF,
    novos_enderecos.NomeUF
FROM (
    -- Subquery para encontrar todos os endereços únicos na origem
    SELECT DISTINCT
        c.Logradouro,
        c.Bairro,
        m.NomeMunicipio,
        u.IDUF,
        u.NomeUF
    FROM oper.Cliente c
    JOIN oper.Municipio m ON c.IDMunicipio = m.IDMunicipio
    JOIN oper.UF u ON m.IDUF = u.IDUF
) AS novos_enderecos
-- Junta com a dimensão existente para verificar quais endereços já foram carregados
LEFT JOIN dw.DimEnderecoCliente de ON
    novos_enderecos.Logradouro = de.Logradouro AND
    novos_enderecos.Bairro = de.Bairro AND
    novos_enderecos.NomeMunicipio = de.Municipio AND
    novos_enderecos.IDUF = de.UF
-- A condição WHERE garante que apenas endereços não encontrados na dimensão sejam inseridos
WHERE de.KeyEnderecoCliente IS NULL;


-- ===================================
-- ==  CARGA INCREMENTAL DAS FATOS  ==
-- ===================================

-- Fato Receita Detalhada
INSERT INTO dw.FatoReceitaDetalhada (
    IDPedido,
    ValorReceita,
    HoraDoDia,
    QtdProdutosVendidos,
    KeyCalendario,
    KeyEnderecoCliente,
    KeyCliente,
    KeyProduto,
    KeyCategoria
)
SELECT
    venda.IDCompra AS IDPedido,
    (venda.Quantidade * prod_op.PrecVenda) AS ValorReceita,
    venda.DataHoraCompra AS HoraDoDia,
    venda.Quantidade AS QtdProdutosVendidos,
    cal.KeyCalendario,
    endr.KeyEnderecoCliente,
    cli_dw.KeyCliente,
    prod_dw.KeyProduto,
    cat_dw.KeyCategoria
FROM
    oper.CliCompraProd AS venda
    -- Joins com tabelas operacionais
    JOIN oper.Produto AS prod_op ON venda.IDProduto = prod_op.IDProduto
    JOIN oper.Cliente AS cli_op ON venda.IDCliente = cli_op.IDCliente
    JOIN oper.Municipio AS mun_op ON cli_op.IDMunicipio = mun_op.IDMunicipio
    JOIN oper.ProdCateg AS pc ON prod_op.IDProduto = pc.IDProduto
    
    -- Joins com as Dimensões para buscar as chaves substitutas
    JOIN dw.DimCalendario AS cal ON venda.DataHoraCompra::date = cal.DataCompleta 
    JOIN dw.DimCliente AS cli_dw ON venda.IDCliente = cli_dw.IDCliente
    JOIN dw.DimProduto AS prod_dw ON venda.IDProduto = prod_dw.IDProduto
    JOIN dw.DimCategoria AS cat_dw ON pc.IDCategoria = cat_dw.IDCategoria
    JOIN dw.DimEnderecoCliente AS endr ON 
        cli_op.Logradouro = endr.Logradouro 
        AND cli_op.Bairro = endr.Bairro 
        AND mun_op.NomeMunicipio = endr.Municipio
ON CONFLICT (IDPedido, KeyProduto) DO UPDATE SET
    ValorReceita = EXCLUDED.ValorReceita,
    QtdProdutosVendidos = EXCLUDED.QtdProdutosVendidos,
    HoraDoDia = EXCLUDED.HoraDoDia -- É uma boa prática atualizar a hora também, caso ela mude.
WHERE
    dw.FatoReceitaDetalhada.ValorReceita IS DISTINCT FROM EXCLUDED.ValorReceita
    OR dw.FatoReceitaDetalhada.QtdProdutosVendidos IS DISTINCT FROM EXCLUDED.QtdProdutosVendidos
    OR dw.FatoReceitaDetalhada.HoraDoDia IS DISTINCT FROM EXCLUDED.HoraDoDia;

---

-- Fato Receita Agregada
WITH VendasAgregadas AS (
    SELECT
        venda.DataHoraCompra::date as DataAgregada,
        venda.IDCliente,
        venda.IDProduto,
        pc.IDCategoria,
        SUM(venda.Quantidade * prod_op.PrecVenda) AS TotalValor
    FROM
        oper.CliCompraProd AS venda
        JOIN oper.Produto AS prod_op ON venda.IDProduto = prod_op.IDProduto
        JOIN oper.ProdCateg AS pc ON prod_op.IDProduto = pc.IDProduto
    GROUP BY
        venda.DataHoraCompra::date,
        venda.IDCliente,
        venda.IDProduto,
        pc.IDCategoria
)
INSERT INTO dw.FatoReceitaAgregada (
    ValorReceita,
    KeyCalendario,
    KeyEnderecoCliente,
    KeyCliente,
    KeyProduto,
    KeyCategoria
)
SELECT
    va.TotalValor,
    cal.KeyCalendario,
    endr.KeyEnderecoCliente,
    cli_dw.KeyCliente,
    prod_dw.KeyProduto,
    cat_dw.KeyCategoria
FROM
    VendasAgregadas va
    -- Joins com tabelas operacionais para obter o endereço
    JOIN oper.Cliente AS cli_op ON va.IDCliente = cli_op.IDCliente
    JOIN oper.Municipio AS mun_op ON cli_op.IDMunicipio = mun_op.IDMunicipio

    -- Joins com as Dimensões para buscar as chaves substitutas
    JOIN dw.DimCalendario AS cal ON va.DataAgregada = cal.DataCompleta
    JOIN dw.DimCliente AS cli_dw ON va.IDCliente = cli_dw.IDCliente
    JOIN dw.DimProduto AS prod_dw ON va.IDProduto = prod_dw.IDProduto
    JOIN dw.DimCategoria AS cat_dw ON va.IDCategoria = cat_dw.IDCategoria
    JOIN dw.DimEnderecoCliente AS endr ON 
        cli_op.Logradouro = endr.Logradouro 
        AND cli_op.Bairro = endr.Bairro 
        AND mun_op.NomeMunicipio = endr.Municipio
ON CONFLICT (KeyCalendario, KeyCliente, KeyProduto, KeyCategoria) DO UPDATE SET
    ValorReceita = EXCLUDED.ValorReceita
WHERE
    dw.FatoReceitaAgregada.ValorReceita IS DISTINCT FROM EXCLUDED.ValorReceita;