alter table previdenciaP
add column contribuicao decimal(5,3) not null;

update previdenciaP
set contribuicao = 0.075 where salario < 2826.65;
update previdenciaP
set contribuicao = 0.15 where 2826.66 < salario < 3751.05;
update previdenciaP 
set contribuicao = 0.225 where 3751.06 < salario < 4664.68;
update previdenciaP
set contribuicao = 0.275 where salario > 4664.69;
