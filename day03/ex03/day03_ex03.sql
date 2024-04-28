(select pizzeria.name as pizzeria_name
from pizzeria
         join person_visits on pizzeria.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where person.gender = 'female'
EXCEPT all
select pizzeria.name as pizzeria_name
from pizzeria
         join person_visits on pizzeria.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where person.gender = 'male')
UNION all
(select pizzeria.name as pizzeria_name
from pizzeria
         join person_visits on pizzeria.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where person.gender = 'male'
EXCEPT all
select pizzeria.name as pizzeria_name
from pizzeria
         join person_visits on pizzeria.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where person.gender = 'female'
)
order by pizzeria_name;