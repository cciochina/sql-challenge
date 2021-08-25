-- cheking if the data is correct
SELECT * FROM departments
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM dept_manager
SELECT * FROM dept_emp

--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no=s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE date_part('year', hire_date) = 1986

--3. List the manager of each department with the following information: 
--department number, department name, the manager’s employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments as d
INNER JOIN dept_manager as dm ON dm.dept_no = d.dept_no
INNER JOIN employees as e ON e.emp_no = dm.emp_no

-- 4. the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de 
INNER JOIN employees as e ON de.emp_no = e.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no

--5. List first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de 
INNER JOIN employees as e ON de.emp_no = e.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name='Sales'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de 
INNER JOIN employees as e ON de.emp_no = e.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "Count Last_Names"
FROM employees
GROUP BY last_name
ORDER BY "Count Last_Names" DESC
