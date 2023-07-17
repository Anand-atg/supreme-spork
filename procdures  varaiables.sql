USE ATGPVT;
select count(emp_id) from employee;
Delimiter $$
create procedure employeecot()
begin
Declare total int default 0;
select count(emp_id)
into total 
from employee;
select total;
end$$
delimiter ;

call employeecot();
