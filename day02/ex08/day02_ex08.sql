SELECT DISTINCT person.name
FROM (SELECT person.name, person.address, person.id AS id_male
      FROM person
      WHERE person.gender = 'male' AND (person.address = 'Moscow' OR person.address = 'Samara')
     )AS person

INNER JOIN (SELECT person_order.person_id AS person_male_id, menu.pizza_name
            FROM person_order
            INNER JOIN menu
            ON menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza'
           )AS pizza

ON person.id_male = pizza.person_male_id

ORDER BY person.name DESC