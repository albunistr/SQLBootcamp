select name, sum(count) as total_count
    from(select pizzeria.name, count_of_visits as count, action_type
from ((select pizzeria_id, count(pizzeria_id) as count_of_visits, format('visit') as action_type
       from person_visits
       group by pizzeria_id)
      union
      (select menu.pizzeria_id, count(menu.pizzeria_id) as count_of_visits, format('order') as action_type
       from person_order
                join menu on person_order.menu_id = menu.id
       group by menu.pizzeria_id)) as pt
         join pizzeria on pizzeria.id = pt.pizzeria_id) as pt
group by name
order by total_count desc, name;