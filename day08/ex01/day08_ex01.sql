-- сессия 1
SHOW TRANSACTION ISOLATION LEVEL;
-- сессия 2
SHOW TRANSACTION ISOLATION LEVEL;
-- сессия 1
BEGIN;
-- сессия 2
BEGIN;
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