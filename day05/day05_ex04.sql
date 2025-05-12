CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

DROP INDEX IF EXISTS idx_menu_unique;

SET enable_seqscan TO off;
EXPLAIN ANALYZE
SELECT * FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';