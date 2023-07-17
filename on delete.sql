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
references branch(branch_id)ON delete set null);


--- on delete cascade

create table employee(
emp_id int primary key,
ename varchar(30),
job_desc varchar(20),
saLary int,
branch_id int,
constraint fc_branchid foreign key(branch_id) 
references branch(branch_id)ON delete cascade);

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


delete FROM BRANCH
Where branch_id=2;
