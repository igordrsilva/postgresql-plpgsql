-- Em casos onde temos muitas condições para validar, usamos o case when
drop function salario_ok;
create or replace function salario_ok(id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		case -- Quando o salário for igual a condição, retorna o seu determinado valor
			when instrutor.salario = 100 then
				return 'Salário muito baixo!';
			when instrutor.salario = 200 then
				return 'Salário baixo!';
			when instrutor.salario = 300 then
				return 'Salário ok!';
			else
				return 'Salário ótimo!';
		end case;
	end;
$$ language plpgsql;

select nome, salario_ok(id) from instrutor;

-- Aqui já otimizamos o nosso código, substituindo o if/else
-- Mas ainda repetimos alguns trechos, como "instrutor.salario = X"
-- Para melhorar ainda mais, podemos fazer
drop function salario_ok;
create or replace function salario_ok(id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		-- Colocamos o valor de validação uma vez em case e em cada when as possibilidades
		case instrutor.salario
			when 100 then
				return 'Salário muito baixo!';
			when 200 then
				return 'Salário baixo!';
			when 300 then
				return 'Salário ok!';
			else
				return 'Salário ótimo!';
		end case;
	end;
$$ language plpgsql;
-- Dessa forma, facilitamos ainda mais a leitura do código

select nome, salario_ok(id) from instrutor;