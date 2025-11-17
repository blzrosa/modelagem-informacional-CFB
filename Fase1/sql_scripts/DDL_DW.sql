/*
===========================
==  DATA WAREHOUSE v2.1  ==
===========================
*/

DROP SCHEMA IF EXISTS dw CASCADE; 
CREATE SCHEMA IF NOT EXISTS dw;

/*
=================
==  DIMENSÕES  ==
=================
*/
CREATE TABLE dw.DimCalendario (
    KeyCalendario INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DataCompleta DATE NOT NULL UNIQUE,
    DiaDaSemana VARCHAR(14) NOT NULL,
    DiaDoMes INT NOT NULL CHECK(DiaDoMes>=1 AND DiaDoMes<=31),
    Mes INT NOT NULL CHECK(Mes<=12),
    NomeMes VARCHAR(10) NOT NULL,
    Trimestre INT NOT NULL CHECK(Trimestre>=1 AND Trimestre<=4),
    Ano INT NOT NULL
);

CREATE TABLE dw.DimEnderecoCliente (
    KeyEnderecoCliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Logradouro VARCHAR(255) NOT NULL,
    Bairro VARCHAR(255) NOT NULL,
    Municipio VARCHAR(255) NOT NULL,
    UF CHAR(2) NOT NULL,
    NomeUF VARCHAR(19) NOT NULL
);

CREATE TABLE dw.DimCliente (
    KeyCliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDCliente INT UNIQUE NOT NULL,
    NomeCliente VARCHAR(255),
    EmailCliente VARCHAR(255)
);

CREATE TABLE dw.DimProduto (
    KeyProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDProduto INT UNIQUE NOT NULL,
    NomeProduto VARCHAR(255) NOT NULL,
    DescricaoProduto VARCHAR(511) NOT NULL,
    PrecoProduto NUMERIC(10,2) NOT NULL CHECK(PrecoProduto>=0)
);

CREATE TABLE dw.DimCategoria (
    KeyCategoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDCategoria INT UNIQUE NOT NULL,
    NomeCategoria VARCHAR(255) NOT NULL
);

/*
=============
==  FATOS  ==
=============
*/
CREATE TABLE dw.FatoReceitaAgregada (
    ValorReceita NUMERIC(10, 2) NOT NULL CHECK(ValorReceita>=0),
    KeyCalendario INT NOT NULL REFERENCES dw.DimCalendario(KeyCalendario),
    KeyEnderecoCliente INT NOT NULL REFERENCES dw.DimEnderecoCliente(KeyEnderecoCliente),
    KeyCliente INT NOT NULL REFERENCES dw.DimCliente(KeyCliente),
    KeyProduto INT NOT NULL REFERENCES dw.DimProduto(KeyProduto),
    KeyCategoria INT NOT NULL REFERENCES dw.DimCategoria(KeyCategoria),
    PRIMARY KEY (KeyCalendario, KeyCliente, KeyProduto, KeyCategoria)
);

CREATE TABLE dw.FatoReceitaDetalhada (
    IDPedido INT NOT NULL,
    ValorReceita NUMERIC(10, 2) NOT NULL CHECK(ValorReceita>=0),
    HoraDoDia TIMESTAMP NOT NULL,
    QtdProdutosVendidos INT NOT NULL CHECK(QtdProdutosVendidos>0),
    
    KeyCalendario INT NOT NULL REFERENCES dw.DimCalendario(KeyCalendario),
    KeyEnderecoCliente INT NOT NULL REFERENCES dw.DimEnderecoCliente(KeyEnderecoCliente),
    KeyCliente INT NOT NULL REFERENCES dw.DimCliente(KeyCliente),
    KeyProduto INT NOT NULL REFERENCES dw.DimProduto(KeyProduto),
    KeyCategoria INT NOT NULL REFERENCES dw.DimCategoria(KeyCategoria),
    PRIMARY KEY (IDPedido, KeyProduto)
);

