/*exercicio 1*/

CREATE TABLE Marca
(
	CodMarca int primary key identity,
	Descricao varchar (250)
)

CREATE TABLE Modelo
(
	CodModelo int primary key identity,
	Descricao varchar (250)
)

CREATE TABLE Cliente2
(
	CodCliente2 int primary key identity,
	Nome varchar (150) not null,
	Email varchar (200) not null,
	CPF varchar (20),
	Endereco varchar (250) not null,
	Numero int not null,
	Complemento varchar (50),
	Cidade varchar (80) not null,
	Estado varchar (2) not null,
	DataCadastro datetime
)

CREATE TABLE Automovel
(
	CodAutomovel int primary key identity,
	CodMarca int REFERENCES Marca(CodMarca)not null,
	CodModelo int REFERENCES Modelo(CodModelo)not null,
	Nome varchar(250) not null
)

CREATE TABLE Locacao
(
	CodLocacao int primary key identity,
	CodAutomovel int REFERENCES Automovel(CodAutomovel)not null,
	CodCliente2 int REFERENCES Cliente2(CodCliente2)not null,
	LocacaoKm int not null,
	DataCadastro datetime
)

/*exercicio 2*/

INSERT INTO Marca (Descricao)
VALUES	('BMW'),
		('Ford'),
		('Aston Martin')
		
select * from Marca
		
INSERT INTO Modelo (Descricao)
VALUES	('M2 Coupé'),
		('Shelby GT-500'),
		('AMR')
		
select * from Modelo
		
INSERT INTO Cliente2 (Nome, Email, CPF, Endereco, Numero, Complemento, Cidade, Estado, DataCadastro)
VALUES	('Tchalla', 'pantera@email.com', '11111-111', 'Rua Vibranium', '500', 'Forest', 'Wakanda', 'AF', getdate()),
		('Dr Destino', 'fate@email.com', '22222-222', 'Rua Doom', '35', 'City', 'Nova York', 'US', getdate()),
		('Tony Stark', 'ironman@email.com', '33333-333', 'Rua Avengers', '124', 'City', 'Los Angeles', 'US', getdate())
		
select * from Cliente2
		
INSERT INTO Automovel (CodMarca, CodModelo, Nome)
VALUES	(1, 1, 'sedan'),
		(2, 2, 'Esportivo'),
		(3, 3, '007')
		
select * from Automovel

INSERT INTO Locacao (CodAutomovel, CodCliente2, LocacaoKm, DataCadastro)
VALUES	(1, 5, '9000', getdate()),
		(2, 4, '12000', getdate()),
		(3, 6, '3000', getdate()),
		(3, 6, '3000', getdate())
		
select * from Locacao

/*exercicio 3*/

/*questao A*/
select COUNT(*) from Cliente2

/*questao B*/
select Cidade, COUNT(*) from Cliente2 group by Cidade

/*questao C*/
select MIN(DataCadastro), MAX(DataCadastro) from Cliente2

/*questao D*/
select COUNT(*) from Marca

/*questao E*/
select SUM(LocacaoKm) from Locacao

/*questao F*/
select CodMarca, COUNT(*) from Automovel group by CodMarca

/*questao G*/
select MAX(LocacaoKm) from Locacao

/*questao H*/
select CodModelo, COUNT(*) from Automovel group by CodModelo

/*questao I - igual a F*/


/*questao J*/
select CodAutomovel, AVG(LocacaoKm) from Locacao group by CodAutomovel

/*questao K*/
select	CodCliente2, 
		AVG(LocacaoKm), 
		SUM(LocacaoKm), 
		MAX(LocacaoKm), 
		MIN(LocacaoKm) 
from Locacao group by CodCliente2

/*questao L*/
select COUNT(CodLocacao) from Locacao group by CodAutomovel having ( COUNT(LocacaoKm) < AVG(LocacaoKm))