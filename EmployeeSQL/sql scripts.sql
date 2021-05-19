/*/List the following details of each employee: employee number, last name, first name, sex, and salary.


*/

select employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary,
  salaries.emp_no
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

/*List first name, last name, and hire date for employees who were hired in 1986.


*/
select first_name,last_name, hire_date
from employees
where hire_date between '1-1-1986' and '12-31-1986';

/*List the manager of each department with the following information:
 department number, department name, the manager's employee number, last name, first name.
 */
 
 select e.last_name,
  e.first_name,
  dm.dept_no,
  dm.emp_no,
  d.dept_name
FROM dept_manager AS dm
INNER JOIN departments as d 
ON (dm.dept_no = d.dept_no)
INNER JOIN employees as e
ON (dm.emp_no = e.emp_no);

/*List the department of each employee with the following information:
 employee number, last name, first name, and department name.*/
 
 SELECT e.last_name,
	e.emp_no,
	e.first_name,
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

/*
List first name, last name, and sex for employees whose
 first name is "Hercules" and last names begin with "B."*/
 
SELECT e.first_name, e.last_name, e.sex
FROM employees as e 
WHERE first_name = 'Hercules'
AND last_name like 'B%';

/*List all employees in the Sales department,
 including their employee number, last name, first name, and department name.*/
 
 SELECT e.last_name,
		e.first_name,
		d.dept_name,
		de.emp_no
FROM dept_emp as de
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no)
INNER JOIN employees as e
ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales';

/*List all employees in the Sales and Development departments,
 including their employee number, last name, first name, and department name.*/
 
 SELECT e.last_name,
		e.first_name,
		d.dept_name,
		de.emp_no
FROM dept_emp as de
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no)
INNER JOIN employees as e
ON (de.emp_no = e.emp_no)
WHERE d.dept_name in ('Development', 'Sales');

/*In descending order, list the frequency count of employee last names,
 i.e., how many employees share each last name.*/
 
SELECT e.last_name, COUNT(e.last_name) AS "Last Name Count"
FROM employees e
GROUP BY e.last_name
ORDER BY e.last_name DESC; 




