USE DMVendas
GO

DECLARE @DataIni DATE = '2015-01-01'
DECLARE @DataFim DATE = '2019-12-31'

DECLARE @DataCurrent DATE

DECLARE @cont INT = 0
DECLARE @Data DATE
DECLARE @Ano INT = 0
DECLARE @MES INT = 0
DECLARE @Dia INT = 0

BEGIN
	SET @DataCurrent = @DataIni

	WHILE @DataCurrent <= @DataFim
	BEGIN
		SELECT @Data = @DataCurrent,
			   @Ano = YEAR(@DataCurrent),
			   @Mes = MONTH(@DataCurrent),
			   @Dia = DAY(@DataCurrent)

		INSERT INTO dbo.DimTempo
		VALUES (CONVERT(INT, REPLACE(@Data, '-','')), @Data, @Ano, @Mes, @Dia)

		SET @cont += 1
		SET @DataCurrent = DATEADD(DAY, @cont, @DataIni)
	END
END