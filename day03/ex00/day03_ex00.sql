select pizza_name, price, pizzeria.name as pizzeria_name, visit_date
from menu
         join pizzeria on menu.pizzeria_id = pizzeria.id
         join person_visits on person_visits.pizzeria_id = menu.pizzeria_id
         join person on person.id = person_visits.person_id
where (price BETWEEN 800 and 1000)
  and (person.name = 'Kate')
order by pizza_name, price, pizzeria_name;