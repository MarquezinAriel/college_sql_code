--ex. 1.1
CREATE VIEW vwView1Exercicio2 AS
	select a.Nome NomePersonagem, a.Descricao DescricaoPersonagem, b.Origem OrigemRaca 
	from 
		Personagem a inner join Raca b 
			on a.IDRaca = b.IDRaca
GO

select * from vwView1Exercicio2

--ex. 1.2
CREATE VIEW vwView1Exercicio2 AS
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

select * from vwView1Exercicio2

--ex. 1.3
CREATE VIEW vwView1Exercicio3 AS
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

select * from vwView1Exercicio3

--ex. 1.4
CREATE VIEW vwView1Exercicio4 AS
	select
		a.Nome NomePersonagem, 
		b.Caracteristicas CaracteristicasClasse
	from 
		Personagem a inner join Classe b
			on a.IDClasse = b.IDClasse
	where 
		b.Nome in ('Gigante', 'Anão')
GO

select * from vwView1Exercicio4

--ex. 1.5
CREATE VIEW vwView1Exercicio5 AS
	select
		b.Nome Raca,
		count(*) Quantidade
	from 
		Personagem a inner join Raca b 
			on a.IDRaca = b.IDRaca
	group by
		b.Nome
GO

select * from vwView1Exercicio5

--ex. 1.6
CREATE VIEW vwView1Exercicio6 AS
	select 
		b.Nome NomeClasse, 
		avg(DATEDIFF(yy, DataNascimento, GETDATE())) MediaIdade 
	from 
		Personagem a inner join Classe b 
			on a.IDClasse = b.IDClasse 
	group by b.Nome
GO

select * from vwView1Exercicio6

--ex. 1.7
CREATE VIEW vwView1Exercicio7 AS
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

select * from vwView1Exercicio7

--ex. 2.1
select a.Nome, a.DataNascimento, DATEDIFF(yy, a.DataNascimento, GETDATE()) Idade
from Personagem a 
where
	DATEDIFF(yy, a.DataNascimento, GETDATE()) > (select avg(DATEDIFF(yy, DataNascimento, GETDATE())) from Personagem)

--ex. 2.2
select a.Nome, a.DataNascimento, DATEDIFF(yy, a.DataNascimento, GETDATE()) Idade
from Personagem a 
where
	DATEDIFF(yy, a.DataNascimento, GETDATE()) < (select avg(DATEDIFF(yy, DataNascimento, GETDATE())) from Personagem)

--ex. 2.3
select a.Nome, a.Caracteristicas
from Classe a 
where IDClasse not in (select distinct IDClasse from Personagem)

--ex. 2.4
select a.Nome, a.Descricao 
from Raca a 
where IDRaca not in (select distinct IDRaca from Personagem)

--ex. 2.5
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

--ex. 2.6
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

--ex. 2.7
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
