CREATE OR REPLACE FUNCTION tabuada (numero INTEGER) RETURNS SETOF VARCHAR AS $$ 
    BEGIN  
        FOR multiplicador IN 1..9 LOOP
            RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
        END LOOP;
    END;
$$ LANGUAGE plpgsql;


SELECT tabuada(9);

DROP FUNCTION instrutor_com_salario;
CREATE FUNCTION instrutor_com_salario (OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$
    DECLARE
        instrutor instrutor;
    BEGIN  
        FOR instrutor IN SELECT * FROM instrutor LOOP
            nome := instrutor.id;
            salario_ok = salario_ok(instrutor.id);

            RETURN NEXT;
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

