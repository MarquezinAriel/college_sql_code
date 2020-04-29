CREATE TABLE Categoria
(
	CategoriaID int identity primary key,
	Nome varchar(200) not null,
	Descricao varchar(2000) not null,
)
GO

CREATE TABLE Game
(
	GameID int identity primary key,
	Titulo varchar (200) not null,
	Descricao varchar (1000),
	DataLancamento datetime not null,
	Formato varchar (100),
	CategoriaID int REFERENCES Categoria (CategoriaID) not null,
	Valor numeric(18,2) not null
)
GO

CREATE TABLE Jogador
(
	JogadorID int identity primary key,
	Nome varchar (40) not null,
	NickName varchar (10) not null,
	Email varchar (100),
	Senha varchar (20) not null,
	DataNascimento datetime not null,
	GameID int REFERENCES Game (GameID) not null,
)
GO

--EXEMPLOS DE INSERT
--Categoria
--Select * from Categoria
INSERT INTO Categoria (Nome, Descricao) VALUES ('RPG', 'Role-playing game')

--Game
--Select * from Game
INSERT INTO Game (Titulo, Descricao, DataLancamento, Formato, CategoriaID, Valor) VALUES ('World of Warcraft', 'WoW', '2019-05-20', 'Online', 1, 125.50)

--Jogador
--Select * from Jogador
INSERT INTO Jogador (Nome, NickName, Email, Senha, DataNascimento, GameID) VALUES ('Cristiano Ronaldo', 'CR7', 'cr7@top.com', 'gol123', '1985-02-05', 1)