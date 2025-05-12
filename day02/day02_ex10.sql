WITH peoples AS 
    (SELECT id, name, address
    FROM person)
SELECT 
    p1.name AS person_name1,
    p2.name AS person_name2,
    p1.address AS common_address
FROM peoples p1
CROSS JOIN peoples p2 WHERE p1.address = p2.address AND p1.id > p2.id
ORDER BY p1.name, p2.name, p1.address;