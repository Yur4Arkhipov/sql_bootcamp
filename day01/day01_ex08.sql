SELECT 
    po.order_date,
    CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM 
    (SELECT id, order_date, person_id FROM person_order) po
NATURAL JOIN 
    (SELECT id AS person_id, name, age FROM person) p
ORDER BY 
    order_date ASC, 
    person_information ASC;