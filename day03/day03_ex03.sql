WITH gender_visits AS (
    SELECT 
        pz.name AS pizzeria_name,
        p.gender,
        COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name, p.gender
),
gender_comparison AS (
    SELECT 
        f.pizzeria_name,
        CASE 
            WHEN f.visit_count > COALESCE(m.visit_count, 0) THEN 'female'
            WHEN m.visit_count > COALESCE(f.visit_count, 0) THEN 'male'
        END AS dominant_gender
    FROM 
        (SELECT * FROM gender_visits WHERE gender = 'female') f
    FULL OUTER JOIN 
        (SELECT * FROM gender_visits WHERE gender = 'male') m
    ON f.pizzeria_name = m.pizzeria_name
    WHERE 
        f.visit_count > COALESCE(m.visit_count, 0) OR
        m.visit_count > COALESCE(f.visit_count, 0)
)
SELECT 
    pizzeria_name
FROM gender_comparison
WHERE dominant_gender IS NOT NULL
ORDER BY pizzeria_name;
