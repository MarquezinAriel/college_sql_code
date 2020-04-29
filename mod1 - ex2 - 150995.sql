CREATE TABLE Player
(
	IDPlayer int PRIMARY KEY,
	Name varchar(100) not null,
	UserName varchar(20),
	Password Varchar(20),
	Points int,
	IDGameServer int REFERENCES GameServer (IDGameServer),

)
CREATE TABLE GameServer
(
	IDGameServer int PRIMARY KEY,
	IP varchar(30),
	Type varchar(100),
	CreationDate datetime,
	DNSServer int,
)
ALTER TABLE Player ADD Age int
ALTER TABLE GameServer DROP COLUMN DNSServer
--ITEM 1
INSERT INTO Player (IDPlayer, Name, UserName, Password, Points, Age)
VALUES  (1, 'Arthur', 'Aquaman', 'atlantida', 1000, 40),
		(2, 'Bruce', 'Batman', 'batcaverna', 1000, 42),
		(3, 'Clark', 'Superman', 'krypton', 900, 41),
		(4, 'Diana', 'Wonder Woman', 'atemiris', 740, 300),
		(5, 'Barry Allen', 'Flash', 'faster', 1000, 35)

INSERT INTO GameServer (IDGameServer, IP, Type, CreationDate)
VALUES  (10, '19.111', 'standard', '2019-01-01'),
		(20, '19.112', 'GameMaster', '2019-01-15'),
		(30, '19.113', 'professional', '2013-02-01'),
		(40, '19.114', 'Divinity', '2019-02-15'),
		(50, '19.115', 'Peer-to-Peer', '2019-03-01')

--ITEM 2
UPDATE GameServer SET Type = 'P2P' WHERE Type = 'Peer-to-Peer'
--ITEM 3
UPDATE Player SET Points = 2*Points
--ITEM 4
ALTER TABLE Player modify UserName varchar(5)
--ITEM 5
UPDATE Player SET Password = '123'
--ITEM 6
DELETE FROM Player WHERE Name = 'Cosme'
--ITEM 7
DELETE FROM GameServer WHERE CreationDate > YEAR(2010) and CreationDate < YEAR(2013)
--ITEM 8
DELETE FROM Player WHERE Points < 750
--ITEM 9
DELETE FROM Player WHERE Age > 50