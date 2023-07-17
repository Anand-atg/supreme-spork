use atgpvt;

drop table employee;


create table employee(
emp_id int primary key auto_increment,
ename varchar(30) not null,
jo_desc varchar(20) default "UNASSIGNED",
salary int,
PAN varchar(16) unique,
CHECK (Salary>10000)
);


alter table employee
modify ENAME varchar(30);


-- ADD DEFAULT CONSTRAINT

ALTER	table employee
ALTER JO_DESC drop default;

ALTER	table employee
ALTER JO_DESC set default " UNASSIGNED";
-- ADDD CHECK CONSTRAINT 

ALTER table employee
ADD constraint CHK_SALARY check(SALARY>1000000);

-- DROP CHECK CONSTRAINT
ALTER table employee
DROP CHECK CHK_SALARY;


select * from employee;


insert into employee(ename, salary)values("ANAND",8900000);

insert into employee values(1,"ram","admin",1000000);
insert into employee value(2,"anand","managaer",23000000);
insert into employee value(3,"anad","sales",13000000);
insert into employee value(4,"aarthi","sales",90000000);
insert into employee value(5,"atg","managaer",2300000);
insert into employee value(6,"sam","managaer",200000);
