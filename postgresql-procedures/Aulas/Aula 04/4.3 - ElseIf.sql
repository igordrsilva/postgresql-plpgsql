DROP FUNCTION salario_ok;
CREATE OR REPLACE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
    DECLARE
        instrutor instrutor;
    BEGIN 
        SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

        -- se o salário do instrutor for maior do que 300 reais, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
        IF instrutor.salario > 300 THEN
            RETURN 'Salário está ok.';
        ELSE 
            IF instrutor.salario = 300 THE
                RETURN 'Salário pode aumentar';
            ELSE
                RETURN 'Salário está defasado';     
        END IF;
    END;
$$ LANGUAGE plpgsql;


SELECT nome, salario_ok(instrutor.id) FROM instrutor;

CREATE OR REPLACE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
    DECLARE
        instrutor instrutor;
    BEGIN 
        SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

        -- se o salário do instrutor for maior do que 300 reais, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
        IF instrutor.salario > 300 THEN
            RETURN 'Salário está ok.';
        ELSEIF instrutor.salario = 300 THE
            RETURN 'Salário pode aumentar';
        ELSE
            RETURN 'Salário está defasado';     
        END IF;
    END;
$$ LANGUAGE plpgsql;