create table person_audit
(
    created    timestamp with time zone default current_timestamp not null,
    type_event char(1)                  default 'I'               not null check (type_event in ('U', 'D', 'I')),
    row_id     bigint                                             not null,
    name       varchar(100),
    age        int,
    gender     varchar(10),
    address    varchar(100)
);

alter table person_audit
    add constraint ch_type_event check (type_event in ('U', 'D', 'I'));

create or replace function fnc_trg_person_insert_audit()
    returns trigger as
$$
begin
    insert into person_audit (created, type_event, row_id, name, age, gender, address)
    values (current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
    return new;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
    after insert
    on person
    for each row
execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');
