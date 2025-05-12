SELECT pz.name, rating
FROM pizzeria pz
LEFT JOIN person_visits pv ON pz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL