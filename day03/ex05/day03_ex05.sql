select pizzeria.name as pizzeria_name
from pizzeria
         join menu on menu.pizzeria_id = pizzeria.id
         join person_visits on person_visits.pizzeria_id = menu.pizzeria_id
         join person on person.id = person_visits.person_id
where person.name = 'Andrey'
EXCEPT
select pizzeria.name as pizzeria_name
from pizzeria
         join menu on menu.pizzeria_id = pizzeria.id
         join person_order on menu.id = person_order.menu_id
         join person on person.id = person_order.person_id
where person.name = 'Andrey'