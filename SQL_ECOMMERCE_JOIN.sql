
-- DDL

CREATE DATABASE db_ecommerce_join

USE db_ecommerce_join

CREATE TABLE usuarios (
	id INT PRIMARY KEY IDENTITY not null,
	nome VARCHAR(100) not null,
	email VARCHAR(100) not null,
	senha VARCHAR(20) not null,
	endereco VARCHAR(200) not null)

	SELECT * FROM usuarios

CREATE TABLE produtos (
	id INT PRIMARY KEY IDENTITY not null,
	nome_produto VARCHAR(50) not null,
	preco_produto FLOAT not null,
	vagas INT not null,
	descricao VARCHAR(100) not null)

CREATE TABLE pedidos ( 
	id INT PRIMARY KEY IDENTITY not null,
	preco_total FLOAT not null,
	prazo_entrega VARCHAR(100) not null,
	fk_usuario INT not null,
	fk_produto INT not null,
	FOREIGN KEY (fk_usuario) REFERENCES usuarios (id), 
	FOREIGN KEY (fk_produto) REFERENCES produtos (id))

CREATE TABLE avaliacoes (
	id INT PRIMARY KEY IDENTITY not null,
	nome VARCHAR(100) not null,
	nota INT not null,
	link_imagem VARCHAR(200) null,
	mensagem VARCHAR (200) null,
	fk_pedido INT NOT NULL
	FOREIGN KEY (fk_pedido) references pedidos (id))

--DML

INSERT INTO usuarios
VALUES
('Leonardo','leonardo@gmail.com','123456fe','Rua dos paranaue'),
('Joceline','joceline@hotmail.com','fe123456','Travessa do Bob'),
('Karol','karol@outlook.com','123fe456','Avenida dos Loucos'),
('Guilherme','guilherme@outlook.com','456fe321','Avenida das flores'),
('Italo','italo@hotmail.com','321fe654','Travessa dos Sonhos'),
('Matheus','matheus@gmail.com','321fe456','Rua da GEN')

SELECT * FROM usuarios

INSERT INTO produtos
VALUES
('Curso de JAVA', 1100.00, 20, 'Curso de Java, das 08:00 às 17:00'),
('Curso de JavaScript', 800.00, 50, 'Curso de JS, focado em web, fullstack'),
('Curso de .NET', 900.00, 40, 'Focado em web, fullstack e das 08:00 às 17:00'),
('Curso de REACT', 500.00, 20, 'Curso exclusivo, focado em react, para aprimoramento do front'),
('Curso de SQL', 650.00, 50, 'Aprenda a desenvolver, estruturar e consultar DBs'),
('Curso de Express', 250.00, 100, 'Aprenda a fazer um API de mandeira rapida, utilizando JS')

SELECT * FROM produtos

INSERT INTO pedidos
VALUES
(1250,'até 48 horas após a aprovação', 1, 2),
(900,'aprovação imediada', 2, 3),
(650,'até 24 horas após a aprovação', 4, 5),
(1000,'sujeito a pré analise de conhecimento', 3, 4),
(600,'imediato', 5, 6),
(200,'até 12 horas após a aprovação', 6, 1)

SELECT * FROM pedidos

INSERT INTO avaliacoes
VALUES	
('Anoninmo',8, 'url/suifuagufafa', 'bom curso',1),
('Joaozinho',0, '', 'curso horrivel',6),
('Jony',5, 'url/auidauifga12452', '',2),
('Gabs',10, '', 'curso maravilgoso, muito conteudo',3),
('Tu',9, 'url/adgaudgu1234', '',5),
('Lari',2 , '', '',4)
--posso deixar os espaços em branco, pois usei null

SELECT * FROM avaliacoes

SELECT
usuarios.nome as Nome, -- para aparecer no banco como Nome
SUM(produtos.preco_produto) as 'Preço Final'
from usuarios
inner join pedidos on usuarios.id = pedidos.fk_usuario	
inner join produtos on pedidos.fk_produto = produtos.id
group by usuarios.nome;
-- para mostrar o preco final que o usuario pagou

SELECT
usuarios.nome as Nome, 
SUM(produtos.preco_produto) as 'Preço Final' -- para aparecer no banco como preco final 
from usuarios
inner join pedidos on usuarios.id = pedidos.fk_usuario	
inner join produtos on pedidos.fk_produto = produtos.id
where usuarios.nome like '%Leo%'
group by usuarios.nome;
-- para mostrar o preço final que o 'Leo' pagou 