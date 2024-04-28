SELECT missing_date::DATE
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS visit
ON missing_date = visit.visit_date
WHERE visit is NULL
ORDER BY missing_date::date