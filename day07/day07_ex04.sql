SELECT p.name, COUNT(person_id) AS visits_count
FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(person_id) > 3;