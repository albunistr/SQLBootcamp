SELECT pizza_name, name AS pizzeria_name, price
FROM pizzeria
INNER JOIN menu
ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, name
