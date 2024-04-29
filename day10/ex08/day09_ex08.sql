create or replace function fnc_fibonacci(pstop integer default 10)
    returns table
            (
                fibonacci_number integer
            )
as
$$
declare
    a    integer := 0;
    b    integer := 1;
    temp integer;
begin
    fibonacci_number := a;
    return next;
    while b < pstop
        loop
            fibonacci_number := b;
            return next;
            temp := a + b;
            a := b;
            b := temp;
        end loop;

end;
$$
    language plpgsql;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
