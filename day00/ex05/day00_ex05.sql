SELECT name AS NAME
FROM person
WHERE id in (
    SELECT person_id
    FROM person_order
    WHERE menu_id IN (13, 14, 18) AND order_date = '2022-01-07'
    );

