-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';