 -- Em que bancos/corretoras estão cadastrados todos os clientes?
	SELECT clientes.nome, banco.nome 
	FROM clientes 
	inner join banco ON clientes.CNPJ_banco=banco.CNPJ;
 
-- Desses clientes, quantos são associados?
	SELECT count(nome)
	FROM cliente
	WHERE EXISTS (SELECT CPF FROM associado WHERE cliente.CPF = associado.CPF);

-- Qual a média de salários desses funcionários por empresa?
	SELECT AVG(funcionario.salario) as media, empresa.nome
	FROM funcionario inner join empresa ON 	funcionario.CNPJ_empresa=empresa.CNPJ
	group by nome empresa
	order by media desc;

-- Quais funcionários recebem até dois salários mínimos?
	SELECT nome, salario from funcionário
	WHERE salario <= 2824.00
	order by salario;

-- Qual a soma total da renda de associados distribuída por associação?
	SELECT associação.nome, sum(associado.renda)
	from associação inner join associado ON (associação.CNPJ = associado.CNPJ_associacao)
	group by associação.nome;

-- Existe algum funcionário/associado que não possui um plano de previdência privada?
	select * from cliente
	where cpf not in (select cpf from previdenciaP);

-- Qual a diferença entre salários e seus aportes?
	SELECT funcionário.salario, previdenciaP.aporte, funcionário.salario - previdenciaP.aporte
	from funcionário inner join previcenciaP ON
	funcionário.CPF = previdenciaP.CPF;

--  ⁠Quais associações (top 3) mais possuem contribuintes?
	SELECT associação.nome from associação inner join 	
	fundopensao ON associação.CNPJ = fundopensao.CNPJ_associacao 
	group by associação.nome
	order by desc
	limit 3;
	
-- Média anual de contribuições em previdência privada.
	select avg(aporte*12) from previdenciaP;

-- Qual a taxa incidente sobre cada aporte de cliente?
	select previdenciaP.cpf_cliente, previdênciaP.aporte, 	(taxas.administracao+taxas.carregamento+taxas.saida) from previdenciaP inner join taxas
	on previdenciaP.codPrevidencia = taxas.codPrevidencia;

-- Quando cada cliente iniciou sua contribuição à previdência privada?
	SELECT cliente.nome, previdenciaP.datainicio
	from cliente left join previdenciaP on cliente.cpf = previdenciaP.cpf_cliente;

-- Qual somatório do fundo de pensão de cada cliente funcionário?
	select sum((funcionário.salario*administracao.valorempresa)+(funcionário.salario*administracao.valorfuncionario)), administracao.cpf_func
	from funcionário inner join administração on funcionário.cpf=administração.cpf_func;

-- Em qual estado reside a maior parte dos clientes?
	select endereço.estado inner join cliente on endereço.codEND = cliente.codEND
	group by endereço.estado;
	
-- Qual valor total acumulado por cada plano/taxa de previdência privada?
	select sum(aporte), contribuicao from previdenciaP
	group by contribuicao;
	
 -- Em quais anos (top 2) ocorreram maiores números de cadastros de clientes na previdência privada?
	select data_de_inicio, count(codPrevidencia) from previdenciaP 
	group by data_de_inicio
	order by count(codPrevidencia) desc
	limit 2;

-- teste dos codigos
-- adicionar os dados das chaves estrangeiras
-- montar pdf bonitinho
