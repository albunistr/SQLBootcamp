SELECT price.pizzeria_name
FROM (SELECT *
      FROM person
      INNER JOIN person_visits
      ON person.id = person_visits.person_id
      WHERE person.name = 'Dmitriy' AND person_visits.visit_date = '2022-01-08'
     )AS visit

INNER JOIN(SELECT pizzeria.id AS id_pizzeria, pizzeria.name AS pizzeria_name
           FROM pizzeria
           INNER JOIN menu
           ON pizzeria.id = menu.pizzeria_id
           WHERE menu.price < 800
          ) AS price

ON visit.pizzeria_id = price.id_pizzeria