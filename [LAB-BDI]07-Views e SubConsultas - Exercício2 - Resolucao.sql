--Criação da Tabelas
CREATE TABLE Habilidade
(
	IDHabilidade int identity primary key,
	Nome varchar(200) not null,
	Poder int
)
GO

CREATE TABLE Classe
(
	IDClasse int identity primary key,
	Nome varchar(100) not null,
	Caracteristicas varchar(500),
	IDHabilidade int not null references Habilidade (IDHabilidade)
)
GO

CREATE TABLE Raca
(
	IDRaca int identity primary key,
	Nome varchar(100) not null,
	Descricao varchar(500),
	Origem varchar(150) not null
)
GO

CREATE TABLE Personagem
(
	IDPersonagem int identity primary key,
	Nome varchar(100) not null,
	Descricao varchar(500) not null,
	DataNascimento datetime not null,
	IDRaca int not null references Raca(IDRaca),
	IDClasse int not null references Classe(IDClasse)
)
GO

--Inserindo informações
insert into Habilidade (Nome, Poder) values
	('Força', 30),
	('Agilidade', 20),
	('Inteligência', 40),
	('Teletransporte', 50),
	('Cura', 35)
GO
--select * from Habilidade

insert into Classe (Nome, Caracteristicas, IDHabilidade) values
	('Ogro', 'Sherek', 3),
	('Magos', 'Poderes Naturais', 5),
	('Feiticeiro', 'Magia Negra', 4),
	('Barbaro', 'Ogros', 1),
	('Anão', 'Pequenos', 1),
	('Pirata', 'Perna de pau', 3)
--select * from Classe

insert into Raca (Nome, Descricao, Origem) values
	('Humana', 'Descricao humano', 'Terra'),
	('Magicos', 'Magias diversas', 'Céu'),
	('Guerreiro', 'Força Bruta', 'Terra'),
	('Assasino', 'Armas', 'Terra')
GO
--select * from Raca

insert into Personagem (Nome, Descricao, DataNascimento, IDRaca, IDClasse) values
	('Davi', 'Descrição Davi', '2002-10-09', 1, 3),
	('Golias', 'Descrição Golias', '2002-10-09', 1, 3),
	('Merlin', 'Poderes', '1995-08-08', 2, 2),
	('Bruxo', 'Bruxaria', '2003-06-06', 2, 2),
	('Dunga', 'Sete anões', '1980-01-01', 3, 4)
GO
--select * from Personagem

--Views
--1. Criar uma view para exibir o Nome e Descrição do Personagem e a sua Origem (tabela Raça)
CREATE VIEW vwView2Exercicio1 AS
	select a.Nome NomePersonagem, a.Descricao DescricaoPersonagem, b.Origem OrigemRaca 
	from 
		Personagem a inner join Raca b 
			on a.IDRaca = b.IDRaca
GO
select * from vwView2Exercicio1

--2. Criar uma view para exibir o nome e característica da Classe e o nome e poder da Habilidade quando o valor do poder estiver entre 15 e 45.
CREATE VIEW vwView2Exercicio2 AS
	select
		a.Nome NomeClasse, 
		a.Caracteristicas CaracteristicaClasse, 
		b.Nome NomeHabilidade, 
		b.Poder 
	from 
		Classe a inner join Habilidade b 
			on a.IDHabilidade = b.IDHabilidade 
	where 
		b.Poder between 15 and 45
GO

select * from vwView2Exercicio2

--3. Criar uma view para exibir o nome e Data de Nascimento do Personagem e a Característica da 
	 --Classe dos personagens que nasceram entre os anos de 2000 e 2005.
CREATE VIEW vwView2Exercicio3 AS
	select 
		a.Nome NomePersonagem, 
		a.DataNascimento, 
		b.Caracteristicas CaracteristicasClasse
	from 
		Personagem a inner join Classe b 
			on a.IDClasse = b.IDClasse
	where
		YEAR(a.DataNascimento) between 2000 and 2005
GO

select * from vwView2Exercicio3
--4. Criar uma view para exibir o Nome do Personagem e a Característica da Classe quando o nome da classe for “Gigante” ou “Anão”.
CREATE VIEW vwView2Exercicio4 AS
	select
		a.Nome NomePersonagem, 
		b.Caracteristicas CaracteristicasClasse
	from 
		Personagem a inner join Classe b
			on a.IDClasse = b.IDClasse
	where 
		b.Nome in ('Gigante', 'Anão')
GO

select * from vwView2Exercicio4
--5. Criar uma view para exibir a quantidade de personagens por Raça.
CREATE VIEW vwView2Exercicio5 AS
	select
		b.Nome Raca,
		count(*) Quantidade
	from 
		Personagem a inner join Raca b 
			on a.IDRaca = b.IDRaca
	group by
		b.Nome
GO

select * from vwView2Exercicio5

--6. Criar uma view para exibir a média de idade por Classe.
CREATE VIEW vwView2Exercicio6 AS
	select 
		b.Nome NomeClasse, 
		avg(DATEDIFF(yy, DataNascimento, GETDATE())) MediaIdade 
	from 
		Personagem a inner join Classe b 
			on a.IDClasse = b.IDClasse 
	group by b.Nome
GO

select * from vwView2Exercicio6

--7. Criar uma view para exibir o Nome do Personagem, o Nome da Raça, o Nome da Classe e o Nome da Habilidade.
CREATE VIEW vwView2Exercicio7 AS
	select
		a.Nome NomePersonagem,
		b.Nome NomeRaca,
		c.Nome NomeClasse,
		d.Nome NomeHabilidade
	from 
		Personagem a inner join Raca b 
			on a.IDRaca = b.IDRaca
		inner join Classe c
			on a.IDClasse = c.IDClasse
		inner join Habilidade d
			on c.IDHabilidade = d.IDHabilidade
GO

select * from vwView2Exercicio7

--SubConsultas
--1. Criar uma subconsulta para exibir o Nome e Data de Nascimento dos Personagens que estão acima da média de idade.
select a.Nome, a.DataNascimento, DATEDIFF(yy, a.DataNascimento, GETDATE()) Idade
from Personagem a 
where
	DATEDIFF(yy, a.DataNascimento, GETDATE()) > (select avg(DATEDIFF(yy, DataNascimento, GETDATE())) from Personagem)

--2. Criar uma subconsulta para exibir o Nome, Descrição e Data de Nascimento dos Personagens que estão abaixo da média de idade.
select a.Nome, a.DataNascimento, DATEDIFF(yy, a.DataNascimento, GETDATE()) Idade
from Personagem a 
where
	DATEDIFF(yy, a.DataNascimento, GETDATE()) < (select avg(DATEDIFF(yy, DataNascimento, GETDATE())) from Personagem)

--3. Criar uma subconsulta para exibir o Nome e Característica das Classes que não estão associadas a nenhum personagem (não utilizadas).
select a.Nome, a.Caracteristicas
from Classe a 
where IDClasse not in (select distinct IDClasse from Personagem)

--4. Criar uma subconsulta para exibir o Nome e Descrição das Raças que não estão associadas a nenhum personagem (não utilizadas).
select a.Nome, a.Descricao 
from Raca a 
where IDRaca not in (select distinct IDRaca from Personagem)

--5. Criar uma subconsulta para exibir o Nome e Descrição da Raça mais utilizada.
select
	r.Nome,
	r.Descricao
from Raca r
where
	r.IDRaca in(
				select x.IDRaca
				from Personagem x
				group by IDRaca
				having count(*) =	(
									select max(a.QtdRaca) QtdRaca
									from
										(select IDRaca, count(*) QtdRaca from Personagem group by IDRaca)a
									)
				)

--6. Criar uma subconsulta para exibir o Nome Poder da Habilidade mais utilizada.
select
	h.Nome,
	h.Poder
from
Habilidade h
where 
	h.IDHabilidade in	(
						select x.IDHabilidade
						from Classe x
						group by IDHabilidade
						having count(*) =	(
												select max(a.QtdHab) QtdHab
												from
													(select IDHabilidade, count(*) QtdHab from Classe group by IDHabilidade)a
											)
						)


--7. Criar uma subconsulta para exibir o Nome e Característica da Classe mais utilizada.
select
	c.Nome,
	c.Caracteristicas
from Classe c
where
	c.IDClasse in(
				select x.IDClasse
				from Personagem x
				group by IDClasse
				having count(*) =	(
									select max(a.QtdClasse) QtdRaca
									from
										(select IDClasse, count(*) QtdClasse from Personagem group by IDClasse)a
									)
				)