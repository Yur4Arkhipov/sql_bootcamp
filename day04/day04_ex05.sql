CREATE VIEW v_price_with_discount AS
SELECT 
    p.name AS person_name,
    m.pizza_name,
    m.price AS real_price,
    (m.price - m.price * 0.1)::integer AS discount_price
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
ORDER BY person_name, pizza_name;

SELECT *  from v_price_with_discount