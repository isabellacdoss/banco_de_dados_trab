 -- 1. Em que bancos/corretoras estão cadastrados todos os clientes? ok, funciona
    SELECT cliente.nome, banco.nome 
	FROM cliente
	inner join banco ON cliente.CNPJ_banco=banco.CNPJ;
    
-- 2. Desses clientes, quantos são associados? ok, funciona
	SELECT count(nome)
	FROM cliente
	WHERE EXISTS (SELECT CPF FROM associado WHERE cliente.CPF = associado.CPF_ass);


-- 4. Quais funcionários recebem até dois salários mínimos?  ok, funciona
	SELECT CPF_fun, salario from funcionario
	WHERE salario <= 2824.00
	order by salario;

-- 5. Qual a soma total da renda de associados distribuída por associação? OK, FUNCIONA
	SELECT associacao.nome, sum(associado.renda)
	from associacao inner join associado ON (associacao.CNPJ = associado.CNPJ_assoc)
	group by associacao.nome;

-- 6. Quais clientes possuem previdência?   ok, funciona
	select * from cliente
	where CPF not in (select CPF from previdenciaP);

-- 7. Qual a diferença entre salários e seus aportes? ok, funciona
	SELECT funcionario.salario, previdenciaP.aporte, funcionario.salario - previdenciaP.aporte
	from funcionario inner join previcenciaP ON
	funcionario.CPF = previdenciaP.CPF;

	
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
    
	
 -- 15. Em quais anos ocorreram maiores números de cadastros de clientes na previdência privada? funciona
	select year(datainicio), count(codPrevidencia) from previdenciaP 
	group by year(datainicio)
	order by count(codPrevidencia) desc;
    
    



