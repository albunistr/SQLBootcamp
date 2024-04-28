--session 1
start transaction;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';

--session 2
select * from pizzeria where name = 'Pizza Hut';

--session 1
commit;

--session 2
select * from pizzeria where name = 'Pizza Hut';