drop function fnc_persons_female();
drop function fnc_persons_male();

create
    or replace function fnc_persons(pgender varchar default 'female')
    returns table
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
as
$$
select id, name, age, gender, address
from person
where gender = pgender;
$$
    language sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
