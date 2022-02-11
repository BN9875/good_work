/*
Create an SQL stored procedure that will allow you to obtain the average male and female salary
per department within a certain salary range. Let this range be defined by two values the user
can insert when calling the procedure.
Finally, visualize the obtained result set in Tableau as a double bar chart.
*/


/*
t_employees e --> gender
t_salaries s --> salary
t_departments d --> dept_name
t_dept_emp de --> dept_no
e.emp_no = s.emp_no
s.emp_no = de.emp_no
de.dept_no = d.dept_no
*/



drop procedure if exists salary_in_range;

delimiter $$
create procedure salary_in_range(in p_min_salary decimal(10,2), in p_max_salary decimal(10,2))
begin
SELECT 
    d.dept_name, e.gender, ROUND(AVG(s.salary),2) AS AvgSalary
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name , e.gender
HAVING AvgSalary BETWEEN p_min_salary AND p_max_salary
ORDER BY d.dept_no;
end$$

delimiter ;
