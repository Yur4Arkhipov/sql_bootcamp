CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN menu m ON pz.id = m.pizzeria_id
WHERE 
    p.name = 'Dmitriy' AND
    pv.visit_date = '2022-01-08' AND
    m.price < 800
WITH DATA;

CREATE materialized VIEW mv_dmitriy_visits_and_eats_s
AS SELECT p.name AS pizzeria_name 
FROM menu 
INNER JOIN pizzeria p ON p.id = menu.pizzeria_id 
INNER JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id 
INNER JOIN person p2 ON p2.id = pv.person_id 
WHERE price < 800 AND p2.name = 'Dmitriy' AND visit_date = '2022-01-08'


select * from mv_dmitriy_visits_and_eats_s

select * from mv_dmitriy_visits_and_eats