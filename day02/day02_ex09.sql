SELECT p.name AS person_name
FROM person p
WHERE 
    p.gender = 'female'
    AND EXISTS (
        SELECT 1 
        FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        WHERE po.person_id = p.id
        AND m.pizza_name = 'pepperoni pizza'
    )
    AND EXISTS (
        SELECT 1 
        FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        WHERE po.person_id = p.id
        AND m.pizza_name = 'cheese pizza'
    )
ORDER BY 
    p.name ASC;