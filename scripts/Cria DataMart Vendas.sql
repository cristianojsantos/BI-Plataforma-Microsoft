
CREATE DATABASE DMVenda
GO

USE DMVenda
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
	StatusLoja VARCHAR(15) NOT NULL,
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
	StatusVendedor VARCHAR(15) NOT NULL,
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
	StatusProduto VARCHAR(15) NOT NULL,
	CONSTRAINT DimProdutoPK PRIMARY KEY (SKProduto)
)
GO

CREATE TABLE dbo.FatoVenda
(
	SKTempo INT NOT NULL,
	SKLoja INT NOT NULL,
	SKVendedor INT NOT NULL,
	SKProduto INT NOT NULL,
	ValorVenda NUMERIC(10,2) NOT NULL,
	CONSTRAINT FatoVendaPK PRIMARY KEY (SKTempo, SKLoja, SKVendedor, SKProduto)
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
