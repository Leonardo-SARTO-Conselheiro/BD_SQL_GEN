CREATE DATABASE db_classificados_codigo --criando o banco de dados

USE db_classificados_codigo -- para usar esse d.b

CREATE TABLE usuarios( --criar tabelas
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(50) NOT NULL
)

CREATE TABLE postagens(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	link_imagem VARCHAR(500) NOT NULL,
	fk_usuario INT NOT NULL,
	FOREIGN KEY (fk_usuario) REFERENCES usuarios (id)
)


--DML

INSERT INTO usuarios -- povoar a tabela
VALUES
	('Romeu', 'romeu@yahoo.com', '0123bj'),
	('Jullieta', 'julieta@homtail.com', 'bj3210'),
	('Shake', 'shake@gmail.com', 'b21j03')


INSERT INTO postagens -- povoar a tabela
VALUES
	('Vagas de emprego', 'Vagas para dev junior', 'url/aihdfauhf13141',1),
	('Vagas de estagio', 'Pessoa deselvolvedora, cursando até o 4º ano da faculdade', 'url/aifugawfuw131',2),
	('O BOOM DA TECNOLOGIA', 'Com o boom da tecnologia na pandemia, será que vamos vivenciar uma nova bolha?', 'url/aufgaufgau',3),
	('Vagas de emprego remoto', 'Pessoa deselvolvedora pleno, para trabalhar com .NET de forma remota', 'url/aifugasfs124wfuw131',2),
	('Vagas de emprego presencial', 'tech leader, com extrema experiência em REACT e softskills ', 'url/a242ifug5awfuw12131',1)

SELECT * FROM postagens -- ver as informações inseridas na tabela
WHERE descricao LIKE '%junior%' -- where para passar o parametro

--no caso vai me mostrar as postagens e o id do usuario que fez a postagem


DELETE postagens -- para deletar
WHERE ID = 10 -- where para passar o parametro, no caso o id 10


DBCC CHECKIDENT('postagens', RESEED, 0) -- para resetar do 0 a contagem do id 

