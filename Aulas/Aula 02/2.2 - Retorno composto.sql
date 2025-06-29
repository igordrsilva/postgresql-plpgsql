-- Perceba que, na função abaixo, podemos retornar um valor do tipo instrutor apenas selecionando os mesmos valores de um instrutor
create or replace function instrutor_falso() returns instrutor as $$
	select 22, 'Nome Falso', 200.0;
$$ language sql;
-- Isso é um retorno composto, onde retornamos vários tipos de variáveis, agregadas pelo tipo de instrutor

-- Se quisermos, podemos dar um select na função criada acima
select instrutor_falso();
-- Recebemos um retorno semelhante a '(22, "Nome Falso", 200.00)', mas em uma coluna apenas 'instrutor_falso'
-- Isso significa que temos três valores que podem ser separados entre três colunas
-- Como o tipo instrutor foi definido quando criamos a tabela, podemos fazer o seguinte
select * from instrutor_falso();
-- Aqui recebemos os valores separados nas devidas colunas
-- Isso, pois o postgres já entende o tipo instrutor e devolve com as devidas colunas, semelhante a um registro da tabela