/* Primeira Questão
Crie, no seu banco de dados, a tabela abaixo, insira os valores apresentados e em seguida escreva as consultas solicitadas abaixo.
OBS: Os valores em branco devem ser nulos no banco de dados.
*/

INSERT INTO vendas (ID_NF,
                    ID_ITEM,
                    COD_PROD,
                    VALOR_UNIT,
                    QUANTIDADE,
                    DESCONTO) VALUES (1, 1, 1, 25, 10, 5),
                                     (1, 2, 2, 13.5, 3, NULL),
                                     (1, 3, 3, 10, 1, NULL),
                                     (1, 5, 5, 30, 1, NULL),
                                     (2, 1, 3, 15, 4, NULL),
                                     (2, 2, 4, 10, 5, NULL),
                                     (2, 3, 5, 30, 7, NULL),
                                     (3, 1, 1, 25, 5, NULL),
                                     (3, 2, 4, 10, 4, NULL),
                                     (3, 5, 5, 30, 5, NULL),
                                     (3, 4, 2, 13.5, 7, NULL),
                                     (4, 1, 5, 30, 10, 15),
                                     (4, 2, 4, 10, 12, 5),
                                     (4, 3, 1, 25, 13, 5),
                                     (4, 4, 2, 13.5, 15, 5),
                                     (5, 1, 3, 15, 3, NULL),
                                     (5, 2, 5, 30, 6, NULL),
                                     (6, 1, 1, 25, 22, 15),
                                     (6, 2, 3, 15, 25, 20),
                                     (7, 1, 1, 25, 10, 3),
                                     (7, 2, 2, 13.5, 10, 4),
                                     (7, 3, 3, 15, 10, 4),
                                     (7, 4, 5, 30, 10, 1);

/* Letra A)
Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM,
COD_PROD E VALOR_UNIT.*/

SELECT id_nf,
       id_item,
       cod_prod,
       valor_unit
FROM   vendas
WHERE  desconto IS NULL;

/* Letra B)
Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, 
VALOR_UNIT E O VALOR VENDIDO.*/

SELECT id_nf,
       id_item,
       cod_prod,
       valor_unit,
       Round(valor_unit - ( valor_unit * desconto / 100 ), 2) AS VALOR_VENDIDO
FROM   vendas
WHERE  desconto IS NOT NULL; 

/* Letra C)
Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.*/

UPDATE vendas
SET    desconto = 0
WHERE  desconto IS NULL; 

/* Letra D)
Pesquise os itens que foram vendidos. As colunas presentes no resultado da consultasão: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT,
VALOR_TOTAL, DESCONTO, VALOR_VENDIDO.*/

SELECT id_nf,
       id_item,
       cod_prod,
       valor_unit,
       (quantidade * valor_unit) AS VALOR_TOTAL,
       Round(valor_unit - ( valor_unit * desconto / 100 ), 2) AS VALOR_VENDIDO
FROM   vendas; 

/* Letra E)
Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da 
consulta são: ID_NF, VALOR_TOTAL. Agrupe o resultado da consulta por ID_NF.
OBS: OVALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT.*/ 

SELECT id_nf,
       SUM( quantidade * valor_unit ) AS VALOR_TOTAL
FROM   vendas
GROUP  BY id_nf
ORDER  BY id_nf DESC; 

/* Letra F)
Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta 
são: ID_NF, VALOR_VENDIDO.*/

SELECT id_nf,
       SUM(valor_unit - ( valor_unit * desconto / 100 )) AS VALOR_VENDIDO
FROM   vendas
GROUP  BY id_nf
ORDER  BY VALOR_VENDIDO DESC 

/* Letra G)
Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da consulta são: COD_PROD, QUANTIDADE. Agrupe o
 resultado da consulta por COD_PROD.*/

SELECT cod_prod,
       SUM(quantidade) AS quantd
FROM   vendas
GROUP BY cod_prod 
ORDER BY quantd DESC

/* Letra H)
Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.As colunas presentes no resultado da consulta são: ID_NF, 
COD_PROD, QUANTIDADE.*/

SELECT cod_prod,
       Avg(desconto) AS media
FROM   primeira_atividade
WHERE  desconto NOT null;

/* Letra I)
Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor. As colunas 
presentes no resultado da consulta são: ID_NF, VALOR_TOT. Agrupe o resultado da consulta por ID_NF.
OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT.*/

SELECT id_nf,
       Sum(quantidade * valor_unit) AS VALOR_TOTAL
FROM   vendas
GROUP  BY id_nf
HAVING VALOR_TOTAL > 500
ORDER  BY valor_total DESC;

/* Letra J)
Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado
 da consulta por COD_PROD.*/

SELECT cod_prod,
       (desconto/quantidade) AS media
FROM   primeira_atividade
WHERE  desconto NOT null;

/* Letra K)
Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MENOR,
MAIOR, MEDIA. Agrupe o resultado da consulta por COD_PROD.*/

SELECT cod_prod,
       Max(desconto) AS maior,
       Min(desconto) AS menor,
       Avg(desconto) AS media
FROM   primeira_atividade
WHERE  desconto NOT null;





/* Segunda Questão
Crie uma base de dados chamada Universidade com as tabelas e insira os registros. */

CREATE DATABASE universidade;

CREATE TABLE alunos
  (
     mat      INT NOT NULL,
     nome     VARCHAR(40) NOT NULL,
     endereco VARCHAR(50) NOT NULL,
     cidade   VARCHAR(30) NOT NULL
  )

CREATE TABLE disciplinas
  (
     cod_disc  VARCHAR(20) NOT NULL,
     nome_disc VARCHAR(50) NOT NULL,
     carga_hor INT NOT NULL,
     PRIMARY KEY(cod_disc)
  )

CREATE TABLE professores
  (
     cod_prof INT NOT NULL,
     nome     VARCHAR(50) NOT NULL,
     endereco VARCHAR(50) NOT NULL,
     cidade   VARCHAR(50) NOT NULL,
     PRIMARY KEY(cod_prof)
  )

CREATE TABLE turma
  (
     id        INTEGER PRIMARY KEY NOT NULL,
     cod_turma INT NOT NULL,
     cod_disc  VARCHAR(20) NOT NULL,
     cod_prof  INT NOT NULL,
     ano       INT NOT NULL,
     horario   VARCHAR(20) NOT NULL,
     FOREIGN KEY (cod_disc) REFERENCES disciplinas(cod_disc),
     FOREIGN KEY(cod_prof) REFERENCES professores(cod_prof)
  )

CREATE TABLE historico
  (
     id         INTEGER PRIMARY KEY NOT NULL,
     mat        INT NOT NULL,
     cod_disc   VARCHAR(10) NOT NULL,
     cod_turma  INT NOT NULL,
     cod_prof   INT NOT NULL,
     ano        INT NOT NULL,
     frequencia INT NOT NULL,
     nota       DECIMAL(5, 2),
     FOREIGN KEY(mat) REFERENCES alunos(mat),
     FOREIGN KEY (cod_disc, cod_turma, cod_prof, ano) REFERENCES turma(cod_disc,
     cod_turma, cod_prof, ano)
  ) 


INSERT INTO 
	alunos (MAT, nome, endereco, cidade) 
VALUES 
	(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
	(2015010102, 'JOAO JOSE', 'AVENIDA RUY CARNEIRO', 'JO�O PESSOA'),
	(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
	(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
	(2015010105, 'JOSUE CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
	(2015010106, 'JOSUELISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');


INSERT INTO 
	disciplinas (COD_DISC, descricao, carga_horaria) 
VALUES
	('BD', 'BANCO DE DADOS', 100),
	('POO', 'PROGRAMACAOO ORIENTADA A OBJETOS', 100),
	('WEB', 'DESENVOLVIMENTO WEB', 50),
	('ENG', 'ENGENHARIA DE SOFTWARE', 80);


INSERT INTO
	professores (COD_PROF, nome, endereco, cidade)
VALUES
	(212131, 'NICKERSON FERREIRA', 'RUA MANAERA', 'JOAO PESSOA'),
	(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
	(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');
    

INSERT INTO
	turmas (COD_TURMA, ano, horario, COD_DISC, COD_PROF)
VALUES
	(1, 2015, '11H-12H', 'BD', '212131'),
	(2, 2015, '13H-14H', 'BD', '212131'),
	(1, 2015, '08H-09H', 'POO', '192011'),
	(1, 2015, '07H-08H', 'WEB', '192011'),
	(1, 2015, '10H-11H', 'ENG', '122135');


INSERT INTO 
	historico (frequencia, nota, MAT_ALUNO, ID_TURMA)
VALUES
	  (100.0, 7.5, 2015010101, 1),
    (100.0, 8.0, 2015010101, 3),
    (100.0, 9.0, 2015010101, 4),
    (100.0, 7.0, 2015010101, 5),
    (75.0, 6.5, 2015010102, 1),
    (100.0, 7.0, 2015010102, 3),
    (90.0, 8.0, 2015010102, 4),
    (100.0, 4.0, 2015010102, 5),
    (100.0, 6.0, 2015010103, 1),
    (100.0, 5.5, 2015010103, 3),
    (100.0, 3.0, 2015010103, 4),
    (100.0, 4.7, 2015010103, 5),
    (100.0, 4.0, 2015010104, 1),
    (100.0, 8.5, 2015010104, 3),
    (100.0, 7.5, 2015010104, 4),
    (100.0, 4.0, 2015010104, 5),
    (100.0, 4.9, 2015010105, 1),
    (100.0, 7.0, 2015010105, 3),
    (100.0, 9.0, 2015010105, 4),
    (100.0, 7.0, 2015010105, 5),
    (100.0, 4.4, 2015010106, 1),
    (100.0, 7.0, 2015010106, 3),
    (100.0, 7.0, 2015010106, 4),
    (100.0, 6.0, 2015010106, 5);

/* Letra A) 
Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas).*/

SELECT historico.mat_aluno AS matricula
FROM   historico
       INNER JOIN turmas
               ON historico.id_turma = turmas.id
WHERE  turmas.ano = 2015
       AND historico.nota < 5
       AND turmas.cod_disc = 'BD';

/* Letra B)
Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.*/

SELECT Avg(historico.nota) AS media_nota,
       turmas.cod_disc     AS disciplina
FROM   historico
       LEFT JOIN turmas
              ON tb_historico.id_turma = turmas.id
WHERE  turmas.ano = 2015
       AND turmas.cod_disc = 'POO'
GROUP  BY turmas.id; 

/* Letra C)
Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6.*/

SELECT a.mat AS matricula,
       a.nome
FROM   alunos a
       JOIN historico h
         ON h.mat = a.mat
WHERE  h.cod_disc = 'POO'
GROUP  BY a.mat
HAVING Avg(h.nota) > 6 

/* Letra D)
Encontre quantos alunos não são de Natal.*/

SELECT *
FROM   alunos
WHERE  cidade <> 'NATAL'; 