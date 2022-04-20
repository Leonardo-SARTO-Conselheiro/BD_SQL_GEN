--DDL

CREATE DATABASE bd_marketplace_codigo  --criando o banco de dados

USE bd_marketplace_codigo -- para usar esse d.b

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


INSERT INTO usuarios  --inserir informações na tabela
VALUES

('Leonardo Sarto', '000.111.222-33', 'leonardo@gmail.com', '0000-111', '51 11 9 9999-9999', 'abc123', 'rua paranaue n10'),
('Liza Sarto', '111.222.333-44', 'liza@gmail.com', '1111-222', '51 11 9 8888-8888', '123cba', 'avenida ratata n1005'),
('Nil Silva', '222.333.444-55', 'nil@gmail.com', '2222-333', '51 11 9 7777-7777', '1c2b3a', 'travessa dos sonhos n202')



SELECT * FROM usuarios -- ver as informações inseridas na tabela
WHERE endereco LIKE '%sonhos%' -- where para passar o parametro


DELETE usuarios -- para deletar
WHERE ID = 7 -- where para passar o parametro, no caso o id 7


DBCC CHECKIDENT('usuario', RESEED, 0) -- para resetar do 0 a contagem do id 
