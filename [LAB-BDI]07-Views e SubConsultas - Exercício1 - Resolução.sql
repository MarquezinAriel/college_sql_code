--Criação da Tabelas
CREATE TABLE GameServer
(
	IDGameServer	int identity primary key,
	IP		varchar(30) not null,
	Type	varchar(100) not null,
	CreationDate datetime not null
)

CREATE TABLE Player
(
	IDPlayer	int identity primary key,
	Name		varchar(200) not null,
	UserName	varchar(20) not null,
	Password	varchar(20) not null,
	Points		int,
	IDGameServer int not null references GameServer (IDGameServer),
	Age			int not null
)

--Inserindo informações
insert into Player (Name, UserName, Password, Points, IDGameServer, Age) Values
	('Dito', 'userDito', '123', 90, 1, 30),
	('Joao', 'userJoao', '123', 10, 1, 20),
	('Maria', 'userMaria', '123', 10, 2, 30),
	('Mario', 'userMario', '123', 10, 1, 40),
	('Carlos', 'userCarlos', '123', 10, 3, 30),
	('Zeca', 'userZeca', '123', 10, 1, 30)

insert into GameServer values 
	('123', 'P2P', getdate()) ,
	('456', 'P2P', getdate()) ,
	('789', 'P2P', getdate()) 

insert into GameServer values 
	('123', 'Dedicado', getdate()) ,
	('456', 'Dedicado', getdate()) ,
	('789', 'Dedicado', getdate()) 

--Verificando as informações inseridas
select * from GameServer
select * from Player



--Views
--1. Criar uma view para exibir o Name e o UserName do Player e o IP e Type do seu GameServer.
CREATE VIEW vwView1Exercicio1 AS
	select 
		a.Name, 
		a.UserName, 
		b.IP, 
		b.Type 
	from 
		Player A inner join GameServer b 
			on a.IDGameServer = b.IDGameServer

--SELECT * FROM vwView1Exercicio1

--2. Criar uma view para exibir o Nome e Password dos players com 18 anos ou mais.
CREATE VIEW vwView1Exercicio2 AS
	select Name, Password from Player where Age >= 18

--select * from vwView1Exercicio2

--3. Criar uma view para exibir o IP e Tipo dos GameServers cadastrados nos mês de Janeiro, Março, Maio, Julho, Setembro e Novembro.
CREATE VIEW vwView1Exercicio3 AS
	select IP, Type from GameServer where MONTH(CreationDate) in (1,3,5,7,9,11)

--select * from vwView1Exercicio3

--4. Criar uma view para exibir a quantidade de players cadastrados
CREATE VIEW vwView1Exercicio4 AS
	select count(*) QtdPlayer from Player

--select * from vwView1Exercicio4

--5. Criar uma view para exibir a quantidade de player por idade (agrupado por idade).
CREATE VIEW vwView1Exercicio5 AS
	select Age, count(*) Qtd from Player group by Age

--select * from vwView1Exercicio5

--6. Criar uma view para exibir a quantidade de GameServer criados por ano (CreationDate)
CREATE VIEW vwView1Exercicio6 AS
	select year(CreationDate) Ano, count(*) Qtd from GameServer group by year(CreationDate)

--select * from vwView1Exercicio6

--7. Criar uma view para exibir o Type do GameServer e a média de idade (Age) dos Players associados a eles.
CREATE VIEW vwView1Exercicio7 AS
	select a.Type, avg(b.age) MediaIdade 
	from 
		GameServer a inner join Player b  
			on a.IDGameServer = b.IDGameServer 
	group by 
		a.Type

--select * from vwView1Exercicio7

--8. Criar uma view para exibir o Name do Player e o IP do GameServer quando ano de criação (CreationDate) for entre 2010 e 2019.
CREATE VIEW vwView1Exercicio8 AS
	select 
		a.Name,
		b.IP,
		b.CreationDate 
	from 
		Player a inner join GameServer b 
			on a.IDGameServer = b.IDGameServer 
	where 
		year(b.CreationDate) between 2010 and 2019

--select * from vwView1Exercicio8

--9. Criar uma view para exibir o Nome e Password dos Players que possuem (em qualquer parte do texto) no password a palavra “mudar”.
CREATE VIEW vwView1Exercicio9 AS
	select 
		a.Name, 
		a.Password 
	from Player a 
	where 
		a.Password like '%mudar%'

--select * from vwView1Exercicio9

--SubConsulta
--1. Criar uma subcosulta para exibir o Nome e UserName dos players que estão acima da média de idade
select Name, UserName from Player where Age > (select avg(Age) from Player)

--2. Criar uma subconsulta para exibir o Nome e Password dos players que estão abaixo da média de idade
select Name, Password from Player where Age < (select avg(Age) from Player)

--3.	Criar uma subconsulta para exibir o Nome, UserName e Password dos players que estão associados 
--ao GamaServer mais utilizado (GameServer que possui a maior quantidade de usuários associados).
SELECT * FROM Player
where IDGameServer in 
					(
						select IDGameServer/*, count(*) Qtd*/ from Player 
						group by IDGameServer
						having count(*) =	(
											select max(Qtd)
											from 
												(select IDGameServer, count(*) Qtd from Player group by IDGameServer) a
											)
					)

--4.	Criar uma subconsulta para exibir o IP e Type do GameServer mais utilizado
SELECT IP, Type FROM GameServer
where IDGameServer in 
					(
						select IDGameServer/*, count(*) Qtd*/ from Player 
						group by IDGameServer
						having count(*) =	(
											select max(Qtd)
											from 
												(select IDGameServer, count(*) Qtd from Player group by IDGameServer) a
											)
					)


select * from GameServer

select I
	select Max(a.Qtd)
	from (select IDGameServer, COUNT(*) Qtd from Player group by IDGameServer) a

--5. Criar uma subconsulta para exibir o IP, Type e CreationDate dos GameServers que não são utilizados
SELECT * FROM GameServer WHERE IDGameServer not in (select distinct IDGameServer from Player)

--6. Criar uma subconsulta para exibir todas as informações dos players que estão acima da pontuação (points) média
select * from Player where Points >= (select AVG(Points) from Player)

