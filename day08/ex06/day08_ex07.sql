-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
SELECT SUM(rating) FROM pizzeria;