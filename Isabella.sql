drop database previdencia_privada;

create database previdencia_privada;

use previdencia_privada;

CREATE TABLE endereco (
	codEND INT AUTO_INCREMENT PRIMARY KEY, 
	cidade VARCHAR(30) NOT NULL, 
	CEP INT(8) NOT NULL, 
	logradouro VARCHAR(60) NOT NULL,
	estado VARCHAR(20) NOT NULL
);

-- select * from endereco;

insert into endereco 
(cidade, CEP, logradouro, estado)
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
('São Paulo', 81234567, 'Rua das Flores, 123', 'São Paulo'),
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
('Guarulhos', 57022000, 'Avenida Vitor Cato, n° 678', 'São Paulo'),
('Jundiaí', 13201000, 'Rua Barão de Jundiaí, n° 789', 'São Paulo'),
('Sorocaba', 18010000, 'Avenida Afonso Vergueiro, n° 890', 'São Paulo'),
('Taubaté', 12030000, 'Rua General Osório, n° 123', 'São Paulo'),
('Diadema', 09911000, 'Rua Antonio Piranga, n° 234', 'São Paulo'),
('Osasco', 86020000, 'Rua dos Três Irmãos, n° 345', 'São Paulo'),
('São Bernardo do Campo', 99726000, 'Rua Marechal Deodoro, n° 456', 'São Paulo'),
('São Caetano do Sul', 99550000, 'Rua São Carlos, n° 567', 'São Paulo'),
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
('São Carlos', 13560000, 'Rua Episcopal, n° 456', 'São Paulo'),
('Jerônimo Monteiro', 7364836, 'Rua Capitão Deslandes, n° 20', 'Espírito Santo'),
('Cariacica', 2911111, 'Rua Monteiro, n°24', 'Espírito Santo'),
('Anchieta', 29345777, 'Iriri, Rua principal, n°10', 'Espírito Santo');


-- select * from endereco;

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

-- Inserindo dados na tabela banco (4 bancos);
INSERT INTO banco (nome, CNPJ, codEND) VALUES
('Banco Fictício Nacional S.A.', '12345678000110',93),
('Banco Virtual do Brasil S.A.', '23456789000121',94),
('Banco Centralizado S.A.', '34567890000132',95),
('Banco do Brasil S.A', '20300004857222',96);

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

-- Inserindo dados na tabela cliente (80 clientes):
INSERT INTO cliente (CPF, nome, RG, CNPJ_banco, codEND) 
VALUES 
('12434522238', 'Maria Clara Monteiro Santos', '2458885','12345678000110', 1), 
('08207241730', 'Luiz Filippe Marcon Pereira', '9992358','23456789000121', 2), 
('18745467799', 'Carlos Oliveira Carvalho', '2784773','34567890000132', 3),
('67414913722', 'Jaci de Melo Carvalho', '8429462','12345678000110', 4),
('89471401472', 'Juliana Marianelli Cardoso', '7246247','20300004857222', 5),
('47925629493', 'Sidney Moreira Camargo', '1383644','34567890000132', 6),
('73736458543', 'Luan Roberto Silva', '0028387','12345678000110', 7), 
('61256839333', 'Guilherme Nogueira Martins', '7482422','20300004857222', 8),
('47246845394', 'Diego Martins Silva', '3657297','23456789000121', 9),
('75658924375', 'Raquel Souza Nogueira', '4892332','20300004857222', 10),
('28462434345', 'Sarah Quintiliano Serafim', '2646483','23456789000121', 11),
('98563790547', 'Alexandra Natalli de Mattos', '3748253','12345678000110', 12),
('82435639356', 'Maria Clara Zambe Marbela', '4823562','12345678000110', 13),
('47823462586', 'Izadora Ponte Chaves', '3273529','12345678000110', 14), 
('27325945778', 'Sabrina Satto Libard', '7485245','34567890000132', 15),
('49823562792', 'Larissa Manoella Ferreira', '1254025','34567890000132', 16),
('85720952235', 'Juliano Floss Pontes', '8257290','12345678000110', 17),
('87542963852', 'Silvio Santos Almeira', '8942895','12345678000110', 18),
('59758947855', 'Marina Sena Monte', '8914725','20300004857222', 19),
('82974623535', 'Luísa Carvalho Marcon', '9837423','23456789000121', 20),
('93726528353', 'Romilda Guess Santos', '4923975','34567890000132', 21),
('28365729475', 'João Vitor Joanis', '8424365','23456789000121', 22),
('28462395424', 'Renatta Silva da Costa', '1949278','12345678000110', 23),
('84628759833', 'Mário Motta Santos', '7948365','12345678000110', 24),
('23875622458', 'Henrique Reis Abreu', '8295239','20300004857222', 25),
('24723985392', 'Flávia Borges Menezes', '8294573','12345678000110', 26),
('17582437465', 'Ícaro Buarque Souza', '8295749','34567890000132', 27),
('28346345853', 'Pablo Marçal Oliveira', '2975256','12345678000110', 28),
('24862394242', 'Tabata Amaral Dias', '2897359','20300004857222', 29),
('19284623833', 'Felipe Rodrigues Lima', '5866797','34567890000132', 30),
('94869201324', 'Claúdia Maria Passos', '2938429','12345678000110', 31),
('32424242422', 'Augusto Horas Pinheiro', '9124726','34567890000132', 32),
('89246271514', 'Mikaely Queiroz Barreto', '7336635','20300004857222', 33),
('72474638463', 'Milena Carvalho Scherrer', '0923374','34567890000132', 34),
('10498274222', 'José Leonardo Cabral Moreira', '0012034','34567890000132', 35),
('14263749566', 'Lucas Oliveira Belo', '0214327','20300004857222', 36),
('03746563829', 'Gracianete Marcon Zambe', '9272446','12345678000110', 37),
('00273593790', 'Gilson Almeida dos Santos', '2227364','12345678000110', 38),
('93939344444', 'Aureci Silva Cardoso', '6636646','20300004857222', 39),
('44444433443', 'Sabrina Barros Azevedo', '3333333','23456789000121', 40),
('55555555555', 'Vitória Costa Fontes', '2222222','23456789000121', 41),
('66663636363', 'Lidia Algum Rocha', '8888888','20300004857222', 42),
('37377373737', 'Thiago Holanda Braga', '2828282','34567890000132', 43),
('90909090909', 'Pablo Nogueira Alves', '3535353','20300004857222', 44),
('34029290000', 'Arthur Carvalho Marianelli', '1010100','23456789000121', 45),
('07070707076', 'Gabriel dos Anjos Matos', '0238364','20300004857222', 46),
('98765456789', 'Sofia Macedo Guimarães', '4646463','20300004857222', 47),
('43456545678', 'Diego Martins Decothe', '7777777','12345678000110', 48),
('13579246801', 'Gabriela Souza Pinto', '4728361','12345678000110', 49),
('24681357902', 'Rafael Lima Duarte', '5849273','12345678000110', 50),
('35792468013', 'Amanda Castro Silva', '3958472','20300004857222', 51),
('46813579124', 'Fernando Oliveira Santos', '4829375','23456789000121', 52),
('57924680235', 'Beatriz Costa Almeida', '5648392','23456789000121', 53),
('68035791346', 'Pedro Henrique Martins', '6739482','34567890000132', 54),
('79146802457', 'Natália Moura Ribeiro', '8392457','34567890000132', 55),
('90257913568', 'Ricardo Lopes Carvalho', '7381924','34567890000132', 56),
('01368024679', 'Vanessa Ferreira Lima', '6384291','12345678000110', 57),
('12479135780', 'Felipe Costa Souza', '9472853','20300004857222', 58),
('23580246891', 'Mariana Alves Rocha', '7482915','23456789000121', 59),
('34691222902', 'Thiago Nascimento Pereira', '8493726','20300004857222', 60),
('45702468013', 'Eduardo Gomes Barros', '5738294','34567890000132', 61),
('56813879124', 'Carolina Fernandes Dias', '7394825','20300004857222', 62),
('68846002305', 'André Silva Oliveira', '6384927','20300004857222', 63),
('79000791346', 'Fernanda Duarte Mendes', '9482736','20300004857222', 64),
('98986802457', 'Lucas Rocha Nogueira', '8394725','23456789000121', 65),
('91257917768', 'Juliana Araújo Lima', '7492831','23456789000121', 66),
('99999924679', 'Rodrigo Ribeiro Costa', '6482913','20300004857222', 67),
('13479135454', 'Larissa Almeida Ferreira', '9483726','34567890000132', 68),
('23333333891', 'Victor Santos Matos', '5738292','34567890000132', 69),
('35691357902', 'Camila Barbosa Teixeira', '6473915','12345678000110', 70),
('46702468013', 'Gabriel Menezes Silva', '7382914','12345678000110', 71),
('57813579124', 'Sara Oliveira Nascimento', '8473925','12345678000110', 72),
('68924680235', 'Hugo Martins Silva', '6394827','23456789000121', 73),
('90935791346', 'Paulo Henrique Gomes', '7482935','12345678000110', 74),
('91299993568', 'Adriana Sousa Ferreira', '8374926','20300004857222', 75),
('02368024679', 'Matheus Rodrigues Pinto', '9374815','12345678000110', 76),
('13488835780', 'Isabela Rocha Souza', '8374923','20300004857222', 77),
('47474747474', 'Joaquim Augusto Munhoz', '2223323','23456789000121', 78),
('93039449000', 'Mariana Almeida Cardoso', '9993345','20300004857222', 79),
('55554444444', 'Isabela Pontes Torres', '8797879','23456789000121', 80);

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
    
-- Inserindo dados na tabela associacao:
INSERT INTO pj (CNPJ, nome, codEND, tipo) VALUES
('12345678000195', 'Abrap', 97, 'Associação'),
('98765432000176', 'Sindap', 98,'Associação'),
('11223344000181', 'APEPE', 99,'Associação'),
('55667788000190', 'ANAP', 100,'Associação'), 
('12345678000191', 'Empresa Alfa LTDA', 81, 'Empresa'),
('23456789000182', 'Beta Consultoria e Associados', 82, 'Empresa'),
('34567890000173', 'Gamma Soluções Ltda', 83, 'Empresa'),
('45678901000164', 'Delta Comércio e Serviços', 84, 'Empresa'),
('67890123000146', 'Zeta Logística LTDA', 85, 'Empresa'),
('78901234000137', 'Tesk Tecnologia S.A.', 86, 'Empresa'),
('12345678000112', 'Pretti Produções LTDA', 87, 'Empresa'),
('89012345000189', 'Sigma Educacional S.A.', 88, 'Empresa'),
('23456789000114', 'Lugui Alimentos LTDA', 89, 'Empresa'),
('45678901000136', 'Omega Produções', 90,'Empresa'),
('67890123000158', 'Lage Comércio Exterior', 91,'Empresa'),
('90123456000181', 'Carvalho Consultoria Jurídica', 92,'Empresa');

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

-- Inserindo dados da tabela funcionários:
INSERT INTO funcionario (codEND, CPF_fun, salario, CNPJ_empresa) 
VALUES 
(37, '03746563829', 2500.00,'12345678000191'),
(38, '00273593790', 5000.50,'12345678000191'),
(39, '93939344444', 10065.89,'12345678000191'),
(40, '44444433443', 3560.00,'12345678000191'),
(41, '55555555555', 23250.00,'12345678000191'),
(42, '66663636363', 11000.50,'12345678000191'),
(43, '37377373737', 12000.45,'12345678000191'),
(44, '90909090909', 3022.00,'12345678000191'),
(45, '34029290000', 12292.22,'12345678000191'),
(46, '07070707076', 11500.00,'12345678000191'),
(47, '98765456789', 20000.33,'12345678000191'),
(48, '43456545678', 15333.56,'12345678000191'),
(49, '13579246801', 8000.00,'12345678000191'),
(50, '24681357902', 20003.77,'12345678000191'),
(51, '35792468013', 13999.89,'12345678000191'),
(52, '46813579124', 12444.55,'12345678000191'),
(53, '57924680235', 12000.33,'12345678000191'),
(54, '68035791346', 3600.88,'23456789000182'),
(55, '79146802457', 11144.90,'23456789000182'),
(56, '90257913568', 23232.90,'23456789000182'),
(57, '01368024679', 9000.54,'23456789000182'),
(58, '12479135780', 3400.77,'23456789000182'),
(59, '23580246891', 2000.66,'23456789000182'),
(60, '34691222902', 23242.88,'23456789000182'),
(61, '45702468013', 16990.44,'23456789000182'),
(62, '56813879124', 33222.33,'34567890000173'),
(63, '68846002305', 6003.33,'34567890000173'),
(64, '79000791346', 35000.67,'45678901000164'),
(65, '98986802457', 22999.34,'45678901000164'),
(66, '91257917768', 42890.67,'45678901000164'),
(67, '99999924679', 30190.78,'78901234000137'),
(68, '13479135454', 3440.89,'78901234000137'),
(69, '23333333891', 5690.90,'78901234000137'),
(70, '35691357902', 4125.01,'78901234000137'),
(71, '46702468013', 4300.12,'78901234000137'),
(72, '57813579124', 1700.23,'90123456000181'),
(73, '68924680235', 3800.34, '90123456000181'),
(74, '90935791346', 9950.45,'67890123000158'),
(75, '91299993568', 3150.56, '67890123000158'),
(76, '02368024679', 3999.67,'23456789000114'),
(77, '13488835780', 9230.78,'67890123000158'),
(78, '47474747474', 4560.89,'67890123000158'),
(79, '93039449000', 4850.90,'78901234000137'),
(80, '55554444444', 4900.01,'78901234000137');

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

-- Insira os dados na tabela previdenciaP:
INSERT INTO previdenciaP
(aporte, datainicio, cliente_CPF, banco_CNPJ) 
VALUES
(300.00, '2019-04-15', '12434522238', '12345678000110'),
(300.00, '2019-04-15', '08207241730', '23456789000121'),
(500.00, '2003-09-23', '18745467799', '34567890000132'),
(400.00, '1909-12-31', '67414913722', '12345678000110'),
(600.00, '2010-07-08', '89471401472', '20300004857222'),
(350.00, '1998-03-19', '47925629493', '34567890000132'),
(200.00, '2005-11-25', '73736458543', '12345678000110'),
(140.00, '1990-06-12', '61256839333', '20300004857222'),
(215.00, '2013-02-27', '47246845394', '23456789000121'),
(120.00, '2001-08-30', '75658924375', '20300004857222'),
(170.00, '2019-05-05', '28462434345', '23456789000121'),
(500.00, '2007-10-14', '98563790547', '12345678000110'),
(340.00, '2012-01-18', '82435639356', '12345678000110'),
(350.00, '2012-09-11', '47823462586', '12345678000110'),
(180.00, '2009-04-22', '27325945778', '34567890000132'),
(210.00, '2017-02-28', '49823562792', '34567890000132'),
(165.00, '2004-12-03', '85720952235', '12345678000110'),
(313.00, '2009-07-16', '87542963852', '12345678000110'),
(275.00, '2015-06-24', '59758947855', '20300004857222'),
(137.00, '1988-03-04', '82974623535', '23456789000121'),
(204.00, '2002-11-10', '93726528353','34567890000132'),
(213.00, '2011-08-02', '28365729475','23456789000121'),
(150.00, '2020-05-29', '28462395424', '12345678000110'),
(210.00, '2000-10-06', '84628759833', '12345678000110'),
(400.00, '2003-01-09', '23875622458','20300004857222'),
(410.00, '2006-03-13', '24723985392','12345678000110'),
(125.00, '1999-12-17', '17582437465', '34567890000132'),
(220.00, '2014-09-21', '28346345853', '12345678000110'),
(310.00, '2005-02-08', '24862394242','20300004857222'),
(250.00, '2008-05-26', '19284623833', '34567890000132'),
(350.00, '2015-07-20', '94869201324','12345678000110'),
(220.00, '2017-04-12', '32424242422','34567890000132'),
(320.00, '2015-11-03', '89246271514','20300004857222'),
(150.00, '2018-01-15', '72474638463', '34567890000132'),
(250.00, '2003-08-27', '10498274222','34567890000132'),
(110.00, '2001-03-07', '14263749566','20300004857222'),
(210.00, '2000-10-25', '03746563829','12345678000110'),
(220.00, '2019-06-28', '00273593790','12345678000110'),
(300.00, '2011-12-05', '93939344444','20300004857222'),
(310.00, '2003-07-19', '44444433443','23456789000121'),
(230.00, '1999-11-14', '55555555555', '23456789000121'),
(220.00, '2010-02-20', '66663636363', '20300004857222'),
(175.00, '1998-09-08', '37377373737', '34567890000132'),
(285.00, '2007-04-30', '90909090909', '20300004857222'),
(300.00, '1988-06-18', '34029290000', '20300004857222'),
(200.00, '2012-11-09', '07070707076', '20300004857222'),
(100.00, '2000-12-24', '98765456789', '20300004857222'),
(170.00, '1996-05-11', '43456545678', '12345678000110'),
(245.00, '1989-08-07', '13579246801', '12345678000110'),
(170.00, '2014-02-03', '24681357902', '12345678000110'),
(220.00, '2005-10-28', '35792468013', '20300004857222'),
(450.00, '1999-07-14', '46813579124', '23456789000121'),
(250.00, '2013-09-22', '57924680235', '23456789000121'),
(270.00, '2002-06-16', '68035791346', '34567890000132'),
(280.00, '1991-03-12', '79146802457', '34567890000132'),
(290.00, '2016-08-19', '90257913568', '34567890000132'),
(275.00, '2021-11-04', '01368024679', '12345678000110'),
(285.00, '2009-01-23', '12479135780', '20300004857222'),
(290.00, '2023-05-31', '23580246891', '12345678000110');

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

-- Criando porcentagem das taxas:
INSERT INTO taxas(administracao, carregamento, saida) VALUES 
(0.10, 0.07, 0.05);   -- Esse valor foi transformado de porcengem para decimal

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

-- Inserindo dados da tabela associados (56 rendas):
INSERT INTO associado (codEND, CPF_ass, renda, CNPJ_assoc) 
VALUES 
(1, '12434522238', 15500.12,'12345678000195' ), 
(2, '08207241730', 9200.54,'12345678000195'), 
(3, '18745467799', 20500.67,'12345678000195'),
(4, '67414913722', 4120.98,'12345678000195'),
(5, '89471401472', 13500.43,'12345678000195'),
(6, '47925629493', 11230.65,'12345678000195'),
(7, '73736458543', 8375.13,'12345678000195'), 
(8, '61256839333', 4100.97,'12345678000195'),
(9, '47246845394', 5333.33,'12345678000195'),
(10, '75658924375', 4099.99,'12345678000195'),
(11, '28462434345', 5000.00,'12345678000195'),
(12, '98563790547', 9789.87,'12345678000195'),
(13, '82435639356', 3100.11,'12345678000195'),
(14, '47823462586', 4500.22,'12345678000195'),
(15, '27325945778', 5000.33,'12345678000195'),
(16, '49823562792', 3800.44,'98765432000176'),
(17, '85720952235', 4250.55,'98765432000176'),
(18, '87542963852', 10900.66, '98765432000176'),
(19, '59758947855', 12400.77, '98765432000176'),
(20, '82974623535', 4600.88, '98765432000176'),
(21, '93726528353', 4800.99,'98765432000176'),
(22, '28365729475', 20000.12,'98765432000176'),
(23, '28462395424', 3150.23,'11223344000181'),
(24, '84628759833', 4500.34,'11223344000181'),
(25, '23875622458', 4700.45,'11223344000181'),
(26, '24723985392', 13300.56,'11223344000181'),
(27, '17582437465', 3650.67,'11223344000181'),
(28, '28346345853', 3950.78,'11223344000181'),
(29, '24862394242', 7225.89,'11223344000181'),
(30, '19284623833', 6320.90,'55667788000190'),
(31, '94869201324', 20888.01,'55667788000190'),
(32, '32424242422', 3777.12,'55667788000190'),
(33, '89246271514', 3999.23,'55667788000190'),
(34, '72474638463', 4125.34,'55667788000190'),
(35, '10498274222', 4390.45,'55667788000190'),
(36, '14263749566', 1150.56,'55667788000190');

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
-- Adicionando chave estrangeira CNPJ de empresa em fundopensao:
ALTER TABLE fundopensao
ADD CONSTRAINT FK_fundopensao_pj
FOREIGN KEY (CNPJ_pj) REFERENCES pj(CNPJ);
-- Adicionando chave estrangeira CNPJ de associacao em fundopensao:

-- inserindo dados na tabela fundopensao:
insert into fundopensao (codPrevidencia, CNPJ_pj)
VALUES 
(1,'12345678000191'),
(2,'23456789000182'),
(3,'34567890000173'),
(4,'45678901000164'),
(5,'67890123000146'),
(6,'78901234000137'),
(7,'12345678000112'), 
(8,'89012345000189'), 
(9,'23456789000114'), 
(10,'45678901000136'), 
(11,'67890123000158'), 
(12,'90123456000181'),
(13,'55667788000190'),
(14,'12345678000195'),
(15,'98765432000176'),
(16,'11223344000181');

-- select * from fundopensao;

-- Criando tabela administracao:
CREATE TABLE administracao(
	CPF_func CHAR(11) PRIMARY KEY,
	valorempresa DECIMAL (5,2),
	valorfuncionario DECIMAL(5,2),
	codFundo INT NOT NULL,
	FOREIGN KEY (codfundo) REFERENCES fundopensao(codfundo)
    );
 -- Adicionando chave estrangeira codFUNDO de fundopensao em administracao:   
ALTER TABLE administracao
ADD CONSTRAINT FK_administracao_fundopensao
FOREIGN KEY (codFundo) REFERENCES fundopensao(codFundo);

-- Criando dados da tabela administração:
INSERT INTO adminstracao(codFundo, CPF_fun, valorempresa, valorfuncionario) VALUES
('03746563829', 0.05, 0.03),
('00273593790', 0.05, 0.03),
('93939344444', 0.05, 0.03),
('44444433443', 0.05, 0.03),
('55555555555', 0.05, 0.03),
('66663636363', 0.05, 0.03),
('37377373737', 0.05, 0.03),
('90909090909', 0.05, 0.03),
('34029290000', 0.05, 0.03),
('07070707076', 0.05, 0.03),
('98765456789', 0.05, 0.03),
('43456545678', 0.05, 0.03),
('13579246801', 0.05, 0.03),
('24681357902', 0.05, 0.03),
('35792468013', 0.05, 0.03),
('46813579124', 0.05, 0.03),
('57924680235', 0.05, 0.03),
('68035791346', 0.05, 0.03),
('79146802457', 0.05, 0.03),
('90257913568', 0.05, 0.03),
('01368024679', 0.05, 0.03),
('12479135780', 0.05, 0.03),
('23580246891', 0.05, 0.03),
('34691222902', 0.05, 0.03),
('45702468013', 0.05, 0.03),
('56813879124', 0.05, 0.03),
('68846002305', 0.05, 0.03),
('79000791346', 0.05, 0.03),
('98986802457', 0.05, 0.03),
('91257917768', 0.05, 0.03),
('99999924679', 0.05, 0.03),
('13479135454', 0.05, 0.03),
('23333333891', 0.05, 0.03),
('35691357902', 0.05, 0.03),
('46702468013', 0.05, 0.03),
('57813579124', 0.05, 0.03),
('68924680235', 0.05, 0.03),
('90935791346', 0.05, 0.03),
('91299993568', 0.05, 0.03),
('02368024679', 0.05, 0.03),
('13488835780', 0.05, 0.03),
('47474747474', 0.05, 0.03),
('93039449000', 0.05, 0.03),
('55554444444', 0.05, 0.03);







    
    

 

