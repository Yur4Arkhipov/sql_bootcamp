-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- сессия 1
UPDATE pizzeria SET rating = 2.2 WHERE id = 1;
-- сессия 2
UPDATE pizzeria SET rating = 4.4 WHERE id = 2;
-- сессия 1
UPDATE pizzeria SET rating = 2.3 WHERE id = 2;
-- сессия 2
UPDATE pizzeria SET rating = 4.5 WHERE id = 1;
-- сессия 1
COMMIT;
-- сессия 2
COMMIT;
-- сессия 1
SELECT * FROM pizzeria;
-- сессия 2
SELECT * FROM pizzeria;