-- criando banco de dados
CREATE DATABASE IF NOT EXISTS previdencia;

-- criando tabelas:
use previdencia;

-- criando a tabela endereço
create table endereco (
	codEND INT AUTO_INCREMENT PRIMARY KEY, 
	cidade VARCHAR(30) NOT NULL, 
	CEP INT(8) NOT NULL, 
	logradouro VARCHAR(30) NOT NULL,
	estado VARCHAR(20) NOT NULL
);

-- criando tabela de banco_corretora
 create table banco (
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR (50) NOT NULL UNIQUE,
	codEND int not null
);
-- adicionando chave estrangeira codEND de endereco em banco
alter table banco
add constraint FK_banco_endereco
foreign key (codEND) references endereco (codEND);


-- criando a tabela cliente 
CREATE TABLE cliente (
	CPF INT(11) PRIMARY KEY, 
	nome VARCHAR(50) NOT NULL,
	RG INT(11) NOT NULL UNIQUE,
	CNPJ_banco INT NOT NULL,
	codEND INT NOT NULL
); 
-- adicionando chave estrangeira codEND de endereco em cliente
alter table cliente
add constraint FK_cliente_endereco
foreign key (codEND) references endereco (codEND);
-- adicionando chave estrangeira CNPJ de banco em cliente
alter table cliente
add constraint FK_cliente_banco
foreign key (CNPJ_banco) references banco (CNPJ);


 -- criando a tabela telefone
CREATE TABLE telefone (
	CNPJ_CPF INT(14) PRIMARY KEY,
	DDD_numero INT(2) NOT NULL, 
	numero INT(9) NOT NULL
);
-- adicionando chave estrangeira de CNPJ/CPF de banco/empresa/cliente em telefone
alter table telefone
add constraint FK_)
 -- cpnj ou cpf como chave primária e secundária de duas tabelas distintas: como colocar?
 -- adicinar como:
 -- ALTER TABLE telefone
 -- ADD CONTRAINT FOREIGN KEY 
 
 -- criando a tabela empresa
CREATE TABLE empresa ( 
	CNPJ INT(14) PRIMARY KEY,
	nome VARCHAR(30) NOT NULL, 
	codEND INT NOT NULL,
);
 -- adicionando chave estrangeira codEND de endereco em empresa
 alter table empresa
 add constraint FK_empresa_endereco
 foreign key (codEND) references endereco(codEND);
 
 
 -- criando a tabela funcionário 
 CREATE TABLE funcionario (
	CPF_fun INT(11) PRIMARY KEY, 
	codEND INT NOT NULL,
    salario DECIMAL(7,2),
    CNPJ_empresa INT(14) NOT NULL
);
-- adicionando codEND como chave estrangeira de endereco em funcionario
alter table funcionario
add constraint FK_funcionario_endereco
FOREIGN KEY (codEND) REFERENCES endereco(codEND);
-- adicionando CPF como chave estrangeira de cliente em funcionario
alter table funcionario
add constraint FK_funcionario_cliente
foreign key (CPF) references cliente (CPF);
-- adicionando CNPJ como chave estrangeira de empresa em funcionario
alter table funcionario 
add constraint FK_funcionario_empresa
foreign key (CNPJ_empresa) references empresa(CNPJ);

 
 -- criando tabela de previdencia_privada:
 create table previdenciaP(
	codPrevidenica INT(5) PRIMARY KEY,
	aporte DECIMAL(7,2) NOT NULL,
	data_de_inicio DATE NOT NULL,
	banco_CNPJ INT NOT NULL,
	cliente_CPF INT NOT NULL
);
-- adicionando chave estrangeira CPF de cliente em previdencia_privada
alter table previdenciaP
add constraint FK_previdenciaP_cliente
foreign key (cliente_CPF) references cliente(CPF);
-- adicionando chave estrangeira CNPJ de banco em previdencia_privada
alter table previdenciaprivada
add constraint FK_previdenciaP_banco
foreign key (banco_CNPJ) references banco(CNPJ);


-- criando tabela taxas:
create table taxas(
	codPrevidencia INT PRIMARY KEY,
	adminstracao INT(30) NOT NULL,
	carregamento INT(30) NOT NULL,
	saida INT(30) NOT NULL
);
-- adicionando chave estrangeira codPrevidencia de previdencia_privada em taxas
alter table taxas
add constraint FK_taxas_previdenciaP
foreign key (codPrevidencia) references previdenciaP(codPrevidencia);


-- criando tabela associacao
create table associacao(
	CNPJ INT(14) PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	codEND INT NOT NULL
);
-- adicionando chave estrangeira codEND de endereco em associacao
alter table associacao
add constraint FK_associacao_endereco
foreign key (codEND) references endereco(codEND);


-- criando tabela associado
create table associado(
	CPF_ass INT(11) PRIMARY KEY,
    Renda DECIMAL(7,2) NOT NULL,
    codEND INT NOT NULL,
    CNPJ_assoc INT(14) NOT NULL
); 
-- adicionando chave estrangeira codEND de endereco em associado
alter table associado
add constraint FK_associado_endereco
foreign key (codEND) references endereco(codEND);
-- adicionando chave estrangeira CNPJ de associacao em associado
alter table associado
add constraint FK_associado_associacao
foreign key (CNPJ_assoc) references associacao(CNPJ);

-- criando tabela fundo
create table fundopensao(
	codFundo INT(30) PRIMARY KEY,
	codPrevidencia INT(40) NOT NULL,
    CNPJ_empresa CHAR(14),
    CNPJ_associacao CHAR(14)
);
-- adicionando chave estrangeira codPrevidencia de previdenciaP em fundopensao
alter table fundopensao
add constraint FK_fundopensao_previdenciaP
foreign key (codPrevidencia) references previdenciaP(codPrevidencia);
-- adicionando chave estrangeira CNPJ de empresa em fundopensao
alter table fundopensao
add constraint FK_fundopensao_empresa
foreign key (CNPJ_empresa) references empresa(CNPJ);
-- adicionando chave estrangeira CNPJ de associacao em fundopensao
alter table fundopensao
add constraint FK_fundopensao_associacao
foreign key (CNPJ_associacao) references associacao(CNPJ);

-- criando tabela administracao
create table administracao(
	CPF_func char(11) primary key,
	valorpago_empresa decimal(10,2),
	valorpago_funcionario decimal(10,2),
	codFundo int(30) NOT NULL,
	foreign key (codfundo) references fundo_de_pensao(codfundo)
    );
alter table administracao
add constraint FK_administracao_fundopensao
foreign key (codFundo) references fundopensao(codFundo);

 
 -- insert into cliente 
 -- values ( 
 -- 25364738, 'isabella');
 
 
 
 