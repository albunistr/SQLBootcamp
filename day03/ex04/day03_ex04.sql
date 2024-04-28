select pizzeria.name as pizzeria_name
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
         join person_order on menu.id = person_order.menu_id
         join person on person_order.person_id = person.id
where person.gender = 'female'
EXCEPT
select pizzeria.name as pizzeria_name
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
         join person_order on menu.id = person_order.menu_id
         join person on person_order.person_id = person.id
where person.gender = 'male'
order by pizzeria_name;select pizzeria.name as pizzeria_name
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
         join person_order on menu.id = person_order.menu_id
         join person on person_order.person_id = person.id
where person.gender = 'female'
EXCEPT
select pizzeria.name as pizzeria_name
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
         join person_order on menu.id = person_order.menu_id
         join person on person_order.person_id = person.id
where person.gender = 'male'
order by pizzeria_name;