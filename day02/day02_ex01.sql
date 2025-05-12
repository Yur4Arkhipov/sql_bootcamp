SELECT all_days.visit_date AS missing_date
FROM (
    SELECT generate_series('2022-01-01', '2022-01-10', '1 day'::interval)::date AS visit_date
) AS all_days
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id=1 OR person_id=2
) AS visited_dates ON all_days.visit_date = visited_dates.visit_date
WHERE visited_dates.visit_date IS NULL
ORDER BY missing_date ASC