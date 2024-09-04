 drop database teste;
 
-- Criando banco de dados:
CREATE DATABASE teste;

-- Criando tabelas:
USE teste;

-- Criando a tabela endereço:
CREATE TABLE endereco (
	codEND INT AUTO_INCREMENT PRIMARY KEY, 
	cidade VARCHAR(30) NOT NULL, 
	CEP INT(8) NOT NULL, 
	logradouro VARCHAR(30) NOT NULL,
	estado VARCHAR(20) NOT NULL
);

-- Criando tabela de banco_corretora:
 CREATE TABLE banco (
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR (50) NOT NULL UNIQUE,
	codEND INT NOT NULL
);
-- Adicionando chave estrangeira codEND de endereco em banco;
ALTER TABLE banco
ADD CONSTRAINT FK_banco_endereco
FOREIGN KEY (codEND) REFERENCES endereco (codEND);


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
 
 -- Criando a tabela empresa:
CREATE TABLE empresa ( 
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR(30) NOT NULL, 
	codEND INT NOT NULL
    );
 -- Adicionando chave estrangeira codEND de endereco em empresa:
 ALTER TABLE empresa
 ADD CONSTRAINT FK_empresa_endereco
 FOREIGN KEY (codEND) REFERENCES endereco(codEND);
 
 
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
FOREIGN KEY (CNPJ_empresa) REFERENCES empresa(CNPJ);

 -- Criando tabela de previdencia_privada:
 CREATE TABLE previdenciaP(
	codPrevidencia INT(5) PRIMARY KEY,
	aporte DECIMAL(7,2) NOT NULL,
	data_de_inicio DATE NOT NULL,
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

-- Criando tabela taxas:
CREATE TABLE taxas(
	codPrevidencia INT PRIMARY KEY,
	adminstracao INT(30) NOT NULL,
	carregamento INT(30) NOT NULL,
	saida INT(30) NOT NULL
);
-- Adicionando chave estrangeira codPrevidencia de previdencia_privada em taxas:
ALTER TABLE taxas
ADD CONSTRAINT FK_taxas_previdenciaP
FOREIGN KEY (codPrevidencia) REFERENCES previdenciaP(codPrevidencia);


-- Criando tabela associação:
CREATE TABLE associacao(
	CNPJ CHAR(14) PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	codEND INT NOT NULL
);
-- Adicionando chave estrangeira codEND de endereco em associacao:
ALTER TABLE associacao
ADD CONSTRAINT FK_associacao_endereco
FOREIGN KEY (codEND) REFERENCES endereco(codEND);


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
ADD CONSTRAINT FK_associado_associacao
FOREIGN KEY (CNPJ_assoc) REFERENCES associacao(CNPJ);

-- Criando tabela fundo:
CREATE TABLE fundopensao(
	codFundo INT(30) PRIMARY KEY,
	codPrevidencia INT(40) NOT NULL,
    CNPJ_empresa CHAR(14),
    CNPJ_associacao CHAR(14)
);
-- Adicionando chave estrangeira codPrevidencia de previdenciaP em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_previdenciaP
FOREIGN KEY (codPrevidencia) REFERENCES previdenciaP(codPrevidencia);
-- Adicionando chave estrangeira CNPJ de empresa em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_empresa
FOREIGN KEY (CNPJ_empresa) REFERENCES empresa(CNPJ);
-- Adicionando chave estrangeira CNPJ de associacao em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_associacao
FOREIGN KEY (CNPJ_associacao) REFERENCES associacao(CNPJ);

-- Criando tabela administracao:
CREATE TABLE administracao(
	CPF_func CHAR(11) PRIMARY KEY,
	valorpago_empresa DECIMAL (10,2),
	valorpago_funcionario DECIMAL(10,2),
	codFundo INT(30) NOT NULL,
	FOREIGN KEY (codfundo) REFERENCES fundopensao(codfundo)
    );
 -- Adicionando chave estrangeira codFUNDO de fundopensao em administracao:   
ALTER TABLE administracao
ADD CONSTRAINT FK_administracao_fundopensao
FOREIGN KEY (codFundo) REFERENCES fundopensao(codFundo);

 
 
 