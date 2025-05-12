CREATE TABLE graph(  
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost INTEGER
);

INSERT INTO graph VALUES ('a', 'b', 10);
INSERT INTO graph VALUES ('b', 'a', 10);
INSERT INTO graph VALUES ('a', 'c', 15);
INSERT INTO graph VALUES ('c', 'a', 15);
INSERT INTO graph VALUES ('a', 'd', 20);
INSERT INTO graph VALUES ('d', 'a', 20);
INSERT INTO graph VALUES ('b', 'c', 35);
INSERT INTO graph VALUES ('c', 'b', 35);
INSERT INTO graph VALUES ('b', 'd', 25);
INSERT INTO graph VALUES ('d', 'b', 25);
INSERT INTO graph VALUES ('c', 'd', 30);
INSERT INTO graph VALUES ('d', 'c', 30);

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
)
SELECT 
    total AS total_cost,
    '{' || array_to_string(path, ',') || '}' AS tour
FROM tours
WHERE 
    cities_visited = 4 
    AND next = start
    AND total = (SELECT MIN(total) FROM tours WHERE cities_visited = 4 AND next = start)
ORDER BY total_cost, tour;
