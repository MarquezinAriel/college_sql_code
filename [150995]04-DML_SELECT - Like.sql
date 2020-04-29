--Passo 01
SELECT * FROM Player

--Passo 02
SELECT * FROM GameServer

--Passo 03
SELECT Name, UserName, Password FROM Player

--Passo 04
SELECT IP, Type FROM GameServer

--Passo 05
SELECT IP, Type, CreationDate FROM GameServer WHERE YEAR(CreationDate) BETWEEN '2005' AND '2018'

--Passo 06
SELECT UserName, Password, Age FROM Player WHERE Age IN (15, 20, 25, 30)

--Passo 07
SELECT Name, Password FROM Player WHERE Age = '38' AND Points > 650

--Passo 08
SELECT Name, UserName FROM Player WHERE Password LIKE '123'

--Passo 09
SELECT Name, UserName, Password FROM Player WHERE Name LIKE '%ana%'

--Passo 10
SELECT * FROM GameServer WHERE Type LIKE 'server%' AND YEAR(CreationDate) > '2013'

--Passo 11
SELECT Name, UserName FROM Player WHERE Password LIKE '_mudar'

--Passo 12
SELECT DISTINCT Type FROM GameServer