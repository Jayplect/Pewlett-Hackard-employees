------------------------- DATA ANALYSIS -------------------------

--#1 List of employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
	FROM "employees" as emp 
	JOIN salaries as sal
		ON emp.emp_no = sal.emp_no
	ORDER BY emp.emp_no;

--#2 List of first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date 
	FROM employees AS emp
	WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' 
	ORDER BY hire_date;

--#3 List manager of each department with the following information: department number, 
-- 	department name, the manager's employee number, last name, first name.	
SELECT d.dept_no, d.dept_name, dm.emp_no, emp.last_name,  emp.first_name
	FROM departments as d
	JOIN dept_manager AS dm
		ON d.dept_no = dm.dept_no
	JOIN employees AS emp
		ON dm.emp_no = emp.emp_no
	ORDER BY emp_no;

--#4 List of the department number for each employee along with that employee’s 
-- 	employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, emp.last_name, emp.first_name, d.dept_name
	FROM dept_emp AS de
	JOIN employees AS emp
		ON de.emp_no = emp.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
	ORDER BY emp_no;

--#5 List first name, last name, and sex for employees
-- 	whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name like 'B%';
	
--#6 List all employees in the Sales department, including their 
-- 	employee number, last name, first name, and department name.
SELECT emp.emp_no,emp.last_name,emp.first_name,d.dept_name		
	FROM employees AS emp
	JOIN dept_emp AS de
		ON de.emp_no = emp.emp_no
	JOIN departments d
		ON d.dept_no = de.dept_no
		WHERE dept_name = 'Sales'
	ORDER BY emp_no;
	
--#7 List all employees in the Sales and Development departments, 
--  including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
	FROM employees AS emp
	JOIN dept_emp AS de
		ON de.emp_no = emp.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
		WHERE dept_name = 'Sales' 
			OR dept_name = 'Development'
	ORDER BY emp_no;

--#8 In descending order, list the frequency count of employee last names, 
--  i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS "frequency_count"
	FROM employees       
	GROUP BY last_name
	ORDER BY "frequency_count" DESC;
	