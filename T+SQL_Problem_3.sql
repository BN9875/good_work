/*
Compare the average salary of female versus male employees in entire company until year 2002, 
add a filter allowing you to see that per each department.
*/

/*
t_department d - dept_name
t_employees e - gender
t_salaries s - salary
t_dept_emp de - from_date
*/

select e.gender, d.dept_name, round(avg(s.salary),2) as avg_salary, year(de.from_date) as calendar_year
from t_employees e
join t_salaries s
on s.emp_no = e.emp_no
join t_dept_emp de
on e.emp_no = de.emp_no
join t_departments d 
on d.dept_no = de.dept_no
group by d.dept_no, e.gender, calendar_year
having calendar_year <= '2002'
order by d.dept_no;
