--22-Escreva uma vis�o sobre a base de dados desenvolvida que utilize uma fun��o de grupo e que seja �til 
--para a sua aplica��o. OK
--23-D� exemplo de um comando utilizando subconsultas que utilize o operador = ou <,>, <= etc. OK
--24-D� exemplo de um comando utilizando subconsultas que utilize o operador in. OK
--25-D� exemplo de um comando utilizando subconsultas que utilize o operador not in. OK
--26-D� um exemplo de uma subconsulta dentro de um comando update. OK
--27-D� um exemplo de uma consulta usando a opera��o de uni�o OK
--28-D� um exemplo de uma consulta usando a opera��o de interse��o. OK
--29-D� um exemplo de uma consulta usando a opera��o de diferen�a. OK

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