SELECT 
    COALESCE(p.name,'-') as person_name, 
    visit.visit_date as visit_date, 
    COALESCE(pz.name,'-') as pizzeria_name 
FROM 
    (SELECT * from person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') as visit
FULL JOIN person p ON visit.person_id = p.id 
FULL JOIN pizzeria pz ON visit.pizzeria_id = pz.id
ORDER BY person_name, visit_date, pizzeria_name