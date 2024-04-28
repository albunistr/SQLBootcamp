select pizzeria.name, count_of_visits as count, action_type
from ((select pizzeria_id, count(pizzeria_id) as count_of_visits, format('visit') as action_type
       from person_visits
       group by pizzeria_id
       order by count_of_visits desc
       limit 3)
      union
      (select menu.pizzeria_id, count(menu.pizzeria_id) as count_of_visits, format('order') as action_type
       from person_order
                join menu on person_order.menu_id = menu.id
       group by menu.pizzeria_id
       order by count_of_visits desc
       limit 3)) as pt
         join pizzeria on pizzeria.id = pt.pizzeria_id
order by action_type, count desc;