select dates::date as missing_date
from v_generated_dates
except
select person_visits.visit_date as missing_date
from person_visits
order by 1;