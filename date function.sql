select * from employee;

select ucase(ename) name,sal
from employee;
select ename, concat("rs.",sal)
from employee;

select ename,concat("rs",format (sal,0))
from employee;

select ename,left(jo_desc,3)
from employee;

select emp_id,ename,sal,right(jo_desc,4)
from employee;


alter table employee add column hire_date date;

select *
 from employee;
 
 update employee
 set hire_date="2022-07-8";
 
 update employee
 set hire_date="2021-07-14"
 where jo_desc="ananlyst";
 
select now();

select date(now());

select curdate();

select date_format(curdate(),"%d/%m/%y") date;

select datediff(curdate(),"02/03/23")as days;

select datediff(current_date(),"2022-09-9")as days;

select date_add(curdate(),interval 7 month);



