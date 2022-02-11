/*
Task - Create a visualization that provides a breakdown between male and female employees 
working in the company each year starting from 1990.
*/
use employees_mod;
select year(tde.from_date) as year_s, te.gender, count(te.gender) as employees_count
from t_employees te
join t_dept_emp tde
on te.emp_no = tde.emp_no 
group by year_s, te.gender
having year_s>='1990'
order by year_s;

