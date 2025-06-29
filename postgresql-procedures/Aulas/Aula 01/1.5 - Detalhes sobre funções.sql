-- Vamos entender melhor como funciona o returns das funções
create table nome (
	id serial primary key,
	nome varchar(255) not null
);

-- Para não precisar ficar dando drop sempre que alteramos uma função já criada, podemos adicionar "create or replace function"
-- Apenas pontuando, quando vamos substituir uma função, replace, não podemos substituir tipos de parâmtros ou retornos
-- Caso seja necessário fazer esta alteração, devemos dar um drop function e criá-la novamente

-- Aqui vamos criar uma função que insira na tabela nome novos registros
create or replace function cria_nome(name varchar) returns varchar as '
	insert into nome 
		(nome)
	values (name);

	select name;
' language sql;
-- Quando não colocamos a linha "select name" deu erro na função, pois apenas a função do insert não retorna nada
-- E como definimos que a função iria devolver um varchar, deu erro
-- Dessa forma, adicionamos o select name para que a função devolva o parâmetro introduzido à função

select cria_nome('Ivan Silva');

select * from nome;

-- Há uma outra notação para definir o corpo da função, no lugar de 'corpo da função' usamos $$corpo da função$$
create or replace function cria_nome(name varchar) returns varchar as $$
	insert into nome 
		(nome)
	values ('Ígor');

	select name;
$$ language sql;
-- Neste caso a sintaxe fica até melhor, visualmente, pois caso quisermos introduzir textos no meio da função, é possível
-- Da maneira como fazíamos antes, daria erro