-- Para criar uma função que retorne a tabuada de um número
-- Gostaríamos de receber um número e retornar uma string, onde cada linha mostra a multiplicação, por exemplo
	
	/*
    1 x 1 = 1
	1 x 2 = 2
	1 x 3 = 3 
    */

-- Poderíamos usar o return next para ter múltiplos retornos, por exemplo:
	
create or replace function tabuada(numero integer) returns setof integer as $$	
    begin
        return next numero * 1;
        return next numero * 2;
        return next numero * 3;
    end;
$$ language plpgsql;

-- Mas como queremos retornar um conjunto (setof) de varchar (múltiplas linhas de strings)
-- Isso ficaria extremamente repetitivo. Por isso, podemos usar estruturas de repetição!
