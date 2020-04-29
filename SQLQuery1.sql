create table Usuario
(
	UsuarioID int primary key identity,
	Nome varchar(200) not null,
	LoginUsuario varchar(50) not null,
	UltimoAcesso datetime
)

create table artigo
(
	ArtigoID int primary key identity,
	Titulo varchar(500),
	Texto varchar (max),
	UsuarioID int REFERENCES Usuario (UsuarioID),
	DataCadastro datetime,
	URL varchar(150)
)