INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH counts_order AS (
    SELECT
        person_id,
        menu.pizzeria_id,
        COUNT(*) AS count_order,
        ROW_NUMBER() OVER() AS id 
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    GROUP BY person_id, pizzeria_id
)
SELECT 
    id,
    person_id,
    pizzeria_id,
    CASE 
        WHEN count_order = 1 THEN 10.5
        WHEN count_order = 2 THEN 22
        ELSE 30
    END AS discount
FROM counts_order;