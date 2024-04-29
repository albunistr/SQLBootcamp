create or replace function fnc_trg_person_audit()
    returns trigger as
$$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
        return new;
    elsif (tg_op = 'UPDATE') then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
        return old;
    elsif (tg_op = 'DELETE') then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
        return old;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger trg_person_audit
    after insert or update or delete
    on person
    for each row
execute function fnc_trg_person_audit();

drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_delete_audit();
drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_update_audit();

truncate table person_audit;

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');

update person
set name = 'Bulat'
where id = 10;
update person
set name = 'Damir'
where id = 10;

delete
from person
where id = 10;