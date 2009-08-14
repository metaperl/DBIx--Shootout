-- top 5 salaries, distinct by employees, and their department at the time
SELECT 
  * 
FROM 
  salaries INNER JOIN dept_emp USING (emp_no) INNER JOIN departments USING (dept_no) 
WHERE 
  salaries.to_date <= dept_emp.to_date 
GROUP BY 
  emp_no 
ORDER BY 
  salary DESC 
LIMIT 5 ;
