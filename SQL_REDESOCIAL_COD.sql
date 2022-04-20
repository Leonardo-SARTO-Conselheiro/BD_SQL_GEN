--DDL

CREATE DATABASE bd_redesociais_codigo --crianco um banco de dados

USE bd_redesociais_codigo -- para usar esse d.b

CREATE TABLE usuarios( --criar tabelas 
id INT PRIMARY KEY IDENTITY NOT NULL,
nome VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
senha VARCHAR (50) NOT NULL
)

CREATE TABLE postagens(
id INT PRIMARY KEY IDENTITY NOT NULL,
titulo VARCHAR(20) NOT NULL,
fk_usuario INT NOT NULL,
FOREIGN KEY (fk_usuario) REFERENCES usuarios (id)
)

CREATE TABLE grupos(
id INT PRIMARY KEY IDENTITY NOT NULL,
descricao VARCHAR(100) NOT NULL
)

CREATE TABLE interacoes(
id INT PRIMARY KEY IDENTITY NOT NULL,
comentarios VARCHAR(200) NULL,
curtidas INT NULL,
compartilhamentos  INT NULL,
vizualizações INT NULL,
fk_postagem INT NOT NULL,
fk_usuario INT NOT NULL,
FOREIGN KEY (fk_postagem) REFERENCES postagens(id),
FOREIGN KEY (fk_usuario) REFERENCES usuarios (id)
)


--DML

INSERT INTO grupos -- inserir informações na tabela
VALUES

('grupo dedicado a gatos'),
('grupo dedicado a cachorros'),
('grupo para doações de petz')


SELECT * FROM grupos -- ver as informações inseridas na tabela
WHERE descricao LIKE '%gato%'

DELETE grupos -- para deletar
WHERE ID = 15 -- where para passar o parametro, no caso o id 15


DBCC CHECKIDENT('grupos', RESEED, 0) -- para resetar do 0 a contagem do id 
