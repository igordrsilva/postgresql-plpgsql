-- Agora vamos trabalhar com funções para tomar decisões baseadas em condições
create or replace function salario_ok(id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		-- Se o salário do instrutor for maior que R$200, ok, se não, pode aumentar
		if instrutor.salario > 200 then 
			return 'Salário está ok!';
		else
			return 'Salário pode aumentar';
		end if;
	end;
$$ language plpgsql;

-- Aqui queremos saber o nome dos instrutores e saber se o salário está justo
-- Para isso, passamos o valor de cada instrutor para a função, buscando na tabela instrutor
select nome, salario_ok(instrutor.id) from instrutor;

-- Pensando em algo mais performático, seria melhor fazer da seguinte forma
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
	begin
		-- Se o salário do instrutor for maior que R$200, ok, se não, pode aumentar
		if instrutor.salario > 200 then 
			return 'Salário está ok!';
		else
			return 'Salário pode aumentar';
		end if;
	end;
$$ language plpgsql;

select nome, salario_ok(instrutor) from instrutor;