USE [DMVenda]
GO

CREATE TABLE [dbo].[ErroExecucao](
	[IdPacote] [varchar](100) NOT NULL,
	[NomeMaquina] [varchar](50) NOT NULL,
	[NomePacote] [varchar](50) NOT NULL,
	[NomeTarefa] [varchar](50) NOT NULL,
	[CodigoErro] [varchar](50) NOT NULL,
	[DescricaoErro] [varchar](2000) NOT NULL,
	[DataExecucao] [datetime] NOT NULL
) ON [PRIMARY]
GO


