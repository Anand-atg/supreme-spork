use atgpvt;

select * from branch;

delimiter $$
create procedure getbranchs()
begin 
select * from branch;
end $$

delimiter ;


call getbranchs;


drop procedure  getbranchs;

-- variables 
select count(emp_id) from employee;
delimiter $$
create procedure EMPLOYEECNT()
begin
	declare total int default 0;
select count(emp_id) 
into total 
from employee;
select TOTAL;
end $$
delimiter ;


CALL EMPLOYEECNT;

--- PASSING PARAMETER IN,OUT AND INOUT;








