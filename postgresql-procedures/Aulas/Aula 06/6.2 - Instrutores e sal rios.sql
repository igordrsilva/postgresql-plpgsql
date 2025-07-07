/*
* Inserir instrutores (com salários).
* Se o salário for maior do que a média, salvar um log
* Salvar outro log dizendo que fulano recebe mais do que x% da grade de instrutores. 
*/

-- Para salvar os logs, precisamos de uma tabela
create table log_instrutores(
	id serial primary key,
	created_at timestamp default current_timestamp,
	informacao varchar(255)
);

create or replace function criar_instrutor(nome_instrutor varchar, salario_instrutor decimal) returns void as $$
	declare
		id_instrutor integer;
		media_salarial decimal;
		total_instrutores integer default 0;
		instrutores_recebem_menos integer default 0;
		salario decimal;
		percentual decimal;
	begin
		-- Insere o novo instrutor
		insert into instrutor (nome, salario) values (nome_instrutor, salario_instrutor) returning id into id_instrutor;

		-- Calcula a média salarial
		select avg(instrutor.salario) into media_salarial from instrutor where id <> id_instrutor;

		-- Insere um log informando se o instrutor recebe mais que a média dos instrutores
		if salario_instrutor > media_salarial then
			insert into log_instrutores(informacao) values (nome_instrutor || ' recebe acima da média!');
		end if;

		-- Para calular a porcentagem de instrutores que recebem menos que o instrutor inserido, precisamos dividir o número de instrutores que recebem menos pelo total de instrutores
		-- Por isso, fazemos um for para cada instrutor e somamos +1 para cada instrutor que recebe menos que o inserido. Além de somar +1 para cada instrutor da tabela
		for salario in select instrutor.salario from instrutor where id <> id_instrutor loop
			total_instrutores := total_instrutores + 1;
			if salario_instrutor > salario then
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			end if;
		end loop;
		
		percentual := (instrutores_recebem_menos::decimal /total_instrutores::decimal) * 100;
		insert into log_instrutores(informacao) values(nome_instrutor || ' recebe mais do que ' || percentual || '% da grade de instrutores.');
	end;
$$ language plpgsql;

select * from instrutor;
select criar_instrutor('Artur Costa', 350.0);
select * from log_instrutores;