use atgpvt;
drop table employee;
drop table branch;


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
constraint fc_branchid foreign key(branch_id) 
references branch(branch_id));


INSERT INTO branch VALUES(1,"Chennai","16 ABC Road");
INSERT INTO branch VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO branch VALUES(3,"Mumbai","25 XYZ Road");
INSERT INTO branch VALUES(4,"Hydrabad","32 10th Street");


INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000,2);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000,2);
INSERT INTO employee VALUES(3,'George','SALES',2000000,1);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000,2);
INSERT INTO employee VALUES(5,'Meena','HR',2000000,3);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000,1);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000,1);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000,2);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000,3);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000,3);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000,1);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000,1);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000,2);
INSERT INTO employee VALUES(14,'Vidya','ADMIN',2200000,NULL);
INSERT INTO employee VALUES(15,'Ranjani','ENGINEER',2100000,NULL);



select * from branch;
select * from employee;
---


--- join ,inner join -show extract value only which is match.
-- ,left join --show all data with null included left side
-- right join is show all data with null value included on right side 

select employee.emp_id,employee.ename,employee.job_desc,branch.BR_NAME
from employee
left join branch
on employee.branch_id=branch.BRANCH_ID
order by emp_id;


select e.emp_id,e.ename,e.job_desc,b.BR_NAME
from employee as e
left join branch as b
on e.branch_id=b.BRANCH_ID
order by emp_id;


select employee.emp_id,employee.ename,employee.job_desc,branch.BR_NAME
from employee,branch
where employee.branch_id=branch.BRANCH_ID
order by emp_id;

select employee.emp_id,employee.ename,employee.job_desc,branch.BR_NAME
from employee
cross join branch;
select b.BR_NAME, count(e.emp_id)
from branch as b
join employee as e
on b.BRANCH_ID=e.BRANCH_ID
group by e.emp_id;


SELECT b.br_name,COUNT(e.emp_id)
FROM branch as b
JOIN employee as e
ON b.branch_id = e.branch_id
GROUP BY e.branch_id;


create table clients(
CLIENT_ID INT primary KEY auto_increment,
LOCATION varchar(30) NOT NULL,
Addr varchar(220)  );

INSERT INTO clients VALUES(1,"NewYork","25 10th Block");
INSERT INTO clients VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO clients VALUES(3,"London","21 ABC Road");

select * from branch ;
select * from clients;

select * from branch
union 
select * from clients;

select * from branch
union all
select * from clients;