create or replace function fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-08'
)
    returns table
            (
                name varchar
            )
as
$$
begin
    return query
        select pizz.name as pizzeria_name
        from menu
                 join pizzeria pizz on menu.pizzeria_id = pizz.id
                 join person_visits pv on menu.pizzeria_id = pv.pizzeria_id
                 join person pers on pers.id = pv.person_id
        where price < pprice
          and pers.name = pperson
          and visit_date = pdate;
end ;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
