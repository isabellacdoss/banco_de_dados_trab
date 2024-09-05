-- TODOS OS DADOS JUNTOS

-- DADOS  TABELA EMPRESA 
-- (NOME E CNPJ)
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

-- ENDEREÇO EMPRESA
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

-- DADOS TABELA BANCO
-- NOME E CNPJ

INSERT INTO bancos (nome, cnpj) VALUES
('Banco Fictício Nacional S.A.', '12345678000110'),
('Banco Virtual do Brasil S.A.', '23456789000121'),
('Banco Centralizado S.A.', '34567890000132');

-- ENDEREÇO BANCO


INSERT INTO enderecos (cidade, estado, cep, logradouro) VALUES
('São Paulo', 'São Paulo', '01000000', 'Avenida Paulista 1000'),
('Rio de Janeiro', 'Rio de Janeiro', '20000000', 'Rua Visconde de Pirajá 500'),
('Belo Horizonte', 'Minas Gerais', '30100000', 'Avenida Afonso Pena 1500');

-- DADOS TABELA ASSOCIAÇÃO
-- NOME E CNPJ

INSERT INTO associacao (CNPJ, nome) VALUES
('12345678000195', 'Abrap'),
('98765432000176', 'Sindap'),
('11223344000181', 'APEPE'),
('55667788000190', 'ANAP');

-- DADOS TABELA ADMINISTRAÇÃO


INSERT INTO adminstracao(valorpago_empresa, valorpago_funcionario) VALUES
('25000,00', '60,00');

-- DADOS TABELA ASSOCIADOS
-- RENDA ( 60 rendas)
-- DADOS RENDA= SALÁRIO


 INSERT INTO rendas (valor) VALUES
(1500.12),
(3200.54),
(2500.67),
(4120.98),
(3500.43),
(2230.65),
(1875.13),
(4100.97),
(3333.33),
(2999.99),
(5000.00),
(2789.87),
(3100.11),
(4500.22),
(4000.33),
(3800.44),
(4250.55),
(2900.66),
(3400.77),
(4600.88),
(4800.99),
(3700.12),
(3150.23),
(4500.34),
(4700.45),
(3300.56),
(3650.67),
(3950.78),
(4225.89),
(4320.90),
(2888.01),
(3777.12),
(3999.23),
(4125.34),
(4390.45),
(2550.56),
(2890.67),
(3190.78),
(3440.89),
(3690.90),
(4125.01),
(4300.12),
(4700.23),
(3800.34),
(2950.45),
(3150.56),
(3999.67),
(4230.78),
(4560.89),
(4850.90),
(4900.01),
(4999.12),
(5100.23),
(5300.34),
(5500.45),
(5700.56),
(5900.67);

-- DADOS TABELA TAXA


INSERT INTO taxa(administrao, carregamento, saida) VALUES 
('2%', '10%', '6%');


 -- DADOS TABELA PREVIDENCIA
 -- CÓDIGO, APORTE E DATA DE INICIO (57)
 
 
 INSERT INTO previdencia_privada(codprevidencia, aporte, data_de_inicio) VALUES
 ('100', '300,00', '1995_04_15'),
 ('101', '500,00', '2003_09_23'),
 ('102', '400,00', '1987_12_31'),
 ('103', '600,00', '2010_07_08'),
 ('104', '350,00', '1998_03_19'),
 ('105', '200,00', '2005_11_25'),
 ('106', '140,00', '1990_06_12'),
 ('107', '215,00', '2013_02_27'),
 ('108', '120,00', '2001_08_30'),
 ('109', '170,00', '1997_05_05'),
 ('110', '500,00', '2007_10_14'),
 ('111', '340,00', '2012_01_18'),
 ('112', '350,00', '1992_09_11'),
 ('113', '180,00', '2009_04_22'),
 ('114', '210,00', '1985_02_28'),
 ('115', '165,00', '2004_12_03'),
 ('116', '313,00', '1994_07_16'),
 ('117', '275,00', '2015_06_24'),
 ('118', '137,00', '1988_03_04'),
 ('119','204,00', '2002_11_10'),
 ('120', '213,00', '2011_08_02'),
 ('121', '150,00', '1993_05_29'),
 ('122', '210,00', '2000_10_06'),
 ('123', '400,00', '1996_01_09'),
 ('124', '410,00', '2006_03_13'),
 ('125', '125,00', '1999_12_17'),
 ('126', '220,00', '2014_09_21'),
 ('127', '310,00', '1989_02_08'),
 ('128','250,00', '2008_05_26'),
 ('129', '350,00', '1991_07_20'),
 ('130', '220,00', '2017_04_12'),
 ('131', '320,00', '1995_11_03'),
 ('132', '150,00', '2018_01_15'),
 ('133', '250,00', '1990_08_27'),
 ('134', '110,00', '2001_03_07'),
 ('135', '210,00', '1997_10_25'),
 ('136', '220,00', '2019_06_28'),
 ('137', '300,00', '1992_12_05'),
 ('138', '310,00', '2003_07_19'),
 ('139', '230,00', '1986_11_14'),
 ('140', '220,00', '2010_02_20'),
 ('141', '175,00','1994_09_08'),
 ('142', '285,00', '2007_04_30'),
 ('143', '300,00', '1985_06_18'),
 ('144', '200,00' ,'2012_11_09'),
 ('145', '100,00','2000_12_24'),
 ('146', '170,00', '1996_05_11'),
 ('147','245,00', '1989_08_07'),
 ('148', '170,00', '2014_02_03'),
 ('149', '220,00','2005_10_28'),
 ('150', '450,00', '1999_07_14'),
 ('151', '250,00', '2013_09_22'),
 ('152', '270,00', '2002_06_16'),
 ('153', '280,00', '1991_03_12'),
 ('154', '290,00', '2016_08_19'),
 ('155', '275,00', '1998_11_04'),
 ('156', '285,00', '2009_01_23'),
 ('157', '290,00', '1987_05_31');
 
 -- DADOS TABELA ENDEREÇO
 -- CÓDIGOS
 
 
 INSERT INTO endereço (codEND) VALUES
('158'),
('159'),
('160'),
('161'),
('162'),
('163'),
('164'),
('165'),
('166'),
('167'),
('168'),
('169'),
('170'),
('171'),
('172'),
('173'),
('174'),
('175'),
('176'),
('177'),
('178'),
('179'),
('180'),
('181'),
('182'),
('183'),
('184'),
('185'),
('186'),
('187'),
('188'),
('189'),
('190'),
('191'),
('192'),
('193'),
('194'),
('195'),
('196'),
('197'),
('198'),
('199'),
('200'),
('201'),
('202'),
('203'),
('204'),
('205'),
('206'),
('207'),
('208'),
('209'),
('210'),
('211'),
('212'),
('213'),
('214');