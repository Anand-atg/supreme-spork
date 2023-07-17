use  mydb;

--- function

select count(amount) 
from transcations;


select sum(amount) as sum 	
from transcations;

select concat(first_name," ",last_name) as full_name
from employees;


--- logical operators
 
alter table employees
add column job varchar (50);

alter table employees
modify job  varchar(50) after hourly_pay;


update employees 
set job = "cook "
where employee_id = 6;

---- and  , or, not operator

select * FROM EMPLOYEES
where not employee_id = 3;

select * from employees
where job between "cook" and "casher";
select * from employees;

---- wild card characters %_
--- used to substitute one or more characters in a string %_

-- find chr start 
select * from employees
where first_name like "s%";

--- end char
select * from employees
where hire_date  like "%5";

select * from employees
where job like "_ook";

--- order by clause

select * from employees
order by first_name desc;

select * from transcations
order by amount,customer_id;


----- limit clause  is used to limit the number of records 
--- useful if youre working with a lot of date
--- can be used to display a large on page (pagination)

select * from customers
order by last_name desc 
limit 1;

select * from customers
limit 2;

---- union operators the resullt of two or more select statments(they need same number of column )

select first_name,last_name from employees
union all
select first_name,last_name from customers;

---- self join
--- join another copy of a table to itself
--- used to compare rows of the same table 
-- helps to display a heirarchy of data 

alter table customers
rename column referral_is to referral_id;

update customers 
set referral_id = 2
where customer_id =3;
select * from customers;

select a.customer_id,a.first_name,a.last_name ,concat(b.first_name," ",b.last_name) as "referred_by"
from customers as a
inner join customers as b
ON  A.referral_id = B.customer_id;


-----  views
---- a virtual table based on the result -set of an sql statment
---- the feilds in a views are fields from one or more real tables in the statement
--- they not real tables ,but can be interacted with as if they were 


select * from employees;


create view employee_attendance AS 
Select first_name,last_name
from employees;

select * from employee_attendance;

drop view employee_attendance;

alter table customers
add column email varchar(50);

update customers 
set email = "crab@gmail.com"
where customer_id = 3;
select * from customers;

create view customers_record AS
select concat(first_name," ",last_name) as full_Name,email
from customers;


drop view customers_record;

insert into customers
values(4,"peral","kerbs",null,"krsi@gmaol.com");
select * from customers_record;

-------- index  (btree data structure)
------ indexs are used to find values within a specific column more quickely 
------ Mysql normally searches sequentially through a column
------ the longer the column ,the more exoensive the operation is 
----- update tasks more time ,select takes less time 


create index last_name_idx
on customers(last_name);

create index last_name_first_name_idx
on customers (last_name,first_name);
show indexes from customers;

alter table customers 
drop index last_name_idx;

select * from customers
where last_name = "crab";

---- subquery
---- query (subquery)
---- a query within another query 

select concat(first_name," ",last_name) as name,
(select avg(hourly_pay) from employees) as "pay" 
from employees;


select first_name ,last_name,email
from customers
where customer_id in
(select distinct customer_id 
from transcations
where customer_id is not null );


select first_name ,last_name,email
from customers
where customer_id not in
(1,2);



---- group by functions =aggergate all rows by a specific column
----  often used with aggregate functiio ex sum(),max(),avg(),count();
                            
select sum(amount),avg(amount),max(amount),min(amount)
from transcations
group by customer_id;

select count(amount),customer_id from transcations
group by customer_id
having count(amount) > 1 and customer_id is not null;

---- rollup,extension of the group by clause
---- produces another row and shows the grand total (super+aggregate value)

select count(amount) as "no of orders",customer_id
from transcations
group by customer_id with rollup;


select sum(hourly_pay) as "hourly pay",employee_id
 from employees
 group by employee_id with rollup;
 
 
 
 
 ---- on delete set null = when a fk is deleted, replace fk with null
 ----- on delete cascade = when a fk is deleted ,delete row;
 
 set foregin_key_check = 0;
 
 delete from customers
 where customer_id = 3;
 select * from customers;

alter table transcations
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id)
on delete set null;

alter table transcations
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id)
on delete cascade;


---- storeprocedure = is prepared sql code that you can save great if there a query that you write often
					-- increase performance
                    -- secure admin can grant permission to use
                    --- increase memory usage of every connection
delimiter $$
create procedure get_customer()
Begin
select * from customers;
end $$
delimiter ;

call get_customer();

delimiter $$
create procedure find_customer(in id int)
begin
	select * from customers
    where customer_id = id;
end $$
delimiter ;

call find_customer(2);


drop procedure find_customer;




delimiter $$
create procedure find_customer(in f_name varchar(50),in l_name varchar(50))
begin
select* from customers
where first_name= f_name and last_name = l_name;
end $$
delimiter ;

call find_customer("jason","lobster");




---- trigger = when an event happens,do something
----- ex.(insert.update,delete)
----- checks date,handles errors,audting tables.


alter table employees
add column salary decimal(10,2) after hourly_pay;

select * from employees;


update employees
set salary = hourly_pay*2080;

----- add trigger before update

create trigger before_hr_pay_update
before update on employees 
for each row
set new.salary = (new.hourly_pay* 2080);

show triggers;
select * from employees;

update employees
set hourly_pay = 50 
where employee_id = 1;


update employees
set hourly_pay = hourly_pay +2;


delete from employees
where employee_id = 7;

----- add trigger before insert records

create trigger before_hourly_pay_insert
before insert on employees
for each row 
set new.salary = (new.hourly_pay *2080);

insert into employees
values(7,"sheldon","plankton",10,null,"janitor","2023-01-07");

select * from employees;



create table expenses(
		expense_id int primary key,
        expense_name varchar(50),
        expense_total decimal (10,2)
);



insert into expenses
 values(1,"salaries",0),
		(2,"supplies",0),
        (3,"taxes",0);

delete from expenses
where expense_id = 3;


update expenses
set expense_total = (select sum(salary)from employees)
where expense_name = "salaries";
 

 create trigger after_salary_delete
 after delete on employees
 for each row
 update expenses
 set expense_total = expense_total - old.salary
 where expense_name= "salaries";
 
 delete from employees
 where employee_id = 1;
 select * from expenses;
 
 
 create trigger after_salary_insert
 after insert on employees
 for each row
 update expenses
 set expense_total = expense_total + new.salary
 where expense_name = "salaries";
 
 drop trigger after_salary_insert;
 
insert into employees
value(1,"sheld","plankton",10,null,"janitor","2023-01-07");

create trigger after_salary_update
after update on employees
for each row
update expenses
set expense_total = expense_total+(new.salary - old.salary)
where expense_name = "salaries";


update employees 
set hourly_pay = 250
where first_name = "karthik";

select * from expenses;


---- advance sql


create table employee(
			emp_id int primary key auto_increment,
			emp_name varchar (50),
            dept_name varchar(50),
            salary decimal (10,2)
            );

insert into employee values(1,"ram","admin",10000);
insert into employee value(2,"anand","managaer",23000);
insert into employee value(3,"anad","sales",13000);
insert into employee value(4,"aarthi","sales",90000);
insert into employee value(5,"atg","managaer",23000);
insert into employee value(6,"sam","managaer",2000);


select * from employee;

select dept_name,max(salary) as max_salary
from employee
group by dept_name;

--- window functions  or analystical 

select e.*,
 max(salary) over (partition by dept_name) as max_salary
from employee e;


---- row() number , rank,dense_rank,lead,lag function
select e.*,
row_number() over(partition by dept_name) as RN
from employee e;


--- Fetch the first 1 employee from each department to join the company 

select * from (
	select e.*,
	row_number() over (partition by dept_name order by emp_id) as RN 
	from employee e ) x
where x.RN <2;


--- RANK 
-- FETCH THE TOP 3 EMPLOYEE IN EACH DEPARTMENT EARNING THE MAX SALARY 


select * from (
	select e.*,
	rank() over(partition by dept_name order by salary desc) as Rk 
	from employee e) x
where x.rk < 2;


--- Dense rank

	select e.*,
	rank() over(partition by dept_name order by salary desc) as Rnk, 
    dense_rank () over(partition by dept_name order by salary desc) as Dese_Rk,
   row_number() over(partition by dept_name order by salary desc) as row_Rk 
	from employee e;


--- fetch a query to display if the salary of an employeee is higher ,lower or equal to te previous employee
-- lead() ,lag() window function 

select e.*,
lag(salary) over (partition by dept_name order by emp_id) as pre_emp_salary,
lead(salary) over (partition by dept_name order by emp_id) as next_emp_salary
from employee e;

-- fetch higher or lower salary 

select e.*,
lag(salary) over (partition by dept_name order by emp_id) as pre_emp_salary,
case when e.salary > lag(salary) over (partition by dept_name order by emp_id) then " higher the pre emp "
	 when e.salary < lag(salary) over (partition by dept_name order by emp_id) then " lower the pre emp "
	 when e.salary = lag(salary) over (partition by dept_name order by emp_id) then " same as the pre emp "
end sal_rang
from employee e;