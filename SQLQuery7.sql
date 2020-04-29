--EXERCICIO #1

CREATE TABLE Usuario_7
(
	UsuarioID numeric(18,0) primary key identity,
	Nome varchar(150) not null,
	Email varchar(100) not null,
	Telefone varchar(20) not null,
	Endereco varchar(100) not null,
	Bairro varchar(50),
	Cidade varchar(50) not null,
	Estado varchar(2) not null,
	CEP varchar(12) not null
)

CREATE TABLE Tipo_Recurso_7
(
	TipoRecursoID numeric(18,0) primary key identity,
	Nome varchar(50) not null,
	Descricao varchar(255)
)

CREATE TABLE Recurso_7
(
	RecursoID numeric(18,0) primary key identity,
	FKTipoRecursoID numeric(18,0) REFERENCES Tipo_Recurso_7(TipoRecursoID) not null,
	Nome varchar(50) not null,
	Descricao varchar(255)
)

CREATE TABLE Reserva_7
(
	ReservaID numeric(18,0) primary key identity,
	FKRecursoID numeric(18,0) REFERENCES Recurso_7(RecursoID) not null,
	FKUsuarioID numeric(18,0) REFERENCES Usuario_7(UsuarioID) not null,
	DataHoraInicioReserva datetime not null,
	DataHoraFimReserva datetime not null,
	Descricao varchar(255)
)

--EXERCICIO #2

INSERT INTO Usuario_7 (Nome, Email, Telefone, Endereco, Bairro, Cidade, Estado, CEP) VALUES
('Aquaman', 'arthur@aquaman.com', '1111-1111', 'Rua do Palacio', 'Distrito Real', 'Atlantida','OC', '18111-111'),
('Batman', 'bruce@batman.com', '2222-2222', 'Rua da Mansao', 'Distrito Wayne', 'Gothan City', 'US', '18222-222'),
('Diana', 'diana@wonderwoman.com', '3333-3333', 'Rua do Castelo', 'Distrito de Hera', 'Temissora', 'GK', '18333-333')

SELECT*FROM Usuario_7;

INSERT INTO Tipo_Recurso_7 (Nome, Descricao) VALUES
('Oceano', 'Os seres vivos do mar em geral'),
('Dinheiro', 'Para criar todo o arsenal'),
('Mitologia', 'Todo o poder e conhecimento dos deuses gregos')

SELECT*FROM Tipo_Recurso_7;

INSERT INTO Recurso_7 (FKTipoRecursoID, Nome, Descricao) VALUES
(1, 'Tridente', 'Centro do poder do rei'),
(2, 'Cinto', 'Todos os Gadgets'),
(3, 'Receptaculos', 'Todo o Arsenal Grego')

SELECT*FROM Recurso_7;

INSERT INTO Reserva_7 (FKRecursoID, FKUsuarioID, DataHoraInicioReserva, DataHoraFimReserva, Descricao) VALUES
(1, 1, getdate(), getdate(), 'nem sei pra que serve essa parte'),
(2, 2, getdate(), getdate(), 'nem sei pra que serve essa parte'),
(3, 3, getdate(), getdate(), 'nem sei pra que serve essa parte')

SELECT*FROM Reserva_7;

--EXERCICIO #3

--EX. A
SELECT Recurso_7.RecursoID, Recurso_7.Nome, Recurso_7.Descricao,
       Tipo_Recurso_7.TipoRecursoID, Tipo_Recurso_7.Nome
FROM Recurso_7 INNER JOIN Tipo_Recurso_7 ON Recurso_7.RecursoID = Tipo_Recurso_7.TipoRecursoID;

--EX. B
SELECT Reserva_7.ReservaID, Reserva_7.FKRecursoID, Reserva_7.FKUsuarioID,
       Recurso_7.Nome,
	   Usuario_7.Nome
FROM Reserva_7 INNER JOIN Usuario_7 ON Reserva_7.FKUsuarioID = Usuario_7.UsuarioID
INNER JOIN Recurso_7 ON Reserva_7.FKRecursoID = Recurso_7.RecursoID;

