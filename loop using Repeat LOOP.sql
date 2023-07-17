-- loops 

delimiter $$
create procedure loopdemo3()
begin
declare i int;
declare str varchar(50);
set i=1;
set str = " ";
Repeat
Set str = concat(str,i," ");
    set i= i +1;
    until i>10
    end Repeat;
    select str;
end$$
delimiter ;

call loopdemo3;