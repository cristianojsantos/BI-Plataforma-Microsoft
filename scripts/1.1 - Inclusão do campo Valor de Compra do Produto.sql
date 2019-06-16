USE DBVendas
GO

BEGIN
    DECLARE cProduto
	CURSOR FOR
	SELECT P.cod_produto,
		   P.valor_produto
	  FROM dbo.Produto P WITH(NOLOCK)

	DECLARE @cod_produto INT = 0
	DECLARE @valor_produto FLOAT = 0

	/* 
	   Como é um exemplo, deixarei o percentual de lucro
	   fixado em 60% do Produto. Logo, o lucro da venda será este de 60%
	*/
	DECLARE @perc_lucro FLOAT = 60
	DECLARE @valor_compra FLOAT = 0

	OPEN cProduto
	FETCH NEXT FROM cProduto INTO @cod_produto, @valor_produto

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @valor_compra = @valor_produto - ((@perc_lucro / 100) * @valor_produto)

		PRINT 'Valor do Produto: ' + CONVERT(VARCHAR, @valor_produto)
		PRINT 'Valor de Compra: ' + CONVERT(VARCHAR, @valor_compra)

		UPDATE dbo.Produto
		   SET valor_compra = @valor_compra
		 WHERE cod_produto = @cod_produto
		
		FETCH NEXT FROM cProduto INTO @cod_produto, @valor_produto
	END

	CLOSE cProduto
	DEALLOCATE cProduto
END
