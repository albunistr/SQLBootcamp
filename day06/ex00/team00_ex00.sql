create table arcs
(
    point1 varchar(1),
    point2 varchar(1),
    cost   int
);

insert into arcs (point1, point2, cost)
values ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30);

WITH RECURSIVE
    tours AS (SELECT point1,
                     point2                                      as next,
                     ARRAY [point1, point2]::character varying[] AS tour,
                     1                                           as level,
                     cost                                        AS total_cost
              FROM arcs

              UNION all

              SELECT tours.point1,
                     tours.next,
                     array_append(tours.tour, arcs.point2),
                     level + 1 as level,
                     tours.total_cost + arcs.cost


              FROM tours
                       JOIN arcs ON arcs.point1 = tours.next
              WHERE level < 4),
    filter as (select *
               from tours
               where tour[1] = 'a'
                 and tour[5] = 'a'
                 and 'b' = any (tour)
                 and 'c' = any (tour)
                 and 'd' = any (tour)
                 and cardinality(tour) = 5)
SELECT total_cost, tour
FROM filter
where total_cost = (select min(total_cost) from filter)
ORDER BY total_cost, tour;