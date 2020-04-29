create table Cliente
(
	CodCliente numeric(18,0) primary key identity,
	Nome varchar(50) not null,
	Endereco varchar(100) not null,
	Cidade varchar(50) not null,
	CEP varchar(10),
	UF varchar(2)
)

create table Vendedor
(
	CodVendedor numeric(18,0) primary key identity,
	Nome varchar(50) not null,
	FaixaComissao numeric(18,2) not null,
	SalarioFixo numeric(18,2) not null
)

create table Produto
(
	CodProduto numeric(18,0) primary key identity,
	Descricao varchar(200) not null,
	Unidade varchar(2) not null,
	ValorUnitario numeric(18,2) not null
)

create table Pedido
(
	NumPedido numeric(18,0) primary key identity,
	PrazoEntrega datetime not null,
	CodCliente numeric(18,0) not null REFERENCES Cliente (CodCliente),
	CodVendedor numeric(18,0) not null REFERENCES Vendedor (CodVendedor)
)

create table ItemPedido
(
	NumPedido numeric(18,0) not null REFERENCES Pedido (NumPedido),
	CodProduto numeric(18,0) not null REFERENCES Produto (CodProduto),
	Quantidade numeric(18,0) not null
)

ALTER TABLE ItemPedido ADD CONSTRAINT PkItemPedido PRIMARY KEY (NumPedido, CodProduto)

ALTER TABLE Vendedor ADD DataNascimento datetime;

SELECT * FROM Vendedor;

ALTER TABLE Cliente ADD Regiao varchar(30);

SELECT * FROM Cliente;

ALTER TABLE Cliente ALTER COLUMN Nome varchar(100);

ALTER TABLE Cliente DROP COLUMN UF;