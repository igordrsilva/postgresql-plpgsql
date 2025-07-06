-- Em casos onde temos mais de uma condição, podemos usar o elseif para criar uma validação a mais
create or replace function salario_ok(id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		-- Se for maior que R$300,00, está OK! Se for igual a R$300,00 pode aumentar. Caso contrário, o salário está defasado!
		if instrutor.salario > 300 then 
			return 'Salário está ok!';
		elseif instrutor.salario = 300 then
			return 'Pode aumentar!';
		else
			return 'Salário defasado!';
		end if;
	end;
$$ language plpgsql;

select nome, salario_ok(id) from instrutor;