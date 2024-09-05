drop database teste;

create database teste;
use teste; 

-- Criando tabela para receber cpf
CREATE TABLE dados1 (
   cpf VARCHAR(11));

CREATE TABLE dados2 (
   cnpj VARCHAR(14));
   
create table dados3 
(cnpj VARCHAR(14));

INSERT INTO dados1 VALUES ('11111111111'), ('08207241730');

INSERT INTO dados2 VALUES ('00101010101999'), ('11111117307771');

INSERT INTO dados3 VALUES ('99999999999999'), ('77777777777777');


 -- criando a tabela telefone
CREATE TABLE telefone (
	CNPJ_CPF VARCHAR(14) PRIMARY KEY,
	DDD_numero CHAR(3) , 
	numero INT(9) 
);

-- Inserindo os dados em CNPJ_CPF
INSERT INTO telefone (CNPJ_CPF)
SELECT cpf
FROM dados1 
UNION 
SELECT cnpj 
FROM dados2
UNION
SELECT cnpj
FROM dados3;

ALTER TABLE telefone
ADD CONSTRAINT FK_telefone_dados1
FOREIGN KEY (CNPJ_CPF) REFERENCES dados1(cpf);

ALTER TABLE telefone
ADD CONSTRAINT FK_telefone_dados2
FOREIGN KEY (CNPJ_CPF) REFERENCES dados2(cnpj);

alter table telefone
add constraint FK_telefone_dados3
FOREIGN KEY (CNPJ_CPF) REFERENCES dados3(cnpj);

select * from telefone;



 






