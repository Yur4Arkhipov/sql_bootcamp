WITH visits AS (
    SELECT 
        pz.name AS name,
        COUNT(*) AS visit_count,
        0 AS order_count
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
), orders AS (
    SELECT 
        pz.name AS name,
        0 AS visit_count,
        COUNT(*) AS order_count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
), stats AS (
    SELECT * FROM visits
    UNION ALL
    SELECT * FROM orders
), end_stats AS (
    SELECT 
        name,
        SUM(visit_count) AS visit_count,
        SUM(order_count) AS order_count,
        SUM(visit_count + order_count) AS total_count
    FROM stats
    GROUP BY name
)
SELECT 
    name,
    total_count
FROM end_stats
ORDER BY 
    total_count DESC;