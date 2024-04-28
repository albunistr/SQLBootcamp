insert into person_visits (id, person_id, pizzeria_id, visit_date)
values ((select max(id) + 1 from person_visits),
        (select id from person where name = 'Dmitriy'),
        3,
        '2022-01-08');

insert into person_order (id, person_id, menu_id, order_date)
values((select max(id) + 1 from person_order),
       (select id from person where name = 'Dmitriy'),
       (select id from menu where price < 800 limit 1),
       '2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;

select *
from mv_dmitriy_visits_and_eats