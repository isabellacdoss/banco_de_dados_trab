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
 
 INSERT INTO empresa(cnpj, nome) VALUES
('12345678000191', 'Empresa Alfa LTDA'),
('23456789000182', 'Beta Consultoria e Associados'),
('34567890000173', 'Gamma Soluções Ltda'),
('45678901000164', 'Delta Comércio e Serviços'),
('67890123000146', 'Zeta Logística LTDA'),
('78901234000137', 'Tesk Tecnologia S.A.'),
('01234567000101', 'Kappa Empreendimentos'),
('12345678000112', 'Pretti Produções LTDA'),
('78901234000178', 'Rho Energia e Soluções'),
('89012345000189', 'Sigma Educacional S.A.'),
('90123456000190', 'Tau Varejo e Atacado'),
('01234567000192', 'Imobiliária'),
('23456789000114', 'Lugui Alimentos LTDA'),
('45678901000136', 'Omega Produções'),
('67890123000158', 'Lage Comércio Exterior'),
('90123456000181', 'Carvalho Consultoria Jurídica');

INSERT INTO empresas (cidade, estado, cep, logradouro) VALUES
('São Paulo', 'São Paulo', '01000000', 'Rua Augusta, 1000'),
('Rio de Janeiro', 'Rio de Janeiro', '20000000', 'Avenida Atlântica, 200'),
('Belo Horizonte', 'Minas Gerais', '30100000', 'Rua da Bahia, 300'),
('Curitiba', 'Paraná', '80000000', 'Avenida Batel, 400'),
('Porto Alegre', 'Rio Grande do Sul', '90000000', 'Rua dos Andradas, 500'),
('Florianópolis', 'Santa Catarina', '88000000', 'Avenida Beira Mar, 600'),
('Salvador', 'Bahia', '40000000', 'Rua Chile, 700'),
('Fortaleza', 'Ceará', '60000000', 'Avenida Beira Mar, 800'),
('Manaus', 'Amazonas', '69000000', 'Rua Eduardo Ribeiro, 900'),
('Brasília', 'Distrito Federal', '70000000', 'Esplanada dos Ministérios, Bloco A'),
('Recife', 'Pernambuco', '50000000', 'Avenida Boa Viagem, 1000'),
('Goiânia', 'Goiás', '74000000', 'Avenida Goiás, 1100'),
('Belém', 'Pará', '66000000', 'Rua dos Caripunas, 1200'),
('Natal', 'Rio Grande do Norte', '59000000', 'Avenida Engenheiro Roberto Freire, 1300'),
('Cuiabá', 'Mato Grosso', '78000000', 'Rua Barão de Melgaço, 1400'),
('Campo Grande', 'Mato Grosso do Sul', '79000000', 'Avenida Afonso Pena, 1500');

INSERT INTO telefone_empresas (ddd, telefone) VALUES
('011', '999999999'),
('021', '988888888'),
('031', '977777777'),
('041', '966666666'),
('051', '955555555'),
('048', '944444444'),
('071', '933333333'),
('085', '922222222'),
('092', '911111111'),
('061', '900000000'),
('081', '989898989'),
('062', '987654321'),
('091', '912345678'),
('084', '998877665'),
('065', '912312312'),
('067', '999123123'); 
 
 
 
 
 
 