SELECT * FROM Raca

SELECT * FROM Personagem

SELECT * FROM Habilidade

SELECT * FROM classe

--exercicio 01
SELECT * FROM Personagem

--exercicio 02
SELECT Nome, Descricao, Origem FROM Raca

--exercicio 03
SELECT Nome, caracteristicas FROM classe

--exercicio 04
SELECT Nome, Descricao, DataNascimento FROM Personagem WHERE YEAR(DataNascimento) BETWEEN '1990' AND '2000'

--exercicio 05
SELECT Nome, Poder FROM Habilidade WHERE Nome LIKE '%Força%'

--exercicio 06
SELECT * FROM Habilidade WHERE Poder > '50'

--exercicio 07
SELECT DISTINCT Origem FROM Raca

--exercicio 08
SELECT COUNT(*) FROM Personagem

--exercicio 09
SELECT MAX(DataNascimento), MIN(DataNascimento) FROM Personagem

--exercicio 10
SELECT SUM(Poder), AVG(Poder) FROM Habilidade

--exercicio 11
SELECT IDHabilidade, Count(Nome) FROM classe GROUP BY IDHabilidade

--exercicio 12
SELECT IDRaca, Count(Nome) FROM Personagem GROUP BY IDRaca

--exercicio 13
SELECT Origem, Count(Nome) FROM Raca GROUP BY Origem

--exercicio 14
SELECT DataNascimento, Count(Nome) FROM Personagem GROUP BY DataNascimento

--exercicio 15
SELECT MAX(Poder), MIN(Poder) FROM Habilidade
