-- Para criar uma função no PL/SQL utilizamos a seguinte sintaxe
create function primeira_funcao() returns integer as ' 
	select(5 -3) * 2
' language sql;
-- Considerações:
-- "primeira_funcao" é o nome da mesma
-- Em "returns integer" definimos que a mesma irá retornar um valor inteiro
-- Caso a função não retornasse nada, poderíamos definir "returns void"
-- Após passar o que irá ser retornado, definimos o miolo/corpo da função
-- Para isso, colocamos o "as '' ", ou seja, todo o corpo da função deve ficar ente as aspas simples
-- Ao final, definimos a linguagem que utilizamos na mesma "language sql"

-- Para executarmos a função criada, podemos fazer da seguinte forma
select primeira_funcao(); -- Dessa forma quando a função retorna apenas um valor, como é o nosso caso atual
-- select * primeira_funcao(); -- Dessa forma quando a função retorna mais de um valor

-- Quando rodamos o select para chamar a função, a coluna que nos é retornada tem o próprio nome da função
-- Para alterar isso, podemos fazer da sguinte maneira
select primeira_funcao() as numero;