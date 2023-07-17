USE ATGPVT;
select *  from Branch; 
Delimiter $$
Create procedure getstate(
in id int
)
Begin 
Case id 
when 3 then 
select 'maharashtra';
when 4 then 
	select 'andra pradesh';
else
	select 'tamilnadu';
    end case;

end$$
Delimiter ;

call getstate (4);








