CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- Criar tabela tb_categorias
CREATE TABLE tb_categorias (
	id bigint AUTO_INCREMENT,
    nome_categoria VARCHAR(50),
    descricao_categoria TEXT,
    PRIMARY KEY (id)
);

-- Inserir registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
    ('Calabresa', 'Categoria com pizzas de calabresa'),
    ('Vegetariana', 'Categoria com pizzas vegetarianas'),
    ('Frango com Catupiry', 'Categoria com pizzas de frango com catupiry'),
    ('Margherita', 'Categoria com pizzas do tipo Margherita'),
    ('Quatro Queijos', 'Categoria com pizzas de quatro queijos');

SELECT * FROM tb_categorias;

-- Criar tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id BigInt AUTO_INCREMENT,
    nome_pizza VARCHAR(50),
    preco_pizza DECIMAL(5, 2),
    ingredientes_pizza VARCHAR(250),
    categoria_id BigInt,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserir registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, preco_pizza, ingredientes_pizza, categoria_id)
VALUES
    ( 'Calabresa Especial', 47.90, 'Calabresa, cebola, tomate, mussarela', 1),
    ( 'Vegetariana Suprema', 62.50, 'Mussarela, tomate, pimentão, cebola, azeitonas', 2),
    ( 'Frango Catupiry Delight', 60.75, 'Frango desfiado, catupiry, milho, mussarela', 3),
    ( 'Margherita Tradicional', 40.00, 'Molho de tomate, mussarela, manjericão', 4),
    ( 'Quatro Queijos Supreme', 51.90, 'Mussarela, gorgonzola, parmesão, catupiry', 5),
    ( 'Portuguesa Premium', 78.90, 'Presunto, mussarela, ovos, cebola, azeitonas', 1),
    ( 'Califórnia Light', 53.20, 'Peito de peru, abacaxi, milho, mussarela', 2),
    ( 'Pepperoni Explosion', 27.50, 'Pepperoni, mussarela, pimenta, cebola', 1);

SELECT * FROM tb_pizzas;

-- Ordena pizzas por nome
SELECT *FROM tb_pizzas ORDER BY nome_pizza Desc;
-- Ordena as pizzas por preço maior que 45.00
SELECT*FROM tb_pizzas WHERE preco_pizza > 45.00 ORDER BY preco_pizza Desc; 
-- Ordena os pizzas por preço entre 50 e 100
SELECT *FROM tb_pizzas WHERE preco_pizza BETWEEN 50 AND 100 ORDER BY preco_pizza Desc;

-- Mostra todos os personagens que possuem "M" no nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE "%M%";

-- Junta a tabela categoria e a tabela pizza e mostra por ordem alfabetica
SELECT nome_pizza, CONCAT ('R$ ' , FORMAT (preco_pizza, 2, 'pt_BR')) AS preco, ingredientes_pizza, tb_categorias.nome_categoria, tb_categorias.descricao_categoria 
FROM tb_pizzas INNER JOIN tb_categorias
on tb_pizzas.categoria_id = tb_categorias.id ORDER BY nome_pizza Desc;

-- Junta a tabela categoria e a tabela pizza, mostra por ordem alfabetica e mostra todas as pizzas da categoria vegetariana
SELECT nome_pizza, CONCAT ('R$ ' , FORMAT (preco_pizza, 2, 'pt_BR')) AS preco, ingredientes_pizza, tb_categorias.nome_categoria, tb_categorias.descricao_categoria 
FROM tb_pizzas INNER JOIN tb_categorias
on tb_pizzas.categoria_id = tb_categorias.id WHERE tb_pizzas.categoria_id = 2  ORDER BY nome_pizza Desc;

DROP DATABASE db_pizzaria_legal;