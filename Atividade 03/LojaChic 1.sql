/*
Revisaão de comandos SQL MySQL - Padrão ANSI'92
*/

-- Criar banco de dados;
CREATE DATABASE LojaChic;

-- Alterar para o banco "LojaChic";
USE LojaChic;

-- Crie a tabela;
CREATE TABLE TB_Cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(80) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(80)
);

-- Insira dados;
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES
('João da Silva', '111.222.333-44', '1990-05-15', '(11) 98765-4321', 'joao.silva@gmail.com'),
('Maria Oliveira', '555.666.777-88', '1985-08-20', '(21) 99999-8888', 'maria.oliveira@hotmail.com'),
('Pedro Santos', '999.888.777-66', '1992-11-10', '(31) 33333-4444', 'pedro.santos@gmail.com'),
('Ana Souza', '444.555.666-99', '1988-03-25', '(41) 77777-2222', 'ana.souza@gmail.com'),
('Carlos Pereira', '222.333.444-55', '1979-12-05', '(51) 22222-7777', 'carlos.pereira@gmail.com'),
('Julia Ferreira', '888.999.000-11', '1995-09-30', '(62) 44444-5555', 'julia.ferreira@hotmail.com'),
('Marcos Lima', '777.888.999-22', '1982-07-18', '(85) 55555-6666', 'marcos.lima@terra.com.br'),
('Fernanda Gomes', '666.777.888-33', '1991-02-12', '(92) 11111-9999', 'fernanda.gomes@gmail.com'),
('Luiz Almeida', '333.444.555-00', '1987-06-28', '(99) 66666-3333', 'luiz.almeida@gmail.com'),
('Sofia Rodrigues', '000.111.222-33', '1980-04-08', '(14) 88888-1111', 'sofia.rodrigues@gmail.com');

-- ou usando esta forma;
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('João da Silva', '111.222.333-44', '1990-05-15', '(11) 98765-4321', 'joao.silva@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Maria Oliveira', '555.666.777-88', '1985-08-20', '(21) 99999-8888', 'maria.oliveira@hotmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Pedro Santos', '999.888.777-66', '1992-11-10', '(31) 33333-4444', 'pedro.santos@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Ana Souza', '444.555.666-99', '1988-03-25', '(41) 77777-2222', 'ana.souza@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Carlos Pereira', '222.333.444-55', '1979-12-05', '(51) 22222-7777', 'carlos.pereira@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Julia Ferreira', '888.999.000-11', '1995-09-30', '(62) 44444-5555', 'julia.ferreira@hotmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Marcos Lima', '777.888.999-22', '1982-07-18', '(85) 55555-6666', 'marcos.lima@terra.com.br');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Fernanda Gomes', '666.777.888-33', '1991-02-12', '(92) 11111-9999', 'fernanda.gomes@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Luiz Almeida', '333.444.555-00', '1987-06-28', '(99) 66666-3333', 'luiz.almeida@gmail.com');
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Sofia Rodrigues', '000.111.222-33', '1980-04-08', '(14) 88888-1111', 'sofia.rodrigues@gmail.com');

-- Verifique se os dados foram inseridos;
SELECT * FROM TB_Cliente;

-- Select com limite de dados retornados;
SELECT * FROM TB_Cliente LIMIT 5;

-- Select com limite de dados retornados ordenando pelo nome;
SELECT * FROM TB_Cliente ORDER BY nome LIMIT 5;

-- Consulta;
/*Localize todos os clientes que possuem DDD 85 e 51;
Deve retornar somente os id's 5 e 7;*/
SELECT * FROM TB_Cliente WHERE telefone LIKE '(85)%' OR telefone LIKE '(51)%';

/*Localize todos os clientes que possuem email do domínio terra.com.br;
Deve retornar somente o id 7;*/
SELECT * FROM TB_Cliente WHERE email LIKE '%@terra.com.br';

/*Localize todos os clientes que possuem sobrenome Rodrigues e Silva;
Deve retornar somente os id's 1 e 10;*/
SELECT * FROM TB_Cliente WHERE nome LIKE '% Rodrigues' OR nome LIKE '% Silva';

/*Localize todos os clientes que possuem o mês de aniversário 07;
Deve retornar somente o id 7;

Localize todos os clientes que possuem o anod enascimento 1988;
Deve retornar somente o id 4;*/

-- Usando MySQL;
SELECT * FROM TB_Cliente WHERE MONTH(data_nascimento) = 7;

-- Usando SQLite;
SELECT * FROM TB_Cliente WHERE strftime('%m', data_nascimento) = '07';
SELECT * FROM TB_Cliente WHERE strftime('%Y', data_nascimento) = '1988';

-- Exemplos de funções de datas no SQLite;

-- Retorna a data, do servidor onde o SQLite está sendo executado;
SELECT date('now');

-- Retorna o último dia do mês corrente;
SELECT date('now', 'start of month', '+1 month', '-1 day');

-- Retorna a hora atual;
SELECT time('now');

-- Retorna a diferença em segundos entre duas datas;
SELECT strftime('&s','now') - strftime('%s','2012-01-01 12:00:00');

/*Localize todos os clientes que possuem o mês de aniversário 03 e tenham email do domínio @gmail.com;
Deve retornar somente o id 4;*/
SELECT * FROM TB_Cliente WHERE strftime('%m', data_nascimento) = '03' AND email LIKE '%@gmail.com';

-- Altere os dados;

/*Altere todos os domínios de e-mail @hotmail.com para @outlook.com
Somente os registros id's 2 e 6 serão alterados;*/

UPDATE TB_Cliente
SET email = REPLACE(email, '@hotmail.com', '@outlook.com')
WHERE email LIKE '%@hotmail.com';

/*Altere o cpf 333.444.555-00 para 333.444.555-12
Somente o registro id 9 deve ser alterado;*/

UPDATE TB_Cliente
SET cpf = '333.444.555-12'
WHERE cpf = '333.444.555-00';

-- Deletar;

-- Todos os registros igual a 7;
-- 1 registro;
DELETE FROM TB_Cliente 
WHERE id = 7;

-- Melhor escolha;
DELETE FROM TB_Cliente
WHERE id = 7 AND cpf = '777.888.999-22';

-- Todos os registros em que o nome termine com Rodrigues e o cpf seja igual a 000.111.222-33;
DELETE FROM TB_Cliente
WHERE nome LIKE '% Rodrigues' AND cpf = '000.111.222-33';

-- Inserir mais um registro;
INSERT INTO TB_Cliente (nome, cpf, data_nascimento, telefone, email) VALUES ('Wagner Lucca', '666.666.666-66', '1979-01-12', '(11) 00000-0000', 'wagner.lucca@etec.sp.gov.br');

-- Comando de manutenção, apaga o espaço lógico do disco, referente os dados deletados, equivalente a shrink em outros SGBS's;
VACUUM;





