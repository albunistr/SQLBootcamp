select person.address, pizzeria.name, count(count_of_orders)
from (select person_id, count(person_id) as count_of_orders, menu_id
from person_order
group by person_id, menu_id) as p
join person on person.id = p.person_id
join menu on menu.id = p.menu_id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by 1, 2
order by 1, 2;