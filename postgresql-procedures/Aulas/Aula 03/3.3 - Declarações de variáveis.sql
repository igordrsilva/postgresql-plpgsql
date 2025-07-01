create or replace function primeira_pl() returns integer as $$
	begin
		return 1;
	end;
$$ language plpgsql;

select primeira_pl() as num;

-- Vamos entender como aplicar variáveis dentro das funções plpgsql
-- Para declarar as variáveis, precisamos criar uma outra estrutura dentro da function plpgsql, chamada declare
-- A mesma, vai antes dos blocos begin/end. Aqui declaramos todas as variáveis que serão utilizadas dentro da function
create or replace function primeira_pl() returns integer as $$
	declare
		primeira_variavel integer default 3; -- declaramos a variável e o seu tipo, além de poder definir um valor padrão
	begin
		primeira_variavel := primeira_variavel * 2; -- Também podemos manipular os dados de uma variável
		return primeira_variavel;
	end;
$$ language plpgsql;

select primeira_pl() as num;