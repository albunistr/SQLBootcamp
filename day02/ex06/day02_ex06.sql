SELECT menu.pizza_name AS pizza_name, menu.name AS pizzeria_name
FROM
    (SELECT *
      FROM person
      INNER JOIN person_order
      ON person.id = person_order.person_id)
    AS person
INNER JOIN
    (SELECT menu.pizza_name, pizzeria.name, menu.id AS id_menu
    FROM menu
    INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id) AS menu
ON person.menu_id = menu.id_menu
WHERE person.name = 'Denis' OR person.name = 'Anna'

ORDER BY pizza_name, pizzeria_name