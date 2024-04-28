UPDATE menu
set price=price * 0.9
where id = (select id from menu where pizza_name = 'Greek pizza');