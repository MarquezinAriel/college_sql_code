CREATE TABLE raca(
	IDRaca int PRIMARY KEY,
	Nome varchar(100) not null,
	Descricao varchar(500),
	Origem varchar (150) not null,
	Perdido datetime not null,
)

CREATE TABLE classe(
	IDClasse int PRIMARY KEY,
	Nome varchar(100) not null,
	caracteristicas varchar(1000),
	IDHabilidade int Not Null REFERENCES habilidade,
)

CREATE TABLE habilidade(
	
	IDHabilidade int not null,
	Nome varchar(200) not null,
)

CREATE TABLE Personagem(
	IDPersonagem int PRIMARY KEY,
	Nome varchar(100) not null,
	Descricao varchar(500),
	DataNascimento datetime not null,
	IDRaca int Not Null REFERENCES raca,
	IDClasse int Not Null REFERENCES classe,
)

ALTER TABLE habilidade ADD Poder int

ALTER TABLE classe ALTER COLUMN caracteristicas varchar(500)

ALTER TABLE raca DROP COLUMN Perdido