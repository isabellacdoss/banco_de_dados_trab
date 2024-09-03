
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
FOREIGN KEY (CNPJ) REFERENCES banco(CNPJ), 
FOREIGN KEY (codEND) REFERENCES endereco(codEND)); 






