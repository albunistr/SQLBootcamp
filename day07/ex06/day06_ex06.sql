create sequence seq_person_discounts start with 1;
alter table person_discounts
    alter column id set default nextval('seq_person_discounts') - 1;
select SETVAL('seq_person_discounts', (select count(id) + 1 from person_discounts));