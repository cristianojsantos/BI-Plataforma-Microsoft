CREATE DATABASE DMVenda2
GO

USE DMVenda2
GO

CREATE TABLE dbo.ConfiguraExtracao
(
	ConfiguraId INT IDENTITY(1,1) NOT NULL,
	NomeExtracao VARCHAR(30) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NOT NULL,
	DiaRetroativo INT NOT NULL DEFAULT 0,
	ExtracaoAtiva BIT NOT NULL DEFAULT 0,
	CONSTRAINT  ConfiguraExtracaoPK PRIMARY KEY (ConfiguraId) 
)
GO

INSERT INTO dbo.ConfiguraExtracao (NomeExtracao, DataInicio, DataFim, DiaRetroativo, ExtracaoAtiva)
VALUES ('FatoVenda', '2016-01-01', '2017-12-31', -15, 1)
GO

CREATE TABLE dbo.DimTempo
(
	 SKTempo INT NOT NULL,
	 Data DATE NOT NULL,
	 Dia INT NOT NULL,
	 Mes INT NOT NULL,
	 Ano INT NOT NULL,
	CONSTRAINT DimTempoPK PRIMARY KEY (SKTempo)
)
GO

CREATE TABLE dbo.DimLoja
(
	SKLoja INT IDENTITY(1,1) NOT NULL,
	CodigoLoja INT NOT NULL,
	NomeLoja VARCHAR(100) NOT NULL,
	EnderecoLoja VARCHAR(200) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NULL,
	CONSTRAINT DimLojaPK PRIMARY KEY (SKLoja)
)
GO

CREATE TABLE dbo.DimVendedor
(
	SKVendedor INT IDENTITY(1,1) NOT NULL,
	CodigoVendedor INT NOT NULL,
	NomeVendedor VARCHAR(100) NOT NULL,
	CodigoLoja INT NOT NULL,
	NomeLoja VARCHAR(100) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NULL,
	CONSTRAINT DimVendedorPK PRIMARY KEY (SKVendedor)
)
GO

CREATE TABLE dbo.DimProduto
(
	SKProduto INT IDENTITY(1,1) NOT NULL,
	CodigoProduto INT NOT NULL,
	DescricaoProduto VARCHAR(60) NOT NULL,
	ValorProduto NUMERIC(10,2) NOT NULL,
	CodigoCategoria INT NOT NULL,
	DescdricaoCategoria VARCHAR(40) NOT NULL,
	CodigoSubCategoria INT NOT NULL,
	DescricaoSubCategoria VARCHAR(40) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NULL,
	CONSTRAINT DimProdutoPK PRIMARY KEY (SKProduto)
)
GO

CREATE TABLE dbo.FatoVenda
(
	CodigoVenda INT NOT NULL,	
	SKTempo INT NOT NULL,
	SKLoja INT NOT NULL,
	SKVendedor INT NOT NULL,
	SKProduto INT NOT NULL,
	ValorVenda NUMERIC(10,2) NOT NULL,
	Quantidade INT NOT NULL,
	CONSTRAINT FatoVendaPK PRIMARY KEY (CodigoVenda, SKTempo, SKLoja, SKVendedor, SKProduto)
)
GO

ALTER TABLE dbo.FatoVenda ADD CONSTRAINT FatoVenda_DimTempo_FK FOREIGN KEY (SKTempo)
REFERENCES dbo.DimTempo(SKTempo)
GO

ALTER TABLE dbo.FatoVenda ADD CONSTRAINT FatoVenda_DimLoja_FK FOREIGN KEY (SKLoja)
REFERENCES dbo.DimLoja(SKLoja)
GO

ALTER TABLE dbo.FatoVenda ADD CONSTRAINT FatoVenda_DimVendedor_FK FOREIGN KEY (SKVendedor)
REFERENCES dbo.DimVendedor(SKVendedor)
GO

ALTER TABLE dbo.FatoVenda ADD CONSTRAINT FatoVenda_DimProduto_FK FOREIGN KEY (SKProduto)
REFERENCES dbo.DimProduto(SKProduto)
GO
