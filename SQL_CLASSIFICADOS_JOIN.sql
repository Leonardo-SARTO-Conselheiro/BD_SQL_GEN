
-- DDL

CREATE DATABASE db_classificados_join

USE db_classificados_join

CREATE TABLE usuarios (
	id INT PRIMARY KEY IDENTITY not null,
	nome VARCHAR(100) not null,
	email VARCHAR(100) not null,
	senha VARCHAR(20) not null,
	endereco VARCHAR(200) not null)



CREATE TABLE postagens(
	id INT PRIMARY KEY IDENTITY not null,
	titulo VARCHAR(100) not null,
	descricao VARCHAR(200) not null,
	link_imagem VARCHAR(500) null,
	fk_usuario INT NOT NULL,
	FOREIGN KEY (fk_usuario) REFERENCES usuarios (id))

	--DML

INSERT INTO usuarios
VALUES
('Donny','dony@gmail.com','1234','rua lalala'),
('Tico','tico@hotmail.com','4321','rua blabla'),
('Teco','teco@outlook.com','3241','rua papapa'),
('Lucky','lucky@outlook.com','1324','rua pitanga'),
('Nemesis','nemesis@gmail.com','abcde','avenida clara'),
('Ivo','ivono@gmail.com','edcba','avenida dos gansos'),
('Dean','dean@gmail.com','dcbae','avenida dos loucos'),
('Mulder','mulder@gmail.com','eabcd','travessa dos sonhos'),
('Peralta','peralta@hotmail.com','daebc','travessa da vida'),
('Ceni','ceni@gmail.com','ceabd','travessa trimundial')

SELECT * FROM usuarios

INSERT INTO postagens
VALUES
('Vende-se Cursos','Vende-se cursos de programação, focado em back-end','url/auighdaugdfafa', 4),
('Compra-se terreno','Compra-se terrenos na grande São Paulo','',1),
('Vagas de emprego','Vagas de emprego no centro de SP','',2),
('Compra-se terreno','Compra-se terrenos no litoral paulista','',1),
('Cursos gratuitos','Cursos gratuitos para recolocação profissional','',3),
('Escolinha de futebol','venha conhecer a escolinha do melhor goleiro do mundo','url/sufgaudf1243',10),
('Procura-se','Procura-se bandido que fugiu da 89','url/auadghuagdu1212',9),
('CUIDE-SE','O Governo está abduzindo pessoas e implantando chips nelas','url/adgauygda',8),
('Procura-se fantasmas','Sou da familia winchester, procuramos fantasmas para caçar','',7),
('DESAPARECIDO','Meu pai desapareceu, preciso acha-lo!','url/aifdguqr141',7),
('PQP é o melhor goleiro do BRASIL','Esse é Rogério Ceni, o goleiro artileiro','url/adugadu14141',10),
('Procuro minha irmã','Procuro minha irma Samanta, que foi abduzida','url/ahdaugdu1341',8),
('ELES ESTÃO ENTRE NÓS','Ets estão entre nós, vamos nos cuidar!!!','',8),
('Vende-se Cursos','Vende-se cursos de programação, focado em front-end','url/dfaifhafa', 4),
('Compra-se bala do colt','Compro valas da lendária arma colt','',7),
('Jogos lendarios de PS1','Compra e vendas de jogos lendários de PS1 e PS2, venha jogar','url/adghaudgu121431',5),
('Venha para o Japão','Venha conhecer uma das culturas mais diferentes do muundo','url/aidhaihdi12141',6)

SELECT * FROM postagens

SELECT 
	COUNT (id) as total
FROM
	postagens
-- para saber a quantidade de postagens

SELECT * FROM postagens
WHERE fk_usuario BETWEEN 5 and 10;
-- para saber as postagens feitas pelos usuarios de 5 a 10