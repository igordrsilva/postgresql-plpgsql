CREATE OR REPLACE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
    DECLARE
        instrutor instrutor;
    BEGIN 
        SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

        -- se o salário do instrutor for maior do que 300 reais, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
        /*IF instrutor.salario > 300 THEN
            RETURN 'Salário está ok.';
        ELSEIF instrutor.salario = 300 THE
            RETURN 'Salário pode aumentar';
        ELSE
            RETURN 'Salário está defasado';     
        END IF;*/
        CASE
            WHEN instrutor.salario = 100 THEN
                RETURN 'Salário muito baixo';
            WHEN instrutor.salario = 200 THEN
                RETURN 'Salário baixo';
            WHEN instrutor.salario = 300 THEN
                RETURN 'Salário ok';
            ELSE
                RETURN 'Salário ótimo';
        END CASE;
    END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok(instrutor.id) FROM instrutor;

CREATE OR REPLACE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
    DECLARE
        instrutor instrutor;
    BEGIN 
        SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

        -- se o salário do instrutor for maior do que 300 reais, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
        /*IF instrutor.salario > 300 THEN
            RETURN 'Salário está ok.';
        ELSEIF instrutor.salario = 300 THE
            RETURN 'Salário pode aumentar';
        ELSE
            RETURN 'Salário está defasado';     
        END IF;*/
        CASE
            WHEN 100 THEN
                RETURN 'Salário muito baixo';
            WHEN 200 THEN
                RETURN 'Salário baixo';
            WHEN 300 THEN
                RETURN 'Salário ok';
            ELSE
                RETURN 'Salário ótimo';
        END CASE;
    END;
$$ LANGUAGE plpgsql;