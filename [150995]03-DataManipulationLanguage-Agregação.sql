CREATE TABLE Raca
(
	IDRaca int PRIMARY KEY,
	Nome varchar(100) NOT NULL,
	Descricao varchar(500),
	Origem varchar(150) NOT NULL
)

CREATE TABLE Habilidade
(
	IDHabilidade int PRIMARY KEY,
	Nome varchar(200) NOT NULL,
	Poder int NULL
)

CREATE TABLE Personagem
(
	IDPersonagem int PRIMARY KEY,
	Nome varchar(100) NOT NULL,
	Descricao varchar(500) NULL,
	DataNascimento datetime NOT NULL,
	IDRaca int NOT NULL,
	IDClasse int NOT NULL,
)

CREATE TABLE Classe
(
	IDClasse int PRIMARY KEY,
	Nome varchar(100) NOT NULL,
	caracteristicas varchar(500) NULL,
	IDHabilidade int REFERENCES Habilidade,
)