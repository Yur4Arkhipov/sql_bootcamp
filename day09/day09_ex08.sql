CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
RETURNS TABLE(fib integer) AS $$ 
    WITH RECURSIVE cte_fib(a, b) AS (
        SELECT 0, 1
        UNION ALL
        SELECT b, a + b FROM cte_fib WHERE b < pstop)
    SELECT a FROM cte_fib;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
