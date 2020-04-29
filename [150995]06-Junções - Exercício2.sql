SELECT * FROM classe
SELECT * FROM Habilidade
SELECT * FROM Personagem
SELECT * FROM Raca

--exercicio 01
SELECT A.Nome, B.Nome, DataNascimento FROM Personagem A INNER JOIN Raca B on A.IDRaca = B.IDRaca

--exercicio 02
SELECT A.Nome, B.Nome, Caracteristicas FROM Personagem A INNER JOIN classe B on A.IDClasse = B.IDClasse

--exercicio 03
SELECT A.Nome, B.Nome FROM classe A INNER JOIN Habilidade B on A.IDHabilidade = B.IDHabilidade

--exercicio 04
SELECT A.Nome, Origem FROM Personagem A INNER JOIN Raca B on A.IDRaca = B.IDRaca where YEAR(DataNascimento) >= 1980

--exercicio 05
SELECT A.Nome, Caracteristicas FROM Personagem A INNER JOIN classe B on A.IDClasse = B.IDClasse where B.Nome = 'Mago'

--exercicio 06
SELECT A.Nome, B.Nome, Poder FROM classe A INNER JOIN Habilidade B on A.IDHabilidade = B.IDHabilidade where Poder between 50 and 100

--exercicio 07
SELECT B.Nome, COUNT(*) FROM Personagem A INNER JOIN Raca B on A.IDRaca = B.IDRaca GROUP BY (B.Nome)

--exercicio 08
SELECT B.Nome, COUNT(*) FROM Personagem A INNER JOIN classe B on A.IDClasse = B.IDClasse GROUP BY (B.Nome)

--exercicio 09
SELECT A.Nome, B.Nome, C.Nome, D.Nome FROM Personagem A INNER JOIN Raca B on A.IDRaca = B.IDRaca INNER JOIN classe C on A.IDClasse = C.IDClasse INNER JOIN Habilidade D on C.IDHabilidade = D.IDHabilidade