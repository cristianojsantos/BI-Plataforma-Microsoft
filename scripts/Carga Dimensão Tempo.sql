USE DMVendas
GO

DECLARE @DataIni DATE = '2016-01-01' 
DECLARE @DataFim DATE = '2019-12-31'

DECLARE @DataCurrent DATE

DECLARE @cont INT = 0
DECLARE @Data DATE
DECLARE @Ano INT = 0
DECLARE @Mes INT = 0
DECLARE @Dia INT = 0

BEGIN
	SET @DataCurrent = @DataIni

	WHILE @DataCurrent <= @DataFim
	BEGIN
		SET @Data = @DataCurrent
		SET @Ano = YEAR(@DataCurrent)
		SET @Mes = MONTH(@DataCurrent)
		SET @Dia = DAY(@DataCurrent)

		INSERT INTO dbo.DimTempo (SKTempo, Data, Dia, Mes, Ano)
		VALUES (CONVERT(INT, REPLACE(@Data, '-', '')),
				@Data,
				@Dia,
				@Mes,
				@Ano)

		SET @cont += 1
		SET @DataCurrent = DATEADD(DAY, @cont, @DataIni)
	END
END