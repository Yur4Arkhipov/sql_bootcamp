-- сессия 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 1
COMMIT;

-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';