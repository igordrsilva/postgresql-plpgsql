CREATE TABLE instrutor (
    id SERIAL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Ígor Silva', 100);

-- Agora que temos a tabela "Instrutor" e um valor cadastrado na mesma
-- Podemos criar uma função para retornar o dobro do salário de um instrutor, passado como parâmetro
create function dobro_salario(instrutor) returns DECIMAL(10, 2) as $$
	select $1.salario * 2 as dobro;
$$ language sql;
-- Aqui definimos como parâmetro um valor do tipo instrutor, ou seja, um registro/linha completo(a) da tabela "Instrutor"
-- Deste registro, vamos pegar apenas o valor do salário e duplicar

select nome, dobro_salario(instrutor.*) from instrutor;
-- Explicando:
-- Estamos selectionando o nome e o dobro do salário de um instrutor
-- Para isso, estamos enviando para a função todos os campos de um instrutor, pois na função pegamos apenas o salário
-- E fazemos isso para todos os registros da tabela "Instrutor"