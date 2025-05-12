SELECT 
    m.pizza_name,
    m.price,
    pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM person_order po 
        WHERE po.menu_id = m.id
    )
ORDER BY 
    m.pizza_name ASC,
    m.price ASC;