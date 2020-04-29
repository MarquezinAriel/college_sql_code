SELECT * FROM Cliente;
SELECT * FROM Pedido;
SELECT * FROM Vendedor;
SELECT * FROM Produto;
SELECT * FROM ItemPedido;

SELECT CodCliente, Nome FROM Cliente ORDER BY Nome ASC;

SELECT * FROM Cliente WHERE Cidade LIKE '%City';

SELECT * FROM Produto WHERE Descricao LIKE 'Laço';

SELECT * FROM Vendedor WHERE SalarioFixo > 2500;
