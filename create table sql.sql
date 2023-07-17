create database atgpvt;

use atgpvt;

create table student(
id int primary key,
name varchar(30),
gpa decimal(3,2)
);

describe student;

select * from student;

insert into student values(1,"Anand",7.0);

insert into student values
(2,"atg",7.1),
(3,"pd",5.0),
(4,"dave",6.0);
