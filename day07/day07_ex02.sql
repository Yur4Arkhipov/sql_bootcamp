WITH visits AS (
    SELECT 
        pz.name AS name,
        'visit' AS action_type,
        COUNT(*) AS count
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC LIMIT 3
), orders AS (
    SELECT 
        pz.name AS name,
        'order' AS action_type,
        COUNT(*) AS count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC LIMIT 3
), stats AS (
    SELECT * FROM visits
    UNION ALL
    SELECT * FROM orders
)
SELECT 
    name,
    count,
    action_type
FROM stats
ORDER BY 
    action_type ASC,
    count DESC;
