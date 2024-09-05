-- inserindo dados sobre salario em funcionario:
UPDATE funcionario
SET contribuicao = 0.075 where salario < 2826.65;
UPDATE funcionario
SET contribuicao = 0.15 where 2826.66 < salario < 3751.05;
UPDATE funcionario
SET contribuicao = 0.225 where 3751.06 < salario < 4664.68;
UPDATE funcionario
SET  contribuicao = 0.275 where salario > 4664.69;

-- inserindo dados sobre contribuicao em previdenciaP:
update previdenciaP
SET contribuicao = (select contribuicao from funcionario where funcionario.CPF_fun = previdenciaP.cliente_CPF);


