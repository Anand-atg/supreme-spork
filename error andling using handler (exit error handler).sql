use atgpvt;

select * from employee;
select * from branch;

delimiter $$
create Procedure insertbranch(
in id int,
in bname varchar(50),
in addr varchar(70)
)
begin
declare exit handler for 1062
begin
select concat('duplicate key ',id,'creat insert into branch table');
end;
insert into  branch
values (id,bname,addr);

select * from branch;
end$$

delimiter ;

call insertbranch(1,'maduri','20 km road');


