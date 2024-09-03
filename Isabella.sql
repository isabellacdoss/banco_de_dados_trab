
-- criando o bando de dados 
-- CREATE DATABASE previdencia;
USE previdencia;

-- criando a tabela endereço
CREATE TABLE endereco
(codEND INT AUTO_INCREMENT PRIMARY KEY, 
cidade VARCHAR(20), 
CEP CHAR(8), 
logradouro VARCHAR (20),
estado VARCHAR (20));

-- criando a tabela cliente 
CREATE TABLE cliente
(CPF CHAR(11), 
nome VARCHAR(50),
RG CHAR(11),
FOREIGN KEY (CNPJ) REFERENCES banco(CNPJ),  -- a tabela banco é da mika
FOREIGN KEY (codEND) REFERENCES endereco(codEND)); 



-- criando a tabela telefone
CREATE TABLE telefone
(DD_numero CHAR(2), 
numero CHAR(9))
 -- cpnj ou cpf como chave primária e secundária: como colocar?
 
-- criando a tabela funcionário
-- CREATE  TABLE funcionario
-- (CPF CHAR(11) PRIMARY KEY, FOREIGN KEY (CPF) REFERENCES cliente (CPF),
-- FOREIGN KEY (codEND) REFERENCES endereco(codEND));

-- criando a tabela empresa
CREATE TABLE empresa
(CNPJ CHAR(14) PRIMARY KEY,
nome VARCHAR(30), 
FOREIGN KEY (codEND) REFERENCES endereco(codEND));






