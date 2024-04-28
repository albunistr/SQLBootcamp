select person.name, count_of_visits
    from (select person_id, count(person_id) as count_of_visits
from person_visits
join person on person_visits.person_id = person.id
group by person_id) as counts
join person on counts.person_id = person.id
order by count_of_visits desc,  name
limit 4;