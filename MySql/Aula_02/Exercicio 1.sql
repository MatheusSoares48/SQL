CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
id bigint AUTO_INCREMENT,
classe varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_classes
INSERT INTO tb_classes (classe)
VALUES ("Mago"),
("Arqueiro"),
("Guerreiro");

-- Lista todos os dados da tabela tb_classes
SELECT * FROM tb_classes;

CREATE TABLE tb_personagens(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
nivel int, 	
criacao date NULL,
defesa decimal(6, 2) NOT NULL,
ataque decimal(6, 2) NOT NULL,
inteligencia decimal(6, 2) NULL,
classes_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (classes_id) REFERENCES tb_classes(id)
);

-- Insere dados na tabela tb_personagens
INSERT INTO tb_personagens (nome, nivel, criacao, ataque, defesa, classes_id)
VALUES ("Biljorn", 67, "2023-05-07", 2000.20, 3600, 3),
("Legolas", 52, "2023-08-12", 3000.20, 1000, 2),
("Tobias o covarde", 30, "2023-06-05", 200.20, 5000.80, 3),
("Olaf", 78, "2023-09-26", 3200.20, 2000, 3);

-- Classe Mago com o adicional de Inteligencia
INSERT INTO tb_personagens (nome, nivel, criacao, ataque, defesa, inteligencia, classes_id)
VALUES ("Gandalf", 90, "2023-10-17", 700.00, 500, 6000, 1);

SELECT * FROM tb_personagens;

-- Ordena personagens por Nivel
SELECT *FROM tb_personagens ORDER BY nivel Desc;
-- Ordena os personagens por Ataque maior que 2.000
SELECT*FROM tb_personagens WHERE ataque > 2000 ORDER BY ataque Desc; 
-- Ordena os personagens por Defesa entre 1.000 e 2.000
SELECT *FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000 ORDER BY defesa Desc;

-- Mostra todos os personagens que possuem "C" no nome
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

-- Junta a tabela classe e a tabela personagens e mostra por nivel
SELECT nome, nivel, ataque, defesa, inteligencia, tb_classes.classe 
FROM tb_personagens INNER JOIN tb_classes
on tb_personagens.classes_id = tb_classes.id ORDER BY nivel Desc;

-- Junta a tabela classe e a tabela personagens e mostra por nivel somente os personagens da classe guerreiro
SELECT nome, nivel, ataque, defesa, inteligencia, tb_classes.classe 
FROM tb_personagens INNER JOIN tb_classes
on tb_personagens.classes_id = tb_classes.id WHERE tb_personagens.classes_id = 3 ORDER BY nivel Desc;
