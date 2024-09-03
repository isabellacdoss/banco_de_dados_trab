use Previdencia;
create database Previdencia;
create table Banco(
CNPJ INT (14),
Nome VARCHAR (50));
create table Previdencia_Privada(
codPrevidenica INT (40),
Aportes INT(60),
Data_de_inicio DATE);
create table Taxas(
Adminstracao INT(30),
Carregamento INT(30),
Saida INT(30));
create table Associado(
idAssociado INT(40));
create table Associacao(
CNPJ INT(14),
Nome VARCHAR (50));
create table Administracao(
Valor_pago_empresa INT(40),
Valor_pago_funcionario INT(40));
