-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
SELECT SUM(rating) FROM pizzeria;