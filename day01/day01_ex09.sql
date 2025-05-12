SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE pizzeria.id NOT IN (
    SELECT DISTINCT person_visits.pizzeria_id 
    FROM person_visits
)

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE NOT EXISTS (
    SELECT 1 
    FROM person_visits 
    WHERE person_visits.pizzeria_id = pizzeria.id
)