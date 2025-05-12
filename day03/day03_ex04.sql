(SELECT pz.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female'
    EXCEPT
    SELECT pz.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male')
UNION
(SELECT pz.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male'
    EXCEPT
    SELECT pz.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female')
ORDER BY pizzeria_name;