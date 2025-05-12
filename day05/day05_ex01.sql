SELECT
    m.pizza_name,
    pz.name AS pizzeria_name
FROM pizzeria pz
JOIN menu m ON pz.id = m.pizzeria_id

SET enable_seqscan TO off;
EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id