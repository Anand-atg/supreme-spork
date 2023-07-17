CREATE DATABASE myDB;
USE myDB;
alter database mydb read only =0;
DROP database mydb;



-- create table 

CREATE TABLE employee (
		employee_id INT,
        first_name VARCHAR(50),
        last_name varchar(50),
        hire_date  DATE,
        hourly_pay DECIMAL(5,2)
        );
        
SELECT * FROM EMPLOYEEs;

RENAME TABLE workers to Employees;

-- Alter table ,Modify,rename

ALTER TABLE employees	
		ADD phone varchar(50);
Alter table employees 
 rename column phone to email;
 
ALTER TABLE employees
	MODIFY COLUMN EMAIL varchar(100);
    
    
Alter table employees 
	MODIFY EMAIL VARCHAR(100) 
    AFTER last_name;
    
ALTER TABLE employees
	MODIFY hourly_pay decimal(5,2)
    after email;


alter table employees
	drop column email,
    add column Profile_link varchar(50);
    
Alter table employees
	drop Column profile_link;
    
select * from employees;



-- Insert  rows 

INSERT INTO employees
VALUEs
		(2,"M","ANAND", 45.50,"2023-03-03"),
        (3,"Karthik"," Sri", 15.50,"2023-01-12"),
        (4,"Star","Prathik", 30.50,"2023-02-5"),
		(5,"Eug","abs", 50.00,"2023-01-18");
        
INSERT INTO employees(employee_id,first_name,last_name)
		VALUES(6,"john","werk");
        
--- select data 
        
select * from employees;

select * from employees;


-- where Clause 

Select * from employees
where first_name ="M";

--- greater than 

Select * from employees
where hourly_pay >= 25.00;

select * from employees
where hire_date <= "2023-04-30";

--- not comparsion operater

select * from employees
where employee_id != 1;

select * from employees
where hire_date is null;

-- update and delete 

update employees 
set hourly_pay = 100.25,
	hire_date = "2023-05-01"
where employee_id = 6;


update employees 
set hourly_pay = null,
	hire_date = null
where employee_id = 6;


update employees 
set hourly_pay = 150.00;


-- delete rows

delete from employees
where employee_id = 6;



--- AUTOCOMMIT (Default automatic save ),COMMIT ( commit any canges manually ),ROLLBACK (undo)

set	autocommit = off;

commit;

delete from employees;

rollback;

-- UNIQUE CONSTRAINST

CREATE TABLE PRODUCT(
			Product_id INT,
            product_name VARCHAR(25) unique,
            Price Decimal ( 4,2)
);

--- alter unique constraint

alter table product 
add constraint
unique (product_name);


INSERT INTO PRODUCT 
VALUES  (100,"ambuger",3.99),
	    (101,"fries",1.89),
        (102,"soda",2.00),
        (103,"ice cream",1.49);
select * from product;


--- not null comstraint

create table product(
			product_id int,
            product_name varchar(250),
            price decimal (4,2) not null
);


alter table product
modify price decimal (4,2) NOT NULL;

INSERT INTO PRODUCT 
VALUES(104,"kCOOKIE",0);
SELECT * FROM PRODUCT;

--- CHECK COMSTRAINT 
-- to add check 

CREATE TABLE employee (
		employee_id INT,
        first_name VARCHAR(50),
        last_name varchar(50),
        hire_date  DATE,
        hourly_pay DECIMAL(5,2),
        CONSTRAINT chk_horly_pay check (hourly_pay >=10.00));

Alter table employees
add constraint chk_hourly_pay check(hourly_pay >= 10.00);
select * from employees;

insert into employees
values(6,"shred","halland",13.00,"2023-01-24");
select * from employees;


alter table employees
drop check chk_hourly_pay;

---- default 

CREATE TABLE PRODUCT(
			Product_id INT,
            product_name VARCHAR(25) unique,
            Price Decimal ( 4,2) Default 0
);

alter table product
alter price set default 0;

insert into product(product_id,product_name)
values		( 107,"traw"),
			(108,"npkin"),
            (109,"frk");
            
Delete from product 
where product_id > 4;
select * from product;


--- PRIMARY KEY  (unique identify)

CREATE TABLE transcations(
		transcation_id int primary key,
        amount Decimal(5,2)
);

alter table transcations
add constraint
primary key (transcation_id);

insert into transcations
values (1000,4.00),
		(1001,5.00),
        (1002,6.00),
        (1003,4.00);

select amount from transcations
where transcation_id = 1002;

-- auto _increment
drop table transcations;

create table transcations (	
		transcation_id int primary key auto_increment,
        amount decimal(5,2)
);

insert into transcations (AMOUNT)
values (4.20),(3.99),(2.00),(4.98);

delete FROM TRANSCATIONS;

 ALTER TABLE TRANSCATIONS
auto_increment = 1000;
select * from transcations;


---- FOREGIN KEY & PRIMARY KEY
CREATE TABLE customers(
		customer_id INT PRIMARY KEY  AUTO_INCREMENT,
        first_name VARCHAR(50),
        last_name varchar(50)
);

insert into customers (first_name,last_name)
values ("fred","FISH"),				
	   ("Jason","lobster"),				
	   ("bubbi","crab");

Drop table transcations;

create table transcations (	
		transcation_id int primary key auto_increment,
        amount decimal(5,2),
        customer_id int,
        foreign key(customer_id) references customers(customer_id)
);

insert into transcations (amount,customer_id)
values (4.20,3),(3.99,2),(2.00,3),(4.98,1);
select * from transcations;

alter table transcations
auto_increment = 1000;


--- table already exist--
alter table transcations
add constraint fk_customer_id
foreign key (customer_id) references customers(CUSTOMER_ID);



---- join using pk & fk

-- inner join (left transcation - right customers = inner join)

select * 
from transcations inner join customers
on transcations.customer_id = customers.customer_id;


select transcation_id,CONCAT(first_name,last_name," "),amount
from transcations inner join customers
on transcations.customer_id = customers.customer_id;


--- LEFT JOINS 
select * 
from transcations left join customers
on transcations.customer_id = customers.customer_id;

--- right join

select * 
from transcations right join customers
on transcations.customer_id = customers.customer_id;
