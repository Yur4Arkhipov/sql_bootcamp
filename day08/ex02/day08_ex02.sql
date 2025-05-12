-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- сессия 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- сессия 1
COMMIT;
-- сессия 2
COMMIT;
-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';