INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits), (select id from person where name = 'Denis'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24')

