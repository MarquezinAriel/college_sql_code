SELECT * FROM Player
SELECT * FROM GameServer

--PARTE 01
SELECT COUNT(*) FROM Player

--PARTE 02
SELECT COUNT(*) FROM GameServer

--PARTE 03
SELECT MAX(CreationDate), MIN(CreationDate) FROM GameServer

--PARTE 04
SELECT AVG(Age) FROM Player

--PARTE 05
SELECT SUM(Age) FROM Player

--PARTE 06
SELECT Age, COUNT(*) FROM Player GROUP BY Age

--PARTE 07
SELECT Type, COUNT(*) FROM GameServer GROUP BY Type

--PARTE 08
SELECT MAX(Age), MIN(Age) FROM Player

--PARTE 09
SELECT IDGameServer, AVG(Age) FROM Player GROUP BY IDGameServer HAVING (AVG(Age) >= 18)

--PARTE 10
SELECT IDGameServer, SUM(Points) FROM Player GROUP BY IDGameServer HAVING (SUM(Points) < 55)