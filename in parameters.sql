USE ATGPVT;
select count(emp_id) from employee;



Delimiter $$
create procedure employeecot(
In jdesc varchar(10)
)
begin
Declare total int default 0;
select count(emp_id)
into total 
from employee
where job_desc=jdesc;
select total;
end$$
delimiter ;

call employeecot('admin');
call employeecot('ceo');






