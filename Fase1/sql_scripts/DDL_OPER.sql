/*
============================
==  DDL OPERACIONAL v2.0  == 
============================
*/

DROP SCHEMA IF EXISTS oper CASCADE;
CREATE SCHEMA oper;

-- Tabelas independentes
CREATE TABLE oper.UF (
	IDUF CHAR(2) PRIMARY KEY,
	NomeUF VARCHAR(19) NOT NULL
);

CREATE TABLE oper.Categoria (
	IDCategoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeCategoria VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE oper.Fornecedor (
	IDFornecedor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeFornecedor VARCHAR(255) NOT NULL,
	CNPJ VARCHAR(18) NOT NULL UNIQUE
);

CREATE TABLE oper.Enfermidades (
	IDEnfermidade INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeEnferm VARCHAR(255) NOT NULL,
	DescrEnferm VARCHAR(512) NOT NULL
);

-- Tabelas dependentes
CREATE TABLE oper.Municipio (
	IDMunicipio INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeMunicipio VARCHAR(255) NOT NULL,
	IDUF CHAR(2) NOT NULL,
	FOREIGN KEY (IDUF) REFERENCES oper.UF(IDUF)
);

CREATE TABLE oper.Estoque (
	IDEstoque INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IDMunicipio INT NOT NULL,
	FOREIGN KEY (IDMunicipio) REFERENCES oper.Municipio(IDMunicipio)
);

CREATE TABLE oper.Cliente (
	IDCliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeCliente VARCHAR(255) NOT NULL,
	EmailCliente VARCHAR(255) NOT NULL UNIQUE,
	Senha VARCHAR(32) NOT NULL,
	Logradouro VARCHAR(255) NOT NULL,
	Bairro VARCHAR(255) NOT NULL,
	IDMunicipio INT NOT NULL,
	FOREIGN KEY (IDMunicipio) REFERENCES oper.Municipio(IDMunicipio)
);

CREATE TABLE oper.Produto (
	IDProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeProduto VARCHAR(255) NOT NULL,
	DescrProd VARCHAR(512) NOT NULL,
	PrecVenda NUMERIC(10,2) NOT NULL,
	DtValidade DATE NOT NULL,
	IDEstoque INT NOT NULL,
	FOREIGN KEY (IDEstoque) REFERENCES oper.Estoque(IDEstoque)
);

CREATE TABLE oper.Medicamento (
	IDProduto INT PRIMARY KEY,
	Indicacao VARCHAR(255) NOT NULL,
	Contraindicacao VARCHAR(255) NOT NULL,
	FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto)
);

CREATE TABLE oper.Vacina (
	IDProduto INT NOT NULL,
	IDCliente INT NOT NULL,
	FabricanteVac VARCHAR(255) NOT NULL,
	PRIMARY KEY (IDProduto, IDCliente),
	FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto),
	FOREIGN KEY (IDCliente) REFERENCES oper.Cliente(IDCliente)
);

-- Tabelas associativas
CREATE TABLE oper.CliCompraProd (
	IDCompra INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IDCliente INT NOT NULL,
	IDProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	DataHoraCompra TIMESTAMP NOT NULL,
	FOREIGN KEY (IDCliente) REFERENCES oper.Cliente(IDCliente),
	FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto)
);

CREATE TABLE oper.FornEstoque (
	IDFornecedor INT NOT NULL,
	IDEstoque INT NOT NULL,
	PrecoCompra NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (IDFornecedor, IDEstoque),
	FOREIGN KEY (IDFornecedor) REFERENCES oper.Fornecedor(IDFornecedor),
	FOREIGN KEY (IDEstoque) REFERENCES oper.Estoque(IDEstoque)
);

CREATE TABLE oper.ProdCateg (
	IDProduto INT NOT NULL,
	IDCategoria INT NOT NULL,
	PRIMARY KEY (IDProduto, IDCategoria),
	FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto),
	FOREIGN KEY (IDCategoria) REFERENCES oper.Categoria(IDCategoria)
);

CREATE TABLE oper.CliEnferm (
	IDCliente INT NOT NULL,
	IDEnfermidade INT NOT NULL,
	DtCadEnferm DATE NOT NULL,
	PRIMARY KEY (IDCliente, IDEnfermidade),
	FOREIGN KEY (IDCliente) REFERENCES oper.Cliente(IDCliente),
	FOREIGN KEY (IDEnfermidade) REFERENCES oper.Enfermidades(IDEnfermidade)
);

CREATE TABLE oper.Cliente_TelefoneCliente (
	IDCliente INT NOT NULL,
	TelefoneCliente VARCHAR(15) NOT NULL,
	PRIMARY KEY (TelefoneCliente, IDCliente),
	FOREIGN KEY (IDCliente) REFERENCES oper.Cliente(IDCliente)
);

CREATE TABLE oper.Fornecedor_Telefone (
	IDFornecedor INT NOT NULL,
	Telefone VARCHAR(15) NOT NULL,
	PRIMARY KEY (Telefone,
	IDFornecedor),
	FOREIGN KEY (IDFornecedor) REFERENCES oper.Fornecedor(IDFornecedor)
);

CREATE TABLE oper.InteracaoMedicamentosa (
	IDProdutoX INT NOT NULL,
	IDProdutoY INT NOT NULL,
	DescrInteracaoMedicam VARCHAR(255) NOT NULL,
	PRIMARY KEY (IDProdutoX,
	IDProdutoY),
	FOREIGN KEY (IDProdutoX) REFERENCES oper.Medicamento(IDProduto),
	FOREIGN KEY (IDProdutoY) REFERENCES oper.Medicamento(IDProduto)
);

CREATE TABLE oper.LembreteCliente (
	IDProduto INT NOT NULL,
	IDCliente INT NOT NULL,
	DataAlarme DATE NOT NULL,
	PRIMARY KEY (IDProduto,
	IDCliente),
	FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto),
	FOREIGN KEY (IDCliente) REFERENCES oper.Cliente(IDCliente)
);


-- Tabela Prateleira 
CREATE TABLE oper.Prateleira (
    IDPrateleira INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDEstoque INT NOT NULL,
    FOREIGN KEY (IDEstoque) REFERENCES oper.Estoque(IDEstoque)
);


-- Tabela Associativa ProdutoPrateleira 
CREATE TABLE oper.ProdutoPrateleira (
    IDProduto INT NOT NULL,
    IDPrateleira INT NOT NULL,
    QuantidadeProduto INT NOT NULL,
    PRIMARY KEY (IDProduto, IDPrateleira),
    FOREIGN KEY (IDProduto) REFERENCES oper.Produto(IDProduto),
    FOREIGN KEY (IDPrateleira) REFERENCES oper.Prateleira(IDPrateleira)
);


-- Adiciona a restrição UNIQUE à coluna NomeEnferm na tabela Enfermidades
ALTER TABLE oper.Enfermidades ADD CONSTRAINT uq_enfermidades_nomeenferm UNIQUE (NomeEnferm);
