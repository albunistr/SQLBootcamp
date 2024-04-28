create materialized view mv_dmitriy_visits_and_eats AS
select distinct name
from pizzeria
         join menu on pizzeria.id = menu.pizzeria_id
         join person_visits on person_visits.pizzeria_id = pizzeria.id
         join person_order on person_order.person_id = person_visits.person_id
where person_visits.person_id = (select id from person where name = 'Dmitriy')
  and person_visits.visit_date = '2022-01-08'
  and menu.price < 800
