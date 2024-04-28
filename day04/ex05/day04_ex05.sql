select name, menu.pizza_name, menu.price, (menu.price * 0.9)::INTEGER as discount_price
from person
         join person_order on person.id = person_order.person_id
         join menu on person_order.menu_id = menu.id
order BY name, pizza_name;