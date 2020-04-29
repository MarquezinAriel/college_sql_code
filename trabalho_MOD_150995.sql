--22-Escreva uma visão sobre a base de dados desenvolvida que utilize uma função de grupo e que seja útil 
--para a sua aplicação. OK
--23-Dê exemplo de um comando utilizando subconsultas que utilize o operador = ou <,>, <= etc. OK
--24-Dê exemplo de um comando utilizando subconsultas que utilize o operador in. OK
--25-Dê exemplo de um comando utilizando subconsultas que utilize o operador not in. OK
--26-Dê um exemplo de uma subconsulta dentro de um comando update. OK
--27-Dê um exemplo de uma consulta usando a operação de união OK
--28-Dê um exemplo de uma consulta usando a operação de interseção. OK
--29-Dê um exemplo de uma consulta usando a operação de diferença. OK

CREATE VIEW vwQuadro_Geral
AS
SELECT Aluno.AlunoID, Aluno.Nome, Matricula.AlunoID AS Lista_Matricula, Matricula.TurmaID AS N_Turma, Turma.TurmaID, Turma.Professor
--FROM Matricula INNER JOIN Aluno ON Matricula.AlunoID = Aluno.AlunoID INNER JOIN Turma ON  Matricula.TurmaID = Turma.TurmaID
FROM (SELECT Matricula.AlunoID FROM Matricula GROUP BY AlunoID ) A INNER JOIN Aluno ON Matricula.AlunoID = Aluno.AlunoID INNER JOIN Turma ON  Matricula.TurmaID = Turma.TurmaID;

SELECT Nome FROM Aluno WHERE AlunoID in (SELECT AlunoID FROM Notas Where Media > 5);

SELECT Nome FROM Aluno WHERE AlunoID not in (SELECT AlunoID FROM Notas Where Media > 5);

UPDATE Media SET Media + 2 WHERE AlunoID in (SELECT AlunoID FROM Notas Where Media > 1 AND Media < 3);

SELECT Nome FROM Aluno;
UNION ALL
SELECT Nome FROM Professor;

SELECT Nome FROM Aluno;
INTERSECT
SELECT Nome FROM Professor;

SELECT Nome FROM Aluno;
EXCEPT
SELECT Nome FROM Professor;