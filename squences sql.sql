use atgpvt;

select * from employee;
select * from branch;


drop table employee;
drop table branch;

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

select * from employee
where branch_id=(select branch_id from branch
where br_name="chennai");

---- employee with min salary 
	
select * FROM EMPLOYEE
where SALARY=(select MIN(SALARY) FROM EMPLOYEE);


--- EMP SALARY WITH MAX SALARY 

select * from employee
where salary =(select max(salary) from employee);

----- EXIST WITH SUBQUERY
---- BRANCHES CONTAINING ATLEAST ONE ADMIN
select BRANCH_ID,BR_NAME
FROM BRANCH
WHERE EXISTS
(SELECT *  from EMPLOYEE
WHERE JOB_DESC ="ADMIN" AND BRANCH.BRANCH_ID=EMPLOYEE.BRANCH_ID);


-- displays the branch info in which any employee gets more than 25L

SELECT branch_id,br_name
FROM branch
WHERE branch_id = ANY
(SELECT branch_id FROM employee
WHERE salary>2500000);

select * From employee
where emp_id =any(
select  emp_id from employee
where salary>2500000);

SELECT branch_id,br_name
FROM branch
WHERE EXISTS 
( SELECT * FROM employee
WHERE job_desc="ADMIN" AND branch.branch_id = employee.branch_id);



--- employee not work in chennai or coimbature
select * from employee
where branch_id<> any(
select branch_id from branch 
where br_name in ("chennai","coimabtore") );