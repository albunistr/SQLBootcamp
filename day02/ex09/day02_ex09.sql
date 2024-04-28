SELECT DISTINCT person.name
FROM (SELECT person.name, person.id AS id_female
      FROM person
      WHERE person.gender = 'female'
     ) AS person

INNER JOIN (SELECT cheese.pizza_name, pepperoni.person_id
            FROM (SELECT menu.pizza_name, person_order.person_id
                  FROM menu
                  INNER JOIN person_order
                  ON menu.pizza_name = 'cheese pizza' AND person_order.menu_id = menu.id
                 )AS cheese
            INNER JOIN (SELECT menu.pizza_name, person_order.person_id
                        FROM menu
                        INNER JOIN person_order
                        ON menu.pizza_name = 'pepperoni pizza' AND person_order.menu_id = menu.id
                       )AS pepperoni
            ON cheese.person_id = pepperoni.person_id
           )AS pepperoni
ON person.id_female = pepperoni.person_id
ORDER BY person.name
