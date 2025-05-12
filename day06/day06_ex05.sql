COMMENT ON TABLE person_discounts IS 'Хранение персональных скидок';
COMMENT ON COLUMN person_discounts.id IS 'Primamry key для всех элементов таблицы';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key связывающий с таблицей person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key связывающий с таблицей pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Величина скидки';

