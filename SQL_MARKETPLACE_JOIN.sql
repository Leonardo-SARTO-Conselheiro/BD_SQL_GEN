-- DDL

CREATE DATABASE db_marketplace_join

USE db_marketplace_join

CREATE TABLE usuarios (
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	endereco VARCHAR(200) NOT NULL
)



CREATE TABLE produtos(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	preco FLOAT NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	link_imagem VARCHAR(500) NOT NULL,

)

CREATE TABLE pedidos(
	id INT PRIMARY KEY IDENTITY NOT NULL,
	preco FLOAT NULL,
	data_pedido VARCHAR(15) NOT NULL,
	prazo_entrega VARCHAR(100) NOT NULL,
	quantidade INT NOT NULL,
	status_pedido VARCHAR(100) NOT NULL,
	previsão_entrega VARCHAR(100) NOT NULL,
	fk_produto INT NOT NULL,
	FOREIGN KEY (fk_produto) REFERENCES produtos (id)
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

INSERT INTO usuarios
VALUES
('VK','vk@email.com','12356','rua da sorte'),
('Lu','lu@email.com','654321','avenida são josé'),
('Rique','rique@email.com','124671','travessa cony'),
('Digo','digo@email.com','76125','avenida tiradentes'),
('La','la@email.com','242712','rua tiberio')


INSERT INTO produtos
VALUES
('Blusa de Frio','150.00','Blusa da Lacoste, coleção inverno','url/audfgaug1q3141'),
('Calça Jeans','250.00','Calça da CK, Modelo slim, totalmente ajustavel ao corpo','url/adfuighadugu1341'),
('Carregador de Iphone','20','Produto paralelo, semelhante ao original','url/sudgqafgrqwfa'),
('Lanterna','500','Lanterna mais potente do mercado, ideal para noites escuras','url/183t183t131'),
('Adaptador de tomada','5','adaptador simples, para tomada de 3 pinos','url/sifgaudguafafa')


INSERT INTO pedidos
VALUES
(450, '23/04/2022','até 30 dias após a compra',3,'Aprovado', '05/05/2022',1),
(500, '23/04/2022','até 15 dias após a compra',2,'Aprovado', '02/05/2022',2),  
(25, '23/04/2022','até 15 dias após a compra',5,'Aprovado', '02/05/2022',5), 
(500, '23/04/2022','até 15 dias após a compra',1,'Aprovado', '02/05/2022',4), 
(120, '23/04/2022','até 15 dias após a compra',6,'Aprovado', '02/05/2022',3)


INSERT INTO avaliacoes
VALUES
('anonimo1','url/adugaudg131','ótimo produto', 2),
('VK','url/134141413123','carregador ruim',3),
('anonimo2','','lanterna de ótima qualidade',4),
('Lu','url/aidgqg1313','',5)

SELECT 
COUNT (id) as total
FROM
pedidos
-- saber total de pedidos

SELECT * FROM avaliacoes
WHERE fk_pedido BETWEEN 1 and 3;
-- para saber quantas avaliacoes foram feitas nos produtos de 1 a 3

SELECT
avaliacoes.mensagem, pedidos.preco  
FROM avaliacoes
RIGHT JOIN pedidos
ON pedidos.id = avaliacoes.fk_pedido

WHERE avaliacoes.mensagem IS NULL
 
 -- db apenas para treinar RIGHT JOIN, pois estava com certa dificuldade, desconsiderar o nexo de referências entre a tabela.

