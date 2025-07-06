-- Agora que entendemos a estrutura do plpgsql, vamos reescrever as funções que já criamos
create or replace function criar_nome(nome varchar) returns void as $$
	-- iniciar e finalizar o bloco principal da função
	begin
		insert into nome(nome) values(nome);
	end;
$$ language plpgsql;

select * from criar_nome('Ivanor'); -- Não recebemos nada, pois a função retorna void
select * from nome; -- Mas quando conferimos, o nosso nome foi criado


create or replace function instrutor_falso() returns instrutor as $$
	declare
		retorno instrutor;
	begin
		select 22, 'Nome falso', 200.0 into retorno; -- Atribuímos a linha, do tipo instrutor à  nossa variável "retorno"
		return retorno; -- E aqui retornamos a variável
	end;
$$ language plpgsql;

select * from instrutor_falso();

-- Por fim...
create or replace function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$
	begin
		return query select * from instrutor where salario > valor_salario;
	end;
$$ language plpgsql;

select * from instrutores_bem_pagos(200.0);