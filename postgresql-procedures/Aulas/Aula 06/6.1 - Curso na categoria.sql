create or replace function criar_curso(nome_curso varchar, nome_categoria varchar) returns void as $$
	declare
		id_categoria integer;
	begin
		-- Cadastra categoria
		select id into id_categoria from categoria where nome = nome_categoria;
		if not found then -- No plpgsql, quando rodamos um select, recebemos uma variável chamada "found" que nos informa se foi encontrado algo no select
			insert into categoria (nome) values (nome_categoria) returning id into id_categoria; -- Insere a nova categoria e retorna o id da mesma
		-- else
		-- 	return 'Já existe uma categoria com este nome!'
		end if;
		
		-- Cadastra curso
		insert into curso (nome, categoria_id) values (nome_curso, id_categoria);
		
	end;
$$ language plpgsql;

select criar_curso('PHP','Programação');
select criar_curso('Java','Programação');

select * from categoria;
select * from curso;