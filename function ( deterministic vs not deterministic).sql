use atgpvt;

select * from employee;
select * from branch;

select ename,getbranchAddr(branch_id)
from employee;


delimiter $$
create function getbranchaddr(id int)
returns  varchar(70)
deterministic
begin
declare fulladdr varchar(50);
Select Concat(addr,' ',br_name) into Fulladdr
from branch
where branch_id=id;
return fulladdr;
end$$
delimiter ;


drop function if exists getbranchaddr;
show function status;
