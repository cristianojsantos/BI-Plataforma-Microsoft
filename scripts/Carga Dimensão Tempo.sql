USE DMVendas
GO

DECLARE @DataIni DATE = '2015-01-01'
DECLARE @DataFim DATE = '2019-12-31'

DECLARE @DataCurrent DATE

DECLARE @cont INT = 0
DECLARE @SKTempo INT = 0
DECLARE @Data DATE
DECLARE @Dia INT = 0
DECLARE @Mes INT = 0
DECLARE @Ano INT = 0

BEGIN
	SET @DataCurrent = @DataIni

	WHILE @DataCurrent <= @DataFim
	BEGIN
		SET @Data = @DataCurrent
		SET @SKTempo = CONVERT(INT, REPLACE(@Data, '-', ''))
		SET @Ano = YEAR(@Data)
		SET @Mes = MONTH(@Data)
		SET @Dia = DAY(@Data)

		INSERT INTO dbo.DimTempo (SKTempo, Data, Dia, Mes, Ano)
		VALUES (@SKTempo, @Data, @Dia, @Mes, @Ano)

		SET @cont += 1
		SET @DataCurrent = DATEADD(DAY, @cont, @DataIni)
	END
END
