use previdencia; 

-- Criando tabela para receber cpf
CREATE TABLE dados1 (
   cpf VARCHAR(11));

CREATE TABLE dados2 (
   cnpj VARCHAR(14));

INSERT INTO dados1 VALUES ('11111111111'), ('08207241730');

INSERT INTO dados2 VALUES ('00101010101999'), ('11111117307771');

-- Criação da tabela de junção das duas colunas
CREATE TABLE juncao
(cpf_cnpj VARCHAR(14));

-- Inserindo os dados na tabela juncao
INSERT INTO juncao (cpf_cnpj)
SELECT cpf 
FROM dados1 as cpf_cnpj
UNION 
SELECT cnpj 
FROM dados2;

select * from juncao;





