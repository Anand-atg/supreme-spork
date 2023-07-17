-- loops 

delimiter $$
create procedure loopdemo2()
begin
declare i int;
declare str varchar(50);
set i=1;
set str = " ";
while i<=10 DO
Set str = concat(str,i," ");
    set i= i +1;
    end while;
    select str;
end$$
delimiter ;

call loopdemo2;