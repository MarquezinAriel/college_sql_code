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

--ex.1 - a)
Create View vwView1Ex1a AS
select
		a.Nome NomeJogador,
		a.NickName NickNameJogador,
		b.Titulo TituloGame,
		c.Descricao DescricaoCategoria
from
		Jogador a inner join Game b on a.GameID = b.GameID inner join Categoria c on b.CategoriaID = c.CategoriaID
GO

--ex.1 - b)
Create View vwView1Ex1b AS
select
		a.Nome NomeJogador,
		a.Senha SenhaJogador,
		b.Titulo TituloGame,
		b.Valor ValorGame,
		c.Nome NomeCategoria
from
		Jogador a inner join Game b on a.GameID = b.GameID inner join Categoria c on b.CategoriaID = c.CategoriaID
where
		MONTH(b.DataLancamento) in (7,12) AND Valor between 50 and 75
GO

--ex.1 - c)
Create View vwView1Ex1c AS
select
		AVG(DATEDIFF(yy,DataNascimento,GETDATE()))MediaIdade,
		count(*) Quantidade
from
		Jogador
GO

--ex.1 - d)
Create View vwView1Ex1d AS
select
		count(*) Quantidade
from
		Jogador
GROUP BY
		YEAR(DataNascimento)
GO

--ex.1 - e)
Create View vwView1Ex1e AS
select
		count(*) Quantidade,
		b.Titulo TituloGame
from
		Jogador a inner join Game b on a.GameID = b.GameID
GROUP BY
		b.Titulo
GO

--ex.1 - f)
Create View vwView1Ex1f AS
select
		AVG(Valor)ValorMedio,
		b.Nome NomeCategoria
from
		Game a inner join Categoria b on a.CategoriaID = b.CategoriaID
GROUP BY
		b.Nome
GO

--ex.2 - a)
select g.Titulo, g.Valor, c.Nome from Game g, Categoria c
where
		g.Valor > AVG(g.Valor)

--ex.2 - b)
select j.Nome, j.NickName, j.DataNascimento, DATEDIFF(yy,j.DataNascimento,GETDATE())Idade from Jogador j
where
		DATEDIFF(yy,j.DataNascimento,GETDATE()) < (select AVG(DATEDIFF(yy,j.DataNascimento,GETDATE()) from Jogador))

--ex.2 - c)
select Nome, Descricao from Categoria
where
		CategoriaID not in (select distinct GameID from Game)

--ex.2 - d)
select g.Titulo, g.DataLancamento, g.Formato from Game g
where
		g.GameID in (
					select j.GameID
					from Jogador j
					group by GameID
					having count(*) = (
										select MAX(a.QtdGame)QtdGame
										from
											(select GameID, count(*) QtdGame from Jogador group by GameID)a
										)
					)