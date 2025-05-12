UPDATE menu
SET price = (price / 0.9)::integer  -- 10% discount
WHERE pizza_name = 'cheese pizza';