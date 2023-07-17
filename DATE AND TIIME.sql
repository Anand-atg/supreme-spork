
-- Current_date &current _time()


create table test(
			my_date DATE,
            my_time time,
            my_datetime datetime
);

Insert into test 
values(current_date(),current_time(),now());
select * from test;


---- + 1 GIVE NEXT & -1 GIVES YESTERDAY DATE AND TIME 

Insert into test 
values(current_date() +1,current_time(),now());
select * from test;

