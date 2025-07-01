-- Até o momento, utilizamos o SQL como linguagem para criar as funções
-- Mas não poderemos seguir dessa forma, pois com SQL não é possível tomar decisões ou criar laços de repetição
-- Para isso, vamos utilizar o plpgsql que é uma linguagem semelhante ao SQL, mas para criar lógica

-- A estrutura de uma função na linguagem plpgsql segue o modelo abaixo
create or replace function primeira_pl() returns integer as $$
	begin
		select 1;
	end;
$$ language plpgsql;
-- Até aqui, segue a mesma estrutura que estamos acostumados, apenas alterando a language
-- Outro ponto importante de alteração na estrutura é o corpo da função
-- Aqui, precisamos definir onde será o corpo da função, indicado pelo "begin" e "end"

-- Executando a nossa primeira função plpgsql
select primeira_pl() as num;
-- Perecebemos que não recebemos nada

-- Aqui temos um ponto muito importante, como essa estrutura segue o modelo de programação
-- Quando falamos em retornar um inteiro, precisamos colocar um return no corpo da função
drop function primeira_pl;
create or replace function primeira_pl() returns integer as $$
	begin
		return 1;
	end;
$$ language plpgsql;

-- Agora sim, recebemos o retorno da função
select primeira_pl() as num;