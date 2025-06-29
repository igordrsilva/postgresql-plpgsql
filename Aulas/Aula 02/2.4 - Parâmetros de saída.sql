-- Nesse caso, queremos criar uma função para retornar dois valores
-- Vamos passar dois arumentos e retornar a soma e o produto
-- Para termos estes dois valores de saída, podemos passar entre os () da função os parâmetros nomeados com 'out'
-- Ou seja, recebemos dois parâmetros de entrada (in) e devolvemos dois parâmetros de saída (out)
-- Neste caso, removemos a parte de 'returns tipo', pois o retorno já está definido
create function soma_produto(numero_1 decimal, numero_2 decimal,
							 out soma decimal, out produto decimal) as $$
	select
		numero_1 + numero_2 as soma,
		numero_1 * numero_2 as produto;
$$ language sql;
-- Se quisessemos, poderíamos passar o 'in' para os parâmetros de entrada da função

select * from soma_produto(3, 3);

-- O que também podería ser feito, é criar um tipo de retorno
create type dois_valores_decimais as (soma decimal, produto decimal);

-- Aqui podemos definir o returns e remover os parâmetros 'out'
drop function soma_produto;
create function soma_produto(numero_1 decimal, numero_2 decimal) returns dois_valores_decimais as $$
	select
		numero_1 + numero_2 as soma,
		numero_1 * numero_2 as produto;
$$ language sql;
-- Dessa forma, temos o mesmo resultado do cenário anterior

select * from soma_produto(3, 3);

-- Agora quando voltamos ao cenário da aula anterior, dos instrutores mais bem pagos
-- No lugar de definir um conjunto de valores do tipo instrutor, podemos fazer da seguinte forma
drop function instrutores_bem_pagos;
create function instrutores_bem_pagos(valor_salario decimal, out nome varchar, out salario decimal) returns setof record as $$
	select nome, salario
	from instrutor 
	where salario > valor_salario;
$$ language sql;

select * from instrutores_bem_pagos(300.0);

-- Apenas recapitulando
-- Criamos uma função e definimos quais is valores de entrada e de saída
-- Como queremos devolver um conjunto de valores, definimos, no returns, setof
-- Mas não vamos retornar todos os campos do tipo instrutor, apenas os já definidos como parâmetros de saída
-- Então colocamos como valor do returns: setof record
-- Ou seja, um conjunto de alguns valores, já definidos nos parâmetros de saída