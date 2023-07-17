USE ATGPVT;
select count(emp_id) from employee;



Delimiter $$
create procedure employeecot(
In jdesc varchar(10),
out total int 
)
begin
select count(emp_id)
into total 
from employee
where job_desc=jdesc;
end$$
delimiter ;


Delimiter **
create procedure Incrcounter(
inout counter int,
in incr int
)
begin
set counter = counter + incr;
end **
delimiter ;



set @counter=5;
call incrcounter(@counter,2);
select @counter;







