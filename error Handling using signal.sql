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
declare continue handler for 1062
resignal set message_text='duplicate key';
insert into  branch
values (id,bname,addr);
select * from branch;
end$$

delimiter ;

call insertbranch(4,'ma','xyz');


