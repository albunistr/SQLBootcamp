create view v_symmetric_union as
(select *
from person_visits
where visit_date < '2022-01-02'
except
select *
from person_visits
where visit_date < '2022-01-06')
union
(select *
from person_visits
where visit_date < '2022-01-06'
except
select *
from person_visits
where visit_date < '2022-01-02')
order by person_id