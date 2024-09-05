use previdencia_privada;

 -- 1. Em que bancos/corretoras estão cadastrados todos os clientes? ok, funciona
    SELECT cliente.nome, banco.nome 
	FROM cliente
	inner join banco ON cliente.CNPJ_banco=banco.CNPJ;
    
-- 2. Desses clientes, quantos são associados? ok, funciona
	SELECT count(nome)
	FROM cliente
	WHERE EXISTS (SELECT CPF FROM associado WHERE cliente.CPF = associado.CPF_ass);

-- 3. Qual a média de salários desses funcionários por empresa?  não funciona
	SELECT AVG(funcionario.salario) as media, empresa.nome
	FROM funcionario inner join empresa ON 	funcionario.CNPJ_empresa=empresa.CNPJ
	group by empresa
	order by media desc;

-- 4. Quais funcionários recebem até dois salários mínimos?  ok, funciona
	SELECT CPF_fun, salario from funcionario
	WHERE salario <= 2824.00
	order by salario;

-- 5. Qual a soma total da renda de associados distribuída por associação? OK, FUNCIONA
	SELECT pj.CNPJ, sum(associado.renda)
	from pj inner join associado ON (pj.CNPJ = associado.CNPJ_assoc)
	group by pj.CNPJ;
    
-- 6. Quais clientes possuem previdência?   ok, funciona
	select * from cliente
	where CPF not in (select CPF from previdenciaP);

-- 7. Qual a diferença entre salários e seus aportes? ok, funciona
	SELECT funcionario.salario, previdenciaP.aporte, funcionario.salario - previdenciaP.aporte
	from funcionario inner join previcenciaP ON
	funcionario.CPF = previdenciaP.CPF;

--  8. ⁠Quais associações mais possuem contribuintes? funciona
	SELECT pj.nome, count(funcionario.CPF_fun) from pj inner join 	
	funcionario ON pj.CNPJ = funcionario.CNPJ_empresa 
	group by pj.nome;
	
-- 9. Média anual de contribuições em previdência privada: ok, funciona
	select avg(aporte*12) from previdenciaP;

-- 10. Qual a taxa incidente sobre cada aporte de cliente? ok, funciona
	SELECT previdenciaP.cliente_CPF, previdenciaP.aporte, 
	COALESCE(taxas.administracao, 0) + COALESCE(taxas.carregamento, 0) + COALESCE(taxas.saida, 0) AS total_taxas
	FROM previdenciaP
	LEFT JOIN taxas ON previdenciaP.codPrevidencia = taxas.codPrevidencia;

-- 11. Quando cada cliente iniciou sua contribuição à previdência privada? ok, funciona (mas tem valores nulos)
	SELECT cliente.nome, previdenciaP.datainicio
	from cliente left join previdenciaP on cliente.CPF = previdenciaP.cliente_CPF;

-- 12. Qual somatório do fundo de pensão de cada cliente funcionário?  não funciona
	select sum((funcionario.salario*administracao.valorempresa)+(funcionario.salario*administracao.valorfuncionario)), administracao.CPF_fun
	from funcionario inner join administracao on funcionario.CPF = administracao.CPF_fun;

-- 13. Em qual estado reside a maior parte dos clientes?  funciona
	select endereco.estado, count(cliente.CPF) from endereco inner join cliente on endereco.codEND = cliente.codEND
	group by endereco.estado;
    
	
-- 14. Qual valor total acumulado por cada plano/taxa de previdência privada?   não funciona
	select sum(aporte), contribuicao from previdenciaP
	group by contribuicao;
	
 -- 15. Em quais anos ocorreram maiores números de cadastros de clientes na previdência privada? funciona
	select year(datainicio), count(codPrevidencia) from previdenciaP 
	group by year(datainicio)
	order by count(codPrevidencia) desc;
    
    


