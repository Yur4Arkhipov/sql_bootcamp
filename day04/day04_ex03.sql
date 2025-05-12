SELECT v.generated_date AS missing_date
FROM v_generated_dates v
LEFT JOIN 
    (SELECT DISTINCT visit_date FROM person_visits) pv
    ON v.generated_date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;