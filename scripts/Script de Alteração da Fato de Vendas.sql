/*================================================
  ================= ATENÇÃO ======================
  Executar o Script após ter criado toda a 
  estrutura de Tabelas do Modelo do Data Mart
  proposta nas Aulas, pois, este script irá
  corrigir a estrutura da Tabela Fato de Venda
=================================================*/
USE [DMVendas]
GO

ALTER TABLE [dbo].[FatoVenda] DROP CONSTRAINT [FatoVenda_DimVendedor_FK]
GO

ALTER TABLE [dbo].[FatoVenda] DROP CONSTRAINT [FatoVenda_DimTempo_FK]
GO

ALTER TABLE [dbo].[FatoVenda] DROP CONSTRAINT [FatoVenda_DimProduto_FK]
GO

ALTER TABLE [dbo].[FatoVenda] DROP CONSTRAINT [FatoVenda_DimLoja_FK]
GO

/****** Object:  Table [dbo].[FatoVenda]    Script Date: 31/05/2018 02:07:31 ******/
DROP TABLE [dbo].[FatoVenda]
GO

/****** Object:  Table [dbo].[FatoVenda]    Script Date: 31/05/2018 02:07:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FatoVenda](
	[CodigoVenda] [int] NOT NULL,
	[SKTempo] [int] NOT NULL,
	[SKLoja] [int] NOT NULL,
	[SKVendedor] [int] NOT NULL,
	[SKProduto] [int] NOT NULL,
	[ValorVenda] [numeric](10, 2) NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [FatoVendaPK] PRIMARY KEY CLUSTERED 
(
	[CodigoVenda] ASC,
	[SKTempo] ASC,
	[SKLoja] ASC,
	[SKVendedor] ASC,
	[SKProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FatoVenda]  WITH NOCHECK ADD  CONSTRAINT [FatoVenda_DimLoja_FK] FOREIGN KEY([SKLoja])
REFERENCES [dbo].[DimLoja] ([SKLoja])
GO

ALTER TABLE [dbo].[FatoVenda] CHECK CONSTRAINT [FatoVenda_DimLoja_FK]
GO

ALTER TABLE [dbo].[FatoVenda]  WITH NOCHECK ADD  CONSTRAINT [FatoVenda_DimProduto_FK] FOREIGN KEY([SKProduto])
REFERENCES [dbo].[DimProduto] ([SKProduto])
GO

ALTER TABLE [dbo].[FatoVenda] CHECK CONSTRAINT [FatoVenda_DimProduto_FK]
GO

ALTER TABLE [dbo].[FatoVenda]  WITH NOCHECK ADD  CONSTRAINT [FatoVenda_DimTempo_FK] FOREIGN KEY([SKTempo])
REFERENCES [dbo].[DimTempo] ([SKTempo])
GO

ALTER TABLE [dbo].[FatoVenda] CHECK CONSTRAINT [FatoVenda_DimTempo_FK]
GO

ALTER TABLE [dbo].[FatoVenda]  WITH NOCHECK ADD  CONSTRAINT [FatoVenda_DimVendedor_FK] FOREIGN KEY([SKVendedor])
REFERENCES [dbo].[DimVendedor] ([SKVendedor])
GO

ALTER TABLE [dbo].[FatoVenda] CHECK CONSTRAINT [FatoVenda_DimVendedor_FK]
GO