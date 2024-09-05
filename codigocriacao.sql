
create database previdencia_privada;
use previdencia_privada;

CREATE TABLE endereco (
	codEND INT AUTO_INCREMENT PRIMARY KEY, 
	cidade VARCHAR(30) NOT NULL, 
	CEP INT(8) NOT NULL, 
	logradouro VARCHAR(60) NOT NULL,
	estado VARCHAR(20) NOT NULL
);
-- select * from endereco

-- Criando tabela de banco/corretora:
 CREATE TABLE banco (
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR (50) NOT NULL UNIQUE,
	codEND INT NOT NULL
);
-- Adicionando chave estrangeira codEND de endereco em banco;
ALTER TABLE banco
ADD CONSTRAINT FK_banco_endereco
FOREIGN KEY (codEND) REFERENCES endereco (codEND);

-- select * from banco;

-- Criando a tabela cliente:
CREATE TABLE cliente (
	CPF CHAR(11) PRIMARY KEY, 
	nome VARCHAR(50) NOT NULL,
	RG CHAR(7) NOT NULL UNIQUE,
	CNPJ_banco CHAR(14) NOT NULL,
	codEND INT NOT NULL
); 
-- Adicionando chave estrangeira codEND de endereco em cliente:
ALTER TABLE cliente
ADD CONSTRAINT FK_cliente_endereco
FOREIGN KEY (codEND) REFERENCES endereco(codEND);
-- Adicionando chave estrangeira CNPJ de banco em cliente:
ALTER TABLE cliente
ADD CONSTRAINT FK_cliente_banco
FOREIGN KEY (CNPJ_banco) REFERENCES banco(CNPJ);

-- select * from cliente;

-- Criando a tabela pj:
CREATE TABLE pj ( 
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR(50) NOT NULL, 
	codEND INT NOT NULL,
    tipo ENUM ('Empresa', 'Associação')
    );
    
 -- Adicionando chave estrangeira codEND de endereco em empresa:
 ALTER TABLE pj
 ADD CONSTRAINT FK_pj_endereco
 FOREIGN KEY (codEND) REFERENCES endereco(codEND);

-- select * from pj;

-- Criando a tabela funcionário:
 CREATE TABLE funcionario (
	CPF_fun CHAR(11) PRIMARY KEY, 
	codEND INT NOT NULL,
    salario DECIMAL(7,2),
    CNPJ_empresa CHAR(14) NOT NULL
);

-- Adicionando codEND como chave estrangeira de endereco em funcionário:
ALTER TABLE funcionario
ADD CONSTRAINT FK_funcionario_endereco
FOREIGN KEY (codEND) REFERENCES endereco(codEND);
-- Adicionando CPF como chave estrangeira de cliente em funcionário:
ALTER TABLE funcionario
ADD CONSTRAINT FK_funcionario_cliente
FOREIGN KEY (CPF_fun) REFERENCES cliente (CPF);
-- Adicionando CNPJ como chave estrangeira de empresa em funcionário:
ALTER TABLE funcionario 
ADD CONSTRAINT FK_funcionario_empresa
FOREIGN KEY (CNPJ_empresa) REFERENCES pj(CNPJ); 

-- Criando tabela de previdencia_privada:
 CREATE TABLE previdenciaP(
	codPrevidencia INT AUTO_INCREMENT PRIMARY KEY,
	aporte DECIMAL(7,2) NOT NULL,
	datainicio DATE NOT NULL,
	banco_CNPJ CHAR(14) NOT NULL,
	cliente_CPF CHAR(11) NOT NULL
);
-- Adicionando chave estrangeira CPF de cliente em previdencia_privada:
ALTER TABLE previdenciaP
ADD CONSTRAINT FK_previdenciaP_cliente
FOREIGN KEY (cliente_CPF) REFERENCES cliente(CPF);
-- Adicionando chave estrangeira CNPJ de banco em previdencia_privada:
ALTER TABLE previdenciaP
ADD CONSTRAINT FK_previdenciaP_banco
FOREIGN KEY (banco_CNPJ) REFERENCES banco(CNPJ);

-- select * from previdenciaP;

CREATE TABLE taxas(
	codPrevidencia INT auto_increment PRIMARY KEY,
	administracao DEC(3,2) NOT NULL,
	carregamento DEC(3,2) NOT NULL,
	saida DEC(3,2) NOT NULL
);
-- Adicionando chave estrangeira codPrevidencia de previdencia_privada em taxas:
ALTER TABLE taxas
ADD CONSTRAINT FK_taxas_previdenciaP
FOREIGN KEY (codPrevidencia) REFERENCES previdenciaP(codPrevidencia);
-- select* from taxas;

-- Criando tabela associado:
CREATE TABLE associado(
	CPF_ass CHAR(11) PRIMARY KEY,
    renda DECIMAL(7,2) NOT NULL,
    codEND INT NOT NULL,
    CNPJ_assoc CHAR(14) NOT NULL
); 

-- Adicionando chave estrangeira codEND de endereco em associado:
ALTER TABLE associado
ADD CONSTRAINT FK_associado_endereco
FOREIGN KEY (codEND) REFERENCES endereco(codEND);
-- Adicionando chave estrangeira CNPJ de associacao em associado:
ALTER TABLE associado
ADD CONSTRAINT FK_associado_pj
FOREIGN KEY (CNPJ_assoc) REFERENCES pj(CNPJ);
-- Adionando chave entrangeira em CPF_ass:
ALTER TABLE associado 
ADD CONSTRAINT FK_associado_cliente
FOREIGN KEY (CPF_ass) REFERENCES cliente(CPF);

-- select * from associado;

-- Criando tabela fundo:
CREATE TABLE fundopensao(
	codFundo INT AUTO_INCREMENT PRIMARY KEY,
	codPrevidencia INT NOT NULL,
    CNPJ_pj CHAR(14));
    
-- Adicionando chave estrangeira codPrevidencia de previdenciaP em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_previdenciaP
FOREIGN KEY (codPrevidencia) REFERENCES previdenciaP(codPrevidencia);
-- Adicionando chave estrangeira CNPJ de pessoa juridica em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_pj
FOREIGN KEY (CNPJ_pj) REFERENCES pj(CNPJ);

-- select * from fundopensao;

-- Criando tabela administracao:
CREATE TABLE administracao(
	CPF_fun CHAR(11) PRIMARY KEY,
	valorempresa DECIMAL (5,2),
	valorfuncionario DECIMAL(5,2)
    );

-- a inserção das chaves estrangeiras CNPJ_adm e codFundo foram feitas depois de inserir os dados na tabela administracao para estabelezermos conexões com chaves e migrar os dados dessas tabelas já existentes, por isso estão no codigo de população e não neste.

