-- Sabemos que em uma função, retorna-se apenas o primeiro valor da última query executada
-- Se quisermos retornar mais valores, precisamos retornar um conjunto de dados
-- Para isso, vamos simular um cenário onde queremos retornar todos os instrutores com salário maior X
insert into instrutor(nome, salario) values ('Ivan Silva', 200.0);
insert into instrutor(nome, salario) values ('Ivanor Silva', 300.0);
insert into instrutor(nome, salario) values ('Silvana Ferreira', 400.0);
insert into instrutor(nome, salario) values ('Heloísa Birck', 500.0);

-- Caso definissemos no returns o valor de instrutor, teríamos como retorno apenas o primeiro valor que corresponde ao where
-- Para termos como retorno um conjunto de valores, definimos o retorno como setof + tipo
-- setof -> significa set (conjunto) of (de) e passamos o tipo dos valores a serem devolvidos
create function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$
	select * 
	from instrutor 
	where salario > valor_salario;
$$ language sql;

-- Agora, quando passamos o valor do where, recebemos todos os instrutores que correspondem ao parâmetro, não apenas o primeiro
select * from instrutores_bem_pagos(300.0);