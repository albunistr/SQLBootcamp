select pizzeria.name, average_price, max_price, min_price
from (select menu.pizzeria_id, round(avg(price), 2) as average_price, max(menu.price) as max_price, min(menu.price) as min_price
from person_order
join menu on person_order.menu_id = menu.id
group by menu.pizzeria_id) as p
join pizzeria on pizzeria.id = p.pizzeria_id
order by 1;