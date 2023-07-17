use	atgpvt;

select * from employee;

select emp_id,ename,avg(sal)
from employee
group by emp_id,ename;


select ucase(ename) name,avg(sal)
from employee
group by ename;

select jo_desc,count(emp_id)
from employee
group by jo_desc;

select emp_id, sum(sal)
FROM EMPLOYEE
where jo_desc="ananlyst"
group by emp_id;

-- where filter row
-- aving filter group

select jo_desc,count(emp_id)
from employee
group by jo_desc
having count(emp_id)
order by jo_desc;

select jo_desc,count(emp_id)
from employee
where sal>1000000
group by jo_desc
having count(emp_id)>1;