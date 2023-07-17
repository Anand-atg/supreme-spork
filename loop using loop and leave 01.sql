-- loops 

delimiter $$
create procedure loopdemo()
begin
declare i int;
declare str varchar(50);
set i=1;
set str = " ";
looplable : loop 
	if i>10 then 
    leave looplable;
    end if;
    Set str = concat(str,i," ");
    set i= i +1;
    end loop;
    select str;
end$$
delimiter ;

call loopdemo;