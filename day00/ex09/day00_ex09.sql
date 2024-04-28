SELECT name AS person_name
FROM person
WHERE id in (
    SELECT person_id
    FROM person_visits
    GROUP BY person_id
    HAVING (visit_date >= '2022-01-06' AND visit_date <= '2022-01-09') AND COUNT(visit_date) >= 4
    );

SELECT name AS pizzeria_name
FROM pizzeria
WHERE id in (
    SELECT person_id
    FROM person_visits
    GROUP BY person_id
    HAVING (visit_date >= '2022-01-06' AND visit_date <= '2022-01-09') AND COUNT(visit_date) >= 4
    );

