/*
Task 2 - Compare the number of male managers to the female managers from different departments 
for each year starting from 1990.
*/

# tables used - t_employees as e, t_departments as d, t_dept_managers as dm

SELECT 
    dm.emp_no,
    d.dept_name,
    ee.gender,
    dm.from_date,
    dm.to_date,
    calendar_year,
    CASE
        WHEN
            YEAR(dm.to_date) >= e.calendar_year
                AND YEAR(dm.from_date) <= e.calendar_year
        THEN
            1
        ELSE 0
    END AS active_still
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;


