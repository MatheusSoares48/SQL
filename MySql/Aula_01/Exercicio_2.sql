-- Criar Banco de Dados
CREATE DATABASE db_e_commerce;

-- Acessar o Banco de Dados
USE db_e_commerce;

-- Criar Tabela
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
avaliacao int1,
fabricacao date NOT NULL,
marca varchar(255) NOT NULL, 
preco decimal (6,2) NOT NULL,
PRIMARY KEY (id)
);

-- Insere valores na tabela
INSERT INTO tb_produtos(nome, avaliacao, fabricacao, marca, preco)
VALUES ("Air-Force One", 9, "2023-06-30", "Nike", 799.99),
("Grand Court 2.0", 7, "2023-05-12", "Adidas", 284.99),
("Nike SB", 9, "2023-08-28", "Nike", 469.99),
("Old Skool", 6, "2023-08-08", "Vans", 399.99),
("Tênis Portofino", 8, "2023-02-28", "Dolce & Gabbana", 5850.00),
("Tênis All Star", 10, "2023-10-30", "All Star", 218.40),
("Tênis Flak 2", 9, "2022-12-30", "Oakley", 489.88),
("Tênis Smash V2", 10, "2023-09-27", "Puma", 349.99);

-- Visualiza todos os dados
SELECT * FROM tb_produtos;

-- Mostra os produtos com preço superior a 500
SELECT * FROM tb_produtos WHERE preco > 500.00;
-- Mostra os produtos com preço inferior a 500
SELECT * FROM tb_produtos WHERE preco < 500.00;

-- Mostra em PT-BR o preço dos produtos
SELECT nome, CONCAT ('R$ ' , FORMAT (preco, 2, 'pt_BR')) AS preço FROM tb_produtos;

-- Atualiza a fabricação do Produto Id 7 para 2023-12-30
UPDATE tb_produtos SET fabricacao = "2023-12-30" WHERE id = 7;