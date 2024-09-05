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

-- Criando tabela taxas:
CREATE TABLE taxas(
	codPrevidencia INT PRIMARY KEY,
	adminstracao DEC(4,2) NOT NULL,
	carregamento DEC(4,2) NOT NULL,
	saida DEC(4,2) NOT NULL
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
	codFundo INT(30) AUTO_INCREMENT PRIMARY KEY,
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
	valorempresa DECIMAL (5,2),
	valorfuncionario DECIMAL(5,2),
	codFundo INT(30) NOT NULL,
	FOREIGN KEY (codfundo) REFERENCES fundopensao(codfundo)
    );
 -- Adicionando chave estrangeira codFUNDO de fundopensao em administracao:   
ALTER TABLE administracao
ADD CONSTRAINT FK_administracao_fundopensao
FOREIGN KEY (codFundo) REFERENCES fundopensao(codFundo);

-- Inserindo dados na tabela cliente (80 clientes):
INSERT INTO cliente (CPF, nome, rg) 
VALUES 
('12434522238', 'Maria Clara Monteiro Santos', '2458885'), 
('08207241730', 'Luiz Filippe Marcon Pereira', '9992358'), 
('18745467799', 'Carlos Oliveira Carvalho', '2784773'),
('67414913722', 'Jaci de Melo Carvalho', '8429462'),
('89471401472', 'Juliana Marianelli Cardoso', '7246247'),
('47925629493', 'Sidney Moreira Camargo', '1383644'),
('73736458543', 'Luan Roberto Silva', '00283847'), 
('61256839333', 'Guilherme Nogueira Martins', '74824212'),
('47246845394', 'Diego Martins Silva', '36572937'),
('75658924375', 'Raquel Souza Nogueira', '4892332'),
('28462434345', 'Sarah Quintiliano Serafim', '2646483'),
('98563790547', 'Alexandra Natalli de Mattos', '3748253'),
('82435639356', 'Maria Clara Zambe Marbela', '4823562'),
('47823462586', 'Izadora Ponte Chaves', '3273529'), 
('27325945778', 'Sabrina Satto Libard', '7485245'),
('49823562792', 'Larissa Manoella Ferreira', '1254025'),
('85720952235', 'Juliano Floss Pontes', '8257290'),
('87542963852', 'Silvio Santos Almeira', '8942895'),
('59758947855', 'Marina Sena Monte', '8914725'),
('82974623535', 'Luísa Carvalho Marcon', '9837423'),
('93726528353', 'Romilda Guess Santos', '4923975'),
('28365729475', 'João Vitor Joanis', '8424365'),
('28462395424', 'Renatta Silva da Costa', '1949278'),
('84628759833', 'Mário Motta Santos', '7948365'),
('23875622458', 'Henrique Reis Abreu', '8295239'),
('24723985392', 'Flávia Borges Menezes', '8294573'),
('17582437465', 'Ícaro Buarque Souza', '8295749'),
('28346345853', 'Pablo Marçal Oliveira', '2975256'),
('24862394242', 'Tabata Amaral Dias', '2897359'),
('19284623833', 'Felipe Rodrigues Lima', '5866797'),
('94869201324', 'Claúdia Maria Passos', '2938429'),
('32424242422', 'Augusto Horas Pinheiro', '9124726'),
('89246271514', 'Mikaely Queiroz Barreto', '7336635'),
('72474638463', 'Milena Carvalho Scherrer', '0923374'),
('10498274222', 'José Leonardo Cabral Moreira', '00120344'),
('14263749566', 'Lucas Oliveira Belo', '02143257'),
('03746563829', 'Gracianete Marcon Zambe', '9272446'),
('00273593790', 'Gilson Almeida dos Santos', '2227364'),
('93939344444', 'Aureci Silva Cardoso', '6636646'),
('44444433443', 'Sabrina Barros Azevedo', '3333333'),
('55555555555', 'Vitória Costa Fontes', '2222222'),
('66663636363', 'Lidia Algum Rocha', '8888888'),
('37377373737', 'Thiago Holanda Braga', '2828282'),
('90909090909', 'Pablo Nogueira Alves', '3535353'),
('34029290000', 'Arthur Carvalho Marianelli', '1010100'),
('07070707076', 'Gabriel dos Anjos Matos', '0238364'),
('98765456789', 'Sofia Macedo Guimarães', '4646463'),
('43456545678', 'Diego Martins Decothe', '7777777'),
('13579246801', 'Gabriela Souza Pinto', '4728361'),
('24681357902', 'Rafael Lima Duarte', '5849273'),
('35792468013', 'Amanda Castro Silva', '3958472'),
('46813579124', 'Fernando Oliveira Santos', '4829375'),
('57924680235', 'Beatriz Costa Almeida', '5648392'),
('68035791346', 'Pedro Henrique Martins', '6739482'),
('79146802457', 'Natália Moura Ribeiro', '8392457'),
('90257913568', 'Ricardo Lopes Carvalho', '7381924'),
('01368024679', 'Vanessa Ferreira Lima', '6384291'),
('12479135780', 'Felipe Costa Souza', '9472853'),
('23580246891', 'Mariana Alves Rocha', '7482915'),
('34691222902', 'Thiago Nascimento Pereira', '8493726'),
('45702468013', 'Eduardo Gomes Barros', '5738294'),
('56813879124', 'Carolina Fernandes Dias', '7394825'),
('68846002305', 'André Silva Oliveira', '6384927'),
('79000791346', 'Fernanda Duarte Mendes', '9482736'),
('98986802457', 'Lucas Rocha Nogueira', '8394725'),
('91257917768', 'Juliana Araújo Lima', '7492831'),
('99999924679', 'Rodrigo Ribeiro Costa', '6482913'),
('13479135454', 'Larissa Almeida Ferreira', '9483726'),
('23333333891', 'Victor Santos Matos', '5738292'),
('35691357902', 'Camila Barbosa Teixeira', '6473915'),
('46702468013', 'Gabriel Menezes Silva', '7382914'),
('57813579124', 'Sara Oliveira Nascimento', '8473925'),
('68924680235', 'Hugo Martins Silva', '6394827'),
('90935791346', 'Paulo Henrique Gomes', '7482935'),
('91299993568', 'Adriana Sousa Ferreira', '8374926'),
('02368024679', 'Matheus Rodrigues Pinto', '9374815'),
('13488835780', 'Isabela Rocha Souza', '8374923'),
('47474747474', 'Joaquim Augusto Munhoz', '2223323'),
('93039449000', 'Mariana Almeida Cardoso', '9993345'),
('55554444444', 'Isabela Pontes Torres', '8797879');

-- Inserindo dados na tabela endereco (102 endereços):
insert into endereco 
(cidade, cep, logradouro, estado)
VALUES  ('Vitória', 29000094, 'Rua das Castanheiras, n°45', 'Espírito Santo'),
('Vitória', 29030074, 'Rua Oliva, n° 20', 'Espírito Santo'),
('Vitória', 29010001, 'Centro, Avenida Jerônimo Monteiro, n° 43', 'Espírito Santo'),
('Itapemirim', 29738946, 'Rua Marinho, n°83', 'Espírito Santo'),
('Itabela', 45848000, 'Rua Daniel Branco, n° 57', 'Bahia'),
('Itabuna', 45334757, 'Vale Encantado, n° 127', 'Bahia'),
('Jequitinhonha', 39960000, 'Rua beija-flor, n° 22', 'Minas Gerais'),
('Itamaraju', 29743746, 'Pau-brasil, n°29', 'Bahia'),
('Itapemirim', 29330000, 'Rua projetada, s/n', 'Espírito Santo'),
('Cachoeiro de Itapemirim', 84526475, 'Centro, Rua Costa Pereira, n° 71', 'Espírito Santo'),
('Cariacica', 29155016, 'Rua Aildo Daniel Muqui, n° 1811', 'Espírito Santo'),
('Afonso Claúdio', 29546370, 'Rua Monte Belo, n°833', 'Espírito Santo'),
('São Paulo', 24285379, 'Rua Jardins, n°10', 'São Paulo'),
('Vale Encantado', 82375422, 'Rua Carvalho, n° 44', 'Mato Grosso do Sul'),
('São Paulo', 01234567, 'Rua das Flores, 123', 'São Paulo'),
('Rio de Janeiro', 22070002, 'Avenida Atlântica, 456', 'Rio de Janeiro'),
('Belo Horizonte', 30140040, 'Praça da Liberdade, n° 789', 'Minas Gerais'),
('Salvador', 40060000, 'Rua das Pedras, n° 321', 'Bahia'),
('Porto Alegre', 90010100, 'Avenida dos Estados, n° 654', 'Rio Grande do Sul'),
('Recife', 50000000, 'Rua do Recife, n° 987', 'Pernambuco'),
('Curitiba', 80010000, 'Rua XV de Novembro, n° 111', 'Paraná'),
('Fortaleza', 60165000, 'Avenida Beira-Mar, n° 222', 'Ceará'),
('Manaus', 69005000, 'Rua do Porto, n° 333', 'Amazonas'),
('Brasília', 70050000, 'Quadra 202, Bloco A, Apartamento 12', 'Distrito Federal'),
('São José dos Campos', 12245678, 'Avenida Doutor Cândido Motta, n° 456', 'São Paulo'),
('Natal', 59010000, 'Rua do Sol, n° 789', 'Rio Grande do Norte'),
('João Pessoa', 58030000, 'Avenida Epitácio Pessoa, n° 321', 'Paraíba'),
('Campo Grande', 79002090, 'Rua 14 de Julho, n° 654', 'Mato Grosso do Sul'),
('Aracaju', 49010050, 'Avenida Santos Dumont, n° 987', 'Sergipe'),
('Maceió', 57020000, 'Avenida da Paz, n° 222', 'Alagoas'),
('Belém', 66010000, 'Rua do Comércio, n° 333', 'Pará'),
('Cuiabá', 78010000, 'Avenida Historiador Rubens de Mendonça, n° 444', 'Mato Grosso'),
('São Luís', 65000000, 'Rua Grande, n° 555', 'Maranhão'),
('Palmas', 77001000, 'Avenida Tocantins, n° 123', 'Tocantins'),
('Rio Branco', 69900000, 'Rua do Plácido de Castro, n° 456', 'Acre'),
('Boa Vista', 69300000, 'Avenida Brasil, n° 789', 'Roraima'),
('Macapá', 68900000, 'Rua São José, n° 321', 'Amapá'),
('São Gabriel do Oeste', 79320000, 'Rua 14 de Julho, n° 654', 'Mato Grosso do Sul'),
('Itajaí', 88301000, 'Avenida Nereu Ramos, n° 987', 'Santa Catarina'),
('Joinville', 89201000, 'Rua XV de Novembro, n° 123', 'Santa Catarina'),
('Londrina', 86010000, 'Avenida Higienópolis, n° 456', 'Paraná'),
('Uberlândia', 38400000, 'Rua Dom Pedro I, n° 789', 'Minas Gerais'),
('Goiânia', 74000000, 'Avenida Goiás, n° 321', 'Goiás'),
('Teresina', 64000000, 'Rua João Cabral, n° 654', 'Piauí'),
('Teresina', 64000000, 'Rua João Cabral, n° 654', 'Piauí'),
('Porto Velho', 76801000, 'Rua Jatuarana, n° 987', 'Rondônia'),
('Vila Velha', 29100000, 'Avenida Antunes, n° 123', 'Espírito Santo'),
('São Carlos', 13560000, 'Rua Episcopal, n° 456', 'São Paulo'),
('Campinas', 13000000, 'Avenida Francisco Glicério, n° 789', 'São Paulo'),
('Barretos', 14780000, 'Rua 11, n° 321', 'São Paulo'),
('Piracicaba', 13400000, 'Rua do Santíssimo, n° 654', 'São Paulo'),
('São João Nepomuceno', 36750000, 'Rua Dona Júlia, n° 987', 'Minas Gerais'),
('Uberaba', 38000000, 'Rua Coronel Ferreira, n° 123', 'Minas Gerais'),
('Santa Maria', 97105000, 'Rua Venâncio Aires, n° 456', 'Rio Grande do Sul'),
('Maringá', 87010000, 'Avenida Brasília, n° 789', 'Paraná'),
('Lajeado', 95900000, 'Rua São Pedro, n° 321', 'Rio Grande do Sul'),
('Caxias do Sul', 95010000, 'Rua Bento Gonçalves, n° 654', 'Rio Grande do Sul'),
('São Vicente', 11320000, 'Avenida Prefeito José Monteiro, n° 456', 'São Paulo'),
('Guarulhos', 07022000, 'Avenida Vitor Cato, n° 678', 'São Paulo'),
('Jundiaí', 13201000, 'Rua Barão de Jundiaí, n° 789', 'São Paulo'),
('Sorocaba', 18010000, 'Avenida Afonso Vergueiro, n° 890', 'São Paulo'),
('Taubaté', 12030000, 'Rua General Osório, n° 123', 'São Paulo'),
('Diadema', 09911000, 'Rua Antonio Piranga, n° 234', 'São Paulo'),
('Osasco', 06020000, 'Rua dos Três Irmãos, n° 345', 'São Paulo'),
('São Bernardo do Campo', 09726000, 'Rua Marechal Deodoro, n° 456', 'São Paulo'),
('São Caetano do Sul', 09550000, 'Rua São Carlos, n° 567', 'São Paulo'),
('Ribeirão Preto', 14010000, 'Avenida Presidente Vargas, n° 789', 'São Paulo'),
('Araxá', 38180000, 'Avenida João Paulo II, n° 456', 'Minas Gerais'),
('Juiz de Fora', 36010000, 'Rua da Assembleia, n° 789', 'Minas Gerais'),
('Belo Horizonte', 30140040, 'Praça da Liberdade, n° 123', 'Minas Gerais'),
('São João Nepomuceno', 36750000, 'Rua Dona Júlia, n° 123', 'Minas Gerais'),
('Palmas', 77001000, 'Avenida Tocantins, n° 456', 'Tocantins'),
('Boa Vista', 69300000, 'Avenida Brasil, n° 789', 'Roraima'),
('Macapá', 68900000, 'Rua São José, n° 321', 'Amapá'),
('Rio Branco', 69900000, 'Rua Plácido de Castro, n° 456', 'Acre'),
('Porto Velho', 76801000, 'Rua Jatuarana, n° 789', 'Rondônia'),
('Maceió', 57020000, 'Avenida da Paz, n° 222', 'Alagoas'),
('Aracaju', 49010050, 'Avenida Santos Dumont, n° 987', 'Sergipe'),
('Natal', 59010000, 'Rua do Sol, n° 789', 'Rio Grande do Norte'),
('João Pessoa', 58030000, 'Avenida Epitácio Pessoa, n° 321', 'Paraíba'),
('Campo Grande', 79002090, 'Rua 14 de Julho, n° 654', 'Mato Grosso do Sul'),
('Goiânia', 74000000, 'Avenida Goiás, n° 321', 'Goiás'),
('Teresina', 64000000, 'Rua João Cabral, n° 654', 'Piauí'),
('Cuiabá', 78010000, 'Avenida Historiador Rubens de Mendonça, n° 444', 'Mato Grosso'),
('Belém', 66010000, 'Rua do Comércio, n° 333', 'Pará'),
('São Luís', 65000000, 'Rua Grande, n° 555', 'Maranhão'),
('Recife', 50000000, 'Rua do Recife, n° 987', 'Pernambuco'),
('Fortaleza', 60165000, 'Avenida Beira-Mar, n° 222', 'Ceará'),
('Curitiba', 80010000, 'Rua XV de Novembro, n° 111', 'Paraná'),
('Porto Alegre', 90010100, 'Avenida dos Estados, n° 654', 'Rio Grande do Sul'),
('Santa Maria', 97105000, 'Rua Venâncio Aires, n° 456', 'Rio Grande do Sul'),
('Maringá', 87010000, 'Avenida Brasília, n° 789', 'Paraná'),
('Joinville', 89201000, 'Rua XV de Novembro, n° 123', 'Santa Catarina'),
('Uberaba', 38000000, 'Rua Coronel Ferreira, n° 123', 'Minas Gerais'),
('Uberlândia', 38400000, 'Rua Dom Pedro I, n° 789', 'Minas Gerais'),
('Ribeirão Preto', 14010000, 'Avenida Presidente Vargas, n° 789', 'São Paulo'),
('São Carlos', 13560000, 'Rua Episcopal, n° 456', 'São Paulo');

-- Inserindo dados da tabela associados (56 rendas):
 INSERT INTO associados 
 (renda) 
 VALUES (15500.12),
(9200.54),
(20500.67),
(4120.98),
(13500.43),
(11230.65),
(8375.13),
(4100.97),
(5333.33),
(4099.99),
(5000.00),
(9789.87),
(3100.11),
(4500.22),
(5000.33),
(3800.44),
(4250.55),
(10900.66),
(12400.77),
(4600.88),
(4800.99),
(20000.12),
(3150.23),
(4500.34),
(4700.45),
(13300.56),
(3650.67),
(3950.78),
(7225.89),
(6320.90),
(20888.01),
(3777.12),
(3999.23),
(4125.34),
(4390.45),
(1150.56);

-- Inserindo dados da tabela funcionários:
 INSERT INTO funcionario
 (salario) 
 VALUES (2500.00),
(5000.50),
(10065.89),
(3560.00),
(23250.00),
(11000.50),
(12000.45),
(3022.00),
(12292.22),
(11500.00),
(20000.33),
(15333.56),
(8000.00),
(20003.77),
(13999.89),
(12444.55),
(12000.33),
(3600.88),
(11144.90),
(23232.90),
(9000.54),
(3400.77),
(2000.66),
(23242.88),
(16990.44),
(33222.33),
(6003.33),
(35000.67),
(22999.34),
(42890.67),
(30190.78),
(3440.89),
(5690.90),
(4125.01),
(4300.12),
(1700.23),
(3800.34),
(9950.45),
(3150.56),
(3999.67),
(9230.78),
(4560.89),
(4850.90),
(4900.01);

-- Inserindo dados da tabela empresa (12 empresas):
INSERT INTO empresa(cnpj, nome) 
VALUES
('12345678000191', 'Empresa Alfa LTDA'),
('23456789000182', 'Beta Consultoria e Associados'),
('34567890000173', 'Gamma Soluções Ltda'),
('45678901000164', 'Delta Comércio e Serviços'),
('67890123000146', 'Zeta Logística LTDA'),
('78901234000137', 'Tesk Tecnologia S.A.'),
('12345678000112', 'Pretti Produções LTDA'),
('89012345000189', 'Sigma Educacional S.A.'),
('23456789000114', 'Lugui Alimentos LTDA'),
('45678901000136', 'Omega Produções'),
('67890123000158', 'Lage Comércio Exterior'),
('90123456000181', 'Carvalho Consultoria Jurídica');

-- Inserindo dados na tabela banco (4 bancos);
INSERT INTO bancos (nome, cnpj) VALUES
('Banco Fictício Nacional S.A.', '12345678000110'),
('Banco Virtual do Brasil S.A.', '23456789000121'),
('Banco Centralizado S.A.', '34567890000132'),
('Banco do Brasil S.A', '20300004857222');

-- Criando porcentagem das taxas:
INSERT INTO taxa(administrao, carregamento, saida) VALUES 
(0.02, 0.04, 0.05);   -- Esse valor foi transformado de porcengem para decimal

-- Insira os dados na tabela previdenciaP:
INSERT INTO previdenciaP
(aporte, data_de_inicio) 
VALUES
(300.00, '1995-04-15'),
(500.00, '2003-09-23'),
(400.00, '1987-12-31'),
(600.00, '2010-07-08'),
(350.00, '1998-03-19'),
(200.00, '2005-11-25'),
(140.00, '1990-06-12'),
(215.00, '2013-02-27'),
(120.00, '2001-08-30'),
(170.00, '1997-05-05'),
(500.00, '2007-10-14'),
(340.00, '2012-01-18'),
(350.00, '1992-09-11'),
(180.00, '2009-04-22'),
(210.00, '1985-02-28'),
(165.00, '2004-12-03'),
(313.00, '1994-07-16'),
(275.00, '2015-06-24'),
(137.00, '1988-03-04'),
(204.00, '2002-11-10'),
(213.00, '2011-08-02'),
(150.00, '1993-05-29'),
(210.00, '2000-10-06'),
(400.00, '1996-01-09'),
(410.00, '2006-03-13'),
(125.00, '1999-12-17'),
(220.00, '2014-09-21'),
(310.00, '1989-02-08'),
(250.00, '2008-05-26'),
(350.00, '1991-07-20'),
(220.00, '2017-04-12'),
(320.00, '1995-11-03'),
(150.00, '2018-01-15'),
(250.00, '1990-08-27'),
(110.00, '2001-03-07'),
(210.00, '1997-10-25'),
(220.00, '2019-06-28'),
(300.00, '1992-12-05'),
(310.00, '2003-07-19'),
(230.00, '1986-11-14'),
(220.00, '2010-02-20'),
(175.00, '1994-09-08'),
(285.00, '2007-04-30'),
(300.00, '1985-06-18'),
(200.00, '2012-11-09'),
(100.00, '2000-12-24'),
(170.00, '1996-05-11'),
(245.00, '1989-08-07'),
(170.00, '2014-02-03'),
(220.00, '2005-10-28'),
(450.00, '1999-07-14'),
(250.00, '2013-09-22'),
(270.00, '2002-06-16'),
(280.00, '1991-03-12'),
(290.00, '2016-08-19'),
(275.00, '1998-11-04'),
(285.00, '2009-01-23'),
(290.00, '1987-05-31');

INSERT INTO associacao (CNPJ, nome) VALUES
('12345678000195', 'Abrap'),
('98765432000176', 'Sindap'),
('11223344000181', 'APEPE'),
('55667788000190', 'ANAP');

-- criando dados da tabela administração
INSERT INTO adminstracao(valorpago_empresa, valorpago_funcionario) VALUES
(0.05, 0.03);


SELECT * FROM  clientes;
