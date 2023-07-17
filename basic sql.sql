use atgpvt;

create table employee(
emp_id int primary key,
ename varchar(30),
jo_desc varchar(20),
sal int
);

select * from employee;

insert into employee values(1,"ram","admin",1000000);
insert into employee value(2,"anand","managaer",23000000);
insert into employee value(3,"anad","sales",13000000);
insert into employee value(4,"aarthi","sales",90000000);
insert into employee value(5,"atg","managaer",2300000);
insert into employee value(6,"sam","managaer",200000);

select * from employee
where ename="ram";

select * from employee
where ename<>"ram";

select * from employee
where ename>"ram";

select * from employee
where ename<"ram";

select * from employee 
where jo_desc = "sales" or jo_desc="managaer";

select * from employee
where sal>= 1000000 and jo_desc="sales";

select * from employee
where jo_desc in(" sales", "managaer");

select * from employee
limit 5;

select * from employee
where ename like "a%";

select * from employee
where ename like"%%%a%";

update employee
set jo_desc= "ananlyst"
where jo_desc="sales";


select distinct jo_desc
from employee;

select * FROM EMPLOYEE
ORDER BY ename;

select * from employee
order by sal;

select * from employee
order by sal desc;

select * from employee
order by emp_id;


select * from employee
order by sal,ename;

select * from employee
where jo_desc ="ananlyst"
order by sal;


select * from employee
order by ( case jo_desc
when "sales" then 1
when "ananlyst" then 2
else 100 end
);