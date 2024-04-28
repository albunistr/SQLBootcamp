select person.name, menu.pizza_name, menu.price, menu.price / 100 * (100 - person_discounts.discount) as diccount_price, pizzeria.name as pizzeria_name
from person_order
join menu on person_order.menu_id = menu.id
join person_discounts on person_order.person_id = person_discounts.person_id
join person on person_discounts.person_id = person.id
join pizzeria on menu.pizzeria_id = pizzeria.id
order by 1, 2
