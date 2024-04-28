SELECT person_id
FROM person_visits
GROUP BY person_id
HAVING COUNT(visit_date) >= 4 AND visit_date >= '2022-01-06' AND visit_date <= '2022-01-09' OR pizzeria_id == 2