-- drop function tabuada;
create or replace function tabuada(numero integer) returns setof varchar as $$	
	declare
		multiplicador integer default 1;
	begin
	-- Uma outra estrutura de repetição é o while loop, onde definimos a condição de saída logo no início 
		while multiplicador < 10 loop
			return next numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
			multiplicador := multiplicador + 1;
		end loop;
	end;
$$ language plpgsql;

select * from tabuada(3);