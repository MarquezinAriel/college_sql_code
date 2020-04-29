INSERT INTO Cliente (Nome, Endereco, Cidade, CEP, UF)
VALUES	('Arthur', 'Castelo', 'Atlantida', '11111-111', 'AS'),
		('Bruce', 'Rua Wane', 'Gotham City', '22222-222', 'US'),
		('Clark', 'Fazenda', 'SmallVille', '33333-333', 'US'),
		('Diana', 'Palacio', 'Temissora', '4444-444', 'GK')
		
INSERT INTO Vendedor (Nome, FaixaComissao, SalarioFixo)
VALUES	('Coringa', 19.8, 2500.00),
		('Lector', 36.9, 3000.00),
		('Hades', 36.9, 3000.00),
		('Arraia-Negra', 19.8, 2500.00)
		
INSERT INTO Produto (Descricao, Unidade, ValorUnitario)
VALUES	('Tridente', 'UN', 9000.00),
		('Cinto de Utilidades', 'UN', 5000.00),
		('Capa', 'UN', 200.00),
		('Laço', 'm', 8000.00)
		
INSERT INTO Pedido (PrazoEntrega, CodCliente, CodVendedor)
VALUES	('08-10-2017', 1, 4),
		('08-10-2017', 2, 1),
		('08-10-2017', 3, 2),
		('08-10-2017', 4, 3)
		
INSERT INTO ItemPedido (NumPedido, CodProduto, Quantidade)
VALUES	(1, 1, 1),
		(2, 2, 100),
		(3, 3, 1),
		(4, 4, 1)
		
UPDATE Cliente SET Cidade = 'Arkham City' WHERE CEP = '11111-111'

UPDATE Pedido SET PrazoEntrega = DATEADD(DD, 10, PrazoEntrega) WHERE CodCliente >= 3 and CodCliente <= 8;

UPDATE Produto SET ValorUnitario = ValorUnitario * 0.1 + ValorUnitario WHERE Unidade = 'm'

DELETE FROM Produto WHERE Unidade = 'UN' and ValorUnitario > 50.00;