CREATE TABLE juncao_CPF_CNPJ (COD int auto_increment primary key , CPF_CNPJ	varchar (14))
SELECT CPF as CPF_CNPJ
FROM clientes
UNION ALL
SELECT CNPJ from empresas
union all 
select CNPJ from associacao
union all
select CNPJ from banco;

update banco
set codEND = (select COD from juncao_CPF_CNPJ where banco.CNPJ = juncao_CPF_CNPJ.CPF_CNPJ);
update cliente 
set codEND = (select COD from juncao_CPF_CNPJ where cliente.CPF = juncao_CPF_CNPJ.CPF_CNPJ);
update associacao
set codEND = (select COD from juncao_CPF_CNPJ where associacao.CNPJ = juncao_CPF_CNPJ.CPF_CNPJ);
update empresa
set codEND = (select COD from juncao_CPF_CNPJ where empresa.CNPJ = juncao_CPF_CNPJ.CPF_CNPJ);
update funcionario
set codEND = (select COD from juncao_CPF_CNPJ where funcionario.CPF_fun = juncao_CPF_CNPJ.CPF_CNPJ);
update associado 
set codEND = (select COD from juncao_CPF_CNPJ where associado.CPF_ass = juncao_CPF_CNPJ.CPF_CNPJ);

