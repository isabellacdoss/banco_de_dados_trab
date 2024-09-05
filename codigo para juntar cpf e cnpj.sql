drop database teste;

create database teste;
use teste;

create table clientes (cpf char(11));
create table empresas (cnpj char(14));
create table associacao (cnpj char(14));

insert into clientes values ('12345678910');
insert into empresas values ('12345678910234');
insert into associacao  values ('12345678910234');

-- criando uma tabela que junta cpf e cnpj
CREATE TABLE juncao_cpf_cnpj (cpf_cnpj	varchar (14), cod int auto_increment primary key)
SELECT cpf as cpf_cnpj
FROM clientes
UNION ALL
SELECT cnpj from empresas
union all 
select cnpj from associacao;

select * from juncao_cpf_cnpj;

-- relacionando com endereco

