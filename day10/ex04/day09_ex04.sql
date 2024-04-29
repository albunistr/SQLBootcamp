create
    or replace function fnc_persons_female()
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
where gender = 'female';
$$
    language sql;

create or replace function fnc_persons_male()
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
where gender = 'male';
$$
    language sql;


SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();

