select person.name, count_of_visits
from (select person_id, count(person_id) as count_of_visits
from person_visits
group by person_id
having(count(person_id) > 3)) as p
join person on person.id = p.person_id;