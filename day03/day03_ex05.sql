SELECT DISTINCT pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
WHERE p.name = 'Andrey'
AND NOT EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE po.person_id = p.id
    AND m.pizzeria_id = pz.id
)
ORDER BY pz.name;