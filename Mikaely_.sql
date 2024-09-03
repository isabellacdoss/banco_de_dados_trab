-- CRIANDO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS previdencia;

-- criando tabelas:
use previdencia;

-- criando a tabela endereço
CREATE TABLE endereco (
codEND INT AUTO_INCREMENT PRIMARY KEY, 
cidade VARCHAR(30), 
CEP INT(8), 
logradouro VARCHAR(30),
estado VARCHAR(20)
);

-- criando a tabela cliente 
CREATE TABLE cliente
(CPF INT(11) , 
nome VARCHAR(50),
RG INT(11),
CNPJ_banco INT NOT NULL,
cod_END INT NOT NULL,
FOREIGN KEY (CNPJ) REFERENCES banco(CNPJ),  
FOREIGN KEY (codEND) REFERENCES endereco(codEND)
); 

 -- criando a tabela telefone
CREATE TABLE telefone (
DDD_numero INT(2) not null, 
numero INT(9) not null
);
 -- cpnj ou cpf como chave primária e secundária: como colocar?
 -- adicinar como:
 -- ALTER TABLE telefone
 -- ADD CONTRAINT FOREIGN KEY 
 
 -- criando a tabela funcionário
 CREATE TABLE funcionario (
CPF INT(11) PRIMARY KEY, 
FOREIGN KEY (CPF) REFERENCES cliente (CPF));
-- FOREIGN KEY (codEND) REFERENCES endereco(codEND));

-- criando a tabela empresa
CREATE TABLE empresa ( -- nao achei esse maldito erro aqui 
CNPJ INT(14) PRIMARY KEY,
nome VARCHAR(30) not null, 
-- CPF NAO SERIA UMA FOREIGN KEY DE EMPRESA, OU CNPJ DA EMPRESA NAO SERIA UMA FOREIGN KEY EM FUNCIONARIO??
codEND INT NOT NULL,
FOREIGN KEY (codEND) REFERENCES endereco(codEND)
);


 -- criando tabela de banco_corretora
 create table banco (
CNPJ INT (14) not null,
nome VARCHAR (50)  not null,
codEND int not null,
FOREIGN KEY (codEND) references endereco(codEND)
);
 
 -- criando tabela de previdencia_privada:
 create table previdencia_privada(
codprevidenica INT (40) PRIMARY KEY,
aporte INT(60), -- NAO SERIA DECIMAL?
data_de_inicio DATE,
banco_CNPJ int not null,
cliente_CPF int not null,
foreign key (banco_CNPJ) references banco(CNPJ),
foreign key (cliente_CPF) references cliente(CPF)
);

-- criando tabela taxas:
create table taxas(
-- codprevidencia será uma PK FK aqui?
adminstracao INT(30) not null,
carregamento INT(30) not null,
saida INT(30) not null
);

-- criando tabela associado
create table associado(
idassociado INT(40)); -- nao deveria haver chaves que relacionam associado e associacao?

-- criando tabela associacao
create table associacao(
CNPJ INT(14) PRIMARY KEY,
nome VARCHAR (50) not null,
codEND INT NOT NULL,
FOREIGN KEY (codEND) REFERENCES endereco(codEND)
);


-- criando tabela fundo
create table fundo_de_pensao(
codfundo INT(30) not null,
codprevidencia int (40),
foreign key (codprevidencia) references previdencia_privada(codprevidencia)
);

-- criando tabela administracao
create table administracao(
-- cpf/cnpj tem de ser PK E FK
valor_pago_empresa INT(40) not null,
valor_pago_funcionario INT(40) not null,
codfundo int(30) not null,
foreign key (codfundo) references fundo_de_pensao(codfundo));

 
 -- insert into cliente 
 -- values ( 
 -- 25364738, 'isabella');
 
 
 
 
 
 
 
 