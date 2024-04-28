select COALESCE(P.name, '-') AS person_name, P.visit_date,COALESCE(pizzeria.name, '-') AS pizzeria_name
from(select person.name, pizzeria_id, visit_date
     from person
     left join (select visit_date, pizzeria_id, person_id
                from person_visits
                where visit_date between '2022-01-01'and '2022-01-03') as visit
     on person.id = visit.person_id) as p
FULL join pizzeria
on pizzeria.id = P.pizzeria_id
ORDER BY person_name, P.visit_date, pizzeria_name