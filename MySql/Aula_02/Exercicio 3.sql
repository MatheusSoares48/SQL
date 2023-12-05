CREATE DATABASE db_farmacia;

USE db_farmacia;

-- Criar tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(250)
);

-- Inserir registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
    ('Medicamentos', 'Categoria de produtos medicamentosos'),
    ('Higiene Pessoal', 'Categoria de produtos de higiene pessoal'),
    ('Cosméticos', 'Categoria de produtos cosméticos'),
    ('Vitaminas', 'Categoria de produtos vitamínicos'),
    ('Acessórios', 'Categoria de acessórios para saúde');

SELECT * FROM tb_categorias;

-- Criar tabela tb_produtos
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    avaliacao INT,
    fabricacao DATE NOT NULL,
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(6, 2) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserir registros na tabela tb_produtos
INSERT INTO tb_produtos (nome_produto, avaliacao, fabricacao, marca, preco, categoria_id)
VALUES
    ('Paracetamol 500mg', 0, '2023-01-15', 'Farmácia Bem Estar', 15.90, 1),
    ('Sabonete Neutro', 0, '2023-02-20', 'Higiene Corp', 8.50, 2),
    ('Creme Facial Antirrugas', 0, '2023-03-10', 'Beleza Plus', 45.75, 3),
    ('Vitamina C 1000mg', 0, '2023-04-05', 'VitaSup', 30.00, 4),
    ('Termômetro Digital', 0, '2023-05-12', 'HealthTech', 12.50, 5),
    ('Shampoo Anticaspa', 0, '2023-06-20', 'HairCare', 22.90, 2),
    ('Protetor Solar FPS 50', 0, '2023-07-15', 'SunBlock', 35.50, 3),
    ('Omega-3 Suplemento', 0, '2023-08-10', 'NutriHealth', 55.00, 4);

SELECT * FROM tb_produtos;

-- SELECT que retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Cosméticos';
