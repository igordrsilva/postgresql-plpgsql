/*Para criar uma função que retorne a tabuada de um número
Gostaríamos de receber um número e retornar uma string, onde cada linha mostra a multiplicação, por exemplo
	
	1 x 1 = 1
	1 x 2 = 2
	1 x 3 = 3 

Poderíamos usar o return next para ter múltiplos retornos, por exemplo:
	
	create or replace function tabuada(numero integer) returns setof integer as $$	
		begin
			return next numero * 1;
			return next numero * 2;
			return next numero * 3;
		end;
	$$ language plpgsql;

Mas como queremos retornar um conjunto (setof) de varchar (múltiplas linhas de strings)
Isso ficaria extremamente repetitivo. Por isso, podemos usar estruturas de repetição!
*/
drop function tabuada;
create or replace function tabuada(numero integer) returns setof varchar as $$	
	declare
		multiplicador integer default 1;
	begin
		-- Multiplicador que vai de 1 até 9. 
		-- Para cada execução, exiba multiplicador x numero. Além de somar +1 ao seu valor
		loop
			-- Adiciona este retorno ao conjunto e continua executando. Formatamos para a saída ser "n x m = y"
			return next numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
			multiplicador := multiplicador + 1; -- Soma +1 ao multiplicador
			exit when multiplicador = 10; -- Quando o multiplicador for igual a 10, saia do loop
		end loop;
	end;
$$ language plpgsql;

select * from tabuada(3);