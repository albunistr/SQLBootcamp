select pizza_name, price, pizzeria.name as pizzeria_name
from menu
         join pizzeria on menu.pizzeria_id = pizzeria.id
         left join person_order on menu.id = person_order.menu_id
where order_date is NULL
order by pizza_name, price, pizzeria_name