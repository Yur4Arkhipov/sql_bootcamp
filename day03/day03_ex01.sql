SELECT m.id AS menu_id
FROM menu m
WHERE NOT EXISTS (SELECT 1 FROM person_order po WHERE po.menu_id = m.id)
ORDER BY m.id ASC;