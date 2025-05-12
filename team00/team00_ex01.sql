WITH RECURSIVE tours AS (
    SELECT 
        point1 AS start,
        point2 AS next,
        ARRAY[point1, point2]::varchar[] AS path,
        cost AS total,
        1 AS cities_visited
    FROM graph 
    WHERE point1 = 'a'
    UNION ALL
    SELECT 
        t.start,
        g.point2,
        t.path || g.point2,
        t.total + g.cost,
        t.cities_visited + 1
    FROM tours t
    JOIN graph g ON t.next = g.point1
    WHERE (NOT g.point2 = ANY(t.path)) OR (g.point2 = t.start AND t.cities_visited = 3)
),
complete_tours AS (
    SELECT 
        total AS total_cost,
        '{' || array_to_string(path, ',') || '}' AS tour
    FROM tours
    WHERE 
        cities_visited = 4 
        AND next = start
)
SELECT * FROM (
    SELECT * FROM complete_tours
    WHERE total_cost = (SELECT MIN(total_cost) FROM complete_tours)
    UNION ALL
    SELECT * FROM complete_tours
    WHERE total_cost = (SELECT MAX(total_cost) FROM complete_tours)
) AS combined_results
ORDER BY total_cost, tour;