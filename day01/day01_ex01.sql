(SELECT person.name AS object_name FROM person ORDER BY object_name)
UNION ALL
(SELECT menu.pizza_name AS object_name FROM menu ORDER BY object_name);

SELECT object_name FROM (
    (SELECT person.name AS object_name, 1 AS main_order FROM person)
    UNION ALL
    (SELECT menu.pizza_name AS object_name, 2 AS main_order FROM menu)
)
ORDER BY main_order, object_name