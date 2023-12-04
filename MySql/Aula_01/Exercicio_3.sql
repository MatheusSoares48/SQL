-- Criar Banco de Dados
CREATE DATABASE IF NOT EXISTS db_escola;

-- Acessar o Banco de Dados
USE db_escola;

-- Criar Tabela
CREATE TABLE tb_estudantes(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
nota decimal (3,1) NOT NULL,
ano_de_ingresso varchar(20) NOT NULL,
RA int NOT NULL, 
turma varchar(20) NOT NULL,
PRIMARY KEY (id)
);

-- Insere valores na tabela
INSERT INTO tb_estudantes(nome, nota, ano_de_ingresso, RA, turma)
VALUES ("João Silva", 8.5, "2023", 12345678, "1A"),
("Maria Souza", 9.0, "2022", 98765432, "2A"),
("José Oliveira", 5.9, "2021", 01234567, "3A"),
("Ana Santos", 7.8, "2020", 99999999, "4A"),
("Pedro Lima", 6.5, "2019", 88888888, "5A"),
("Paula Rodrigues", 10.0, "2018",  77777777, "6A"),
("Carlos Pereira", 6.8, "2017", 66666666, "7A"),
("Júlia Martins", 8.0, "2023", 12345678, "8A");

-- Visualiza todos os dados
SELECT * FROM tb_estudantes;

-- Mostra os alunos com nota superior a 7.0
SELECT * FROM tb_estudantes WHERE nota > 7.0;
-- Mostra os alunos com nota inferior a 7.0
SELECT * FROM tb_estudantes WHERE nota < 7.0;

-- Atualiza a nota do Aluno Id 7 para 8
UPDATE tb_estudantes SET nota = 8.2 WHERE id = 7;

-- Desabilita o modo safe update, que impede a execução do update e do delete sem where
SET SQL_SAFE_UPDATES = 0;

-- Habilita o modo safe update
SET SQL_SAFE_UPDATES = 1;

-- Apaga todos os dados da tabela (Não é possível desfazer)
DELETE FROM tb_estudantes;

-- Ele remove não só a tabela da estrutura, mas seus dados índices, triggers e restrições associadas.
DROP TABLE tb_estudantes;