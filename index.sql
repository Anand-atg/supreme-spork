USE ATGPVT;	

DROP table employee;

CREATE table BRANCH(
BRANCH_ID int PRIMARY KEY auto_increment,
BR_NAME varchar(30) NOT NULL,
ADDR varchar(200)
);

create table employee(
emp_id int primary key,
ename varchar(30),
job_desc varchar(20),
saLary int,
branch_id int,
constraint fc_branchid foreign key(branch_id) references branch(branch_id));

-- drop foregn key
alter table employee
drop foreign key fc_branchid;

select * from employee;

show index from employee;

drop table employee;

create table employee(
emp_id int primary key auto_increment,
ename varchar(30) not null,
jo_desc varchar(20) default "UNASSIGNED",
salary int,
PAN varchar(16) unique,
CHECK (Salary>10000)
);


-- add index to table
create index  name_index on employee(ename);

alter table employee
drop index name_index;

alter table employee
add index (ename);
