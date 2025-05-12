WITH date_range AS (
    SELECT generate_series('2022-01-01', '2022-01-10', '1 day'::interval)::date AS visit_date
),
visited_dates AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
)
SELECT dr.visit_date AS missing_date
FROM date_range dr
LEFT JOIN visited_dates vd ON dr.visit_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY missing_date ASC