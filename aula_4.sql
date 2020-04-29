CREATE TABLE #CONTATO
(
	ID int,
	Nome varchar(100),
	Email varchar(100),
	Percentual varchar(4)
)

INSERT INTO #CONTATO VALUES
	(1,'Maria de Fatima','mariaf@gmail.com','5%'),
	(2,'Antonio Jose','antoniojose@yahoo.com','15%'),
	(3,'Fernanda de Carvalho','fc@yahoo.com','70%'),
	(4,'Uelinton Josenildo','josenildo.u@gmail.com','35%'),
	(5,'Welinton Barbosa','wb@yahoo.com','84%'),
	(6,'Jose Carlos','zeca@yahoo.com','13%')

SELECT * FROM #CONTATO WHERE nome LIKE 'Maria de Fatima'

SELECT * FROM #CONTATO WHERE nome LIKE 'Jose%'

SELECT * FROM #CONTATO WHERE nome LIKE '%Jose%'

SELECT * FROM #CONTATO WHERE NOME LIKE '_elinton%'

SELECT * FROM #CONTATO WHERE NOME LIKE '[UW]elinton%'

SELECT * FROM #CONTATO WHERE NOME LIKE '[M-W]elinton%'

SELECT * FROM #CONTATO WHERE NOME LIKE '[^W]elinton%'

SELECT * FROM #CONTATO WHERE NOME LIKE '[^ABCD]elinton%'

SELECT * FROM #CONTATO WHERE NOME LIKE '[^A-D]elinton%'

