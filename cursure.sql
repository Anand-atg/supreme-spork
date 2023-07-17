-- cursors

use atgpvt;
select * from employee;

create table employee_backup(
emp_id int primary key,
ename varchar(30),
job_desc varchar(20),
salary int,
branch_id int,
constraint fk_branchid_backup foreign key (branch_id) references branch(branch_id));

delimiter $$
create  procedure backupemployee()
begin
declare done int default 0;
declare id,salary,brid int;
declare ename,jdesc varchar (30);
	 declare cur cursor for select  * from employee;
     declare exit handler for not found set done=1;
     delete from employee_backup;
        open cur;
        label:loop
        if done =1 then 
        leave label;
        end if;
		fetch cur into id,ename,jdesc,salary,brid;
        insert into employee_backup
        values(id,ename,jdesc,salary,brid);
        end loop;
        close cur;
end$$
delimiter ;

CALL backupemployee;
select * from employee_backup;