--DDL

CREATE DATABASE bd_ecommerce_codigo --crianco um banco de dados

USE bd_ecommerce_codigo -- para usar esse d.b

CREATE TABLE usuarios ( --criar tabelas
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	email VARCHAR(30) NOT NULL,
	cep VARCHAR(10) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	endereco VARCHAR(100) NOT NULL
)

CREATE TABLE produtos(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	link_imagem VARCHAR(500) NOT NULL,
)

CREATE TABLE categorias(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50),
	link_imagem VARCHAR(500)
)

CREATE TABLE categoria_produto(
	fk_categoria INT NOT NULL,
	fk_produto INT NOT NULL,
	FOREIGN KEY (fk_categoria) REFERENCES categorias (id),
	FOREIGN KEY (fk_produto) REFERENCES produtos (id)
)

CREATE TABLE pedidos(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	preco FLOAT NULL,
	data_pedido VARCHAR(15) NOT NULL,
	quantidade INT NOT NULL,
	status_pedido VARCHAR(20) NOT NULL,
	previsão_entrega VARCHAR(20) NOT NULL,
)
	
CREATE TABLE produto_pedido(
	fk_usuario INT NOT NULL,
	fk_produto INT NOT NULL,
	fk_pedidos INT NOT NULL,
	FOREIGN KEY (fk_usuario) REFERENCES usuarios (id),
	FOREIGN KEY (fk_produto) REFERENCES produtos (id),
	FOREIGN KEY (fk_pedidos) REFERENCES pedidos (id)
)

CREATE TABLE avaliacoes(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NULL,
	link_imagem VARCHAR(500) NULL,
	mensagem VARCHAR(250) NULL,
	fk_pedido INT NOT NULL,
	FOREIGN KEY (fk_pedido) REFERENCES pedidos (id)
)

--DML

INSERT INTO produtos -- inserir informações na tabela
VALUES
('Tenis da Nike', 'Tenis para atletas, focado em corrida', 'url/12131414r1'),
('Blusa da Adidas', 'Blusa social, perfeita para o final de semana', 'url/sadfaf131451'),
('Calça da Armani', 'Calça jeans, totalmente ajustavel, perfeita em qualquer tipo de corpo', 'url/242152klke21')

SELECT * FROM produtos -- ver as informações inseridas na tabela
WHERE nome LIKE '%armani%' -- where para passar o parametro, no caso armani no nome

DELETE produtos -- para deletar, no caso da tabela produtos
WHERE ID = 5 -- where para passar o parametro, no caso o id 5

DBCC CHECKIDENT('produtos', RESEED, 0) -- para resetar do 0 a contagem do id 

DELETE 