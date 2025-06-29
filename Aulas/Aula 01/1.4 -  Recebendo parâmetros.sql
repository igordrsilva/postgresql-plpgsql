-- Quando queremos passar um parâmetro para ser utilizando no corpo da função, passamos a referência dos mesmos dentro dos ()
create function soma_dois_numeros(numero_1 integer, numero_2 integer) returns integer as  '
	select numero_1 + numero_2
' language sql;

-- Dessa forma, o corpo da função utiliza dos parâmetros que serão passados quando a função for chamada
select soma_dois_numeros(3, 2) as soma;

-- Vamos apagar a função criada anteriormente
-- drop function soma_dois_numeros;

-- Caso não quisermos passar um nome para os parâmetros, podemos apenas definir o tipo dos mesmos
create function soma_dois_numeros(integer, integer) returns integer as  '
	select $1 + $2
' language sql;
-- Assim, no corpo da função, passamos a referência da posição dos parâmetros

select soma_dois_numeros(3, 2) as soma;