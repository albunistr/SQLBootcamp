with p (visit)
AS(select visit_date from person_visits where person_id = 1 or person_id = 2)
select missing_date::DATE
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
left join p
on missing_date = visit
where visit is NULL
order by missing_date::date