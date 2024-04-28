select id as menu_id
from menu
EXCEPT
select menu_id
from person_order
order by menu_id