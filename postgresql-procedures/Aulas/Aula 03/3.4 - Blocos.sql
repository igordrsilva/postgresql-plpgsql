create or replace function primeira_pl() returns integer as $$
	declare
		primeira_variavel integer default 3;
	begin
		primeira_variavel := primeira_variavel * 2;

		-- Aqui podemos criar sub blocos, onde é possível declarar novas variáveis que serão implementadas apenas neste novo bloco
		declare
			primeira_variavel integer; -- Aqui criamos uma outra variável com o mesmo nome, válida para este bloco
		begin
			primeira_variavel := 7;
		end;
		-- Quando retornamos a variável, o valor devolvido será o valor de fora, do bloco principal
		return primeira_variavel;
	end;
$$ language plpgsql;

select primeira_pl() as num;

-- Em um outro cenário, vamos criar um outro sub bloco begin/end, mas sem o bloco de declaração
create or replace function primeira_pl() returns integer as $$
	declare
		primeira_variavel integer default 3;
	begin
		primeira_variavel := primeira_variavel * 2;

		-- Agora a variável primeira_variavel, que foi criada no bloco principal, será utilizada tanto no bloco principal quando no sub bloco
		begin
			primeira_variavel := 7;
		end;
		-- E quando retornamos a variável, o valor devolvido será o último valor atribuído à variável, ou seja, do sub bloco
		return primeira_variavel;
	end;
$$ language plpgsql;

select primeira_pl() as num;