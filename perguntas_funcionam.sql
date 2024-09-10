 -- 1. Em que bancos/corretoras estão cadastrados todos os clientes?
    SELECT cliente.nome, banco.nome 
	FROM cliente
	inner join banco ON cliente.CNPJ_banco=banco.CNPJ;
    
-- 2. Desses clientes, quantos são associados? 
	SELECT count(nome)
	FROM cliente
	WHERE EXISTS (SELECT CPF FROM associado WHERE cliente.CPF = associado.CPF_ass);
    
-- 3. Qual a média de salários desses funcionários por empresa?    
    SELECT AVG(funcionario.salario) as media, pj.nome
	FROM funcionario inner join pj ON funcionario.CNPJ_empresa=pj.CNPJ
	group by pj.nome;

-- 4. Quais funcionários recebem até dois salários mínimos? 
	SELECT CPF_fun, salario from funcionario
	WHERE salario <= 2824.00
	order by salario;

-- 5. Qual a soma total da renda de associados distribuída por associação? 
	SELECT associacao.nome, sum(associado.renda)
	from associacao inner join associado ON (associacao.CNPJ = associado.CNPJ_assoc)
	group by associacao.nome;

-- 6. Quais clientes possuem previdência?   
	select * from cliente
	where CPF not in (select CPF from previdenciaP where previdenciaP.cliente_CPF = cliente.CPF);

-- 7. Qual a diferença entre salários e seus aportes?
	SELECT funcionario.salario, previdenciaP.aporte, funcionario.salario - previdenciaP.aporte
	from funcionario inner join previdenciaP ON
	funcionario.CPF_fun = previdenciaP.cliente_CPF;
    
-- 8. ⁠Quais associações mais possuem contribuintes? 
	SELECT pj.nome, count(funcionario.CPF_fun) from pj inner join 	
	funcionario ON pj.CNPJ = funcionario.CNPJ_empresa 
	group by pj.nome;	-- esse codigo me devolve quantidade por EMPRESA não por associações
    
    SELECT pj.nome, count(associado.CPF_ass) from pj inner join 	
	associado ON pj.CNPJ = associado.CNPJ_assoc 
	group by pj.nome;	-- código correto!
 
    
-- 9. Média anual de contribuições em previdência privada: 
	select avg(aporte*12) from previdenciaP;

-- 10. Qual a taxa incidente sobre cada aporte de cliente? 
	SELECT previdenciaP.cliente_CPF, previdenciaP.aporte, 
	COALESCE(taxas.administracao, 0) + COALESCE(taxas.carregamento, 0) + COALESCE(taxas.saida, 0) AS total_taxas
	FROM previdenciaP
	LEFT JOIN taxas ON previdenciaP.codPrevidencia = taxas.codPrevidencia;

-- 11. Quando cada cliente iniciou sua contribuição à previdência privada? 
	SELECT cliente.nome, previdenciaP.datainicio
	from cliente left join previdenciaP on cliente.CPF = previdenciaP.cliente_CPF;

-- 12. Qual somatório do fundo de pensão de cada cliente funcionário?  
	select sum((funcionario.salario*administracao.valorempresa)+(funcionario.salario*administracao.valorfuncionario)) as fundo_pensao, administracao.CPF_fun
	from funcionario inner join administracao on funcionario.CPF_fun = administracao.CPF_fun
    group by administracao.CPF_fun;

-- 13. Em qual estado reside a maior parte dos clientes? 
	select endereco.estado, count(cliente.CPF) from endereco inner join cliente on endereco.codEND = cliente.codEND
	group by endereco.estado;
    
 -- 14. Qual valor total acumulado por cada ano de início de previdência privada?
	select sum(aporte) as total_aportes, year(datainicio) from previdenciaP
	group by year(datainicio);
 
 -- 15. Em quais anos ocorreram maiores números de cadastros de clientes na previdência privada? 
	select year(datainicio), count(codPrevidencia) from previdenciaP 
	group by year(datainicio)
	order by count(codPrevidencia) desc;
    
    



