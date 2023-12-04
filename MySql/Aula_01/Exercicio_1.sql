-- Criar Banco de Dados
CREATE DATABASE db_rh_empresa;

-- Acessar o Banco de Dados
USE db_rh_empresa;

-- Criar Tabela
CREATE TABLE tb_colaboradores(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
data_nascimento date, 
data_admissao date,
cargo varchar(255) NOT NULL, 
salario decimal (8,2) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela
INSERT INTO tb_colaboradores(nome, data_nascimento, data_admissao, cargo, salario)
VALUES ("Roger Senna","1990-04-10", "2023-11-30", "Desenvolvedor Jr", 6000.00);

INSERT INTO tb_colaboradores(nome, data_nascimento, data_admissao, cargo, salario)
VALUES ("Antonio Bandeira","1985-08-10", "2020-02-21", "Designer Jr", 3000.90),
("Maria Romero","2000-04-10", "2022-10-17", "Recepcionista", 1990.80),
("Marcia Cavalcante","2002-06-23", "2023-02-24", "Estagiaria Tech", 1500.00),
("Malala Yousafzai","1997-07-12", "2012-10-09", "Presidente de Bem-Estar", 500000.00);

/* Visualizar os dados*/ -- Visualiza todos os dados
SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 3000.00 WHERE id = 4;

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;

-- Apaga todos os dados da tabela (Não é possível desfazer)
DELETE FROM tb_colaboradores;
