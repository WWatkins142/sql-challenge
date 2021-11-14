--Create the tables in the following order: 
--Titles
--Employees
--Departments
--Dept_manager
--Dept_Emp
--Salaries

Create Table titles
(
	title_id VARCHAR Primary Key, 
	title VARCHAR
);

Select * From titles;

Create Table employees
(
	emp_no INT Primary Key,
	emp_title_id VARCHAR,	
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	Foreign Key (emp_title_id) References titles(title_id)
);

Select* From employees;

Create Table departments
(
	dept_no VARCHAR Primary Key,
	dept_name VARCHAR
);

SELECT * FROM departments;

Create Table department_manager -- junction table
(
	dept_no VARCHAR, 
	emp_no INT,
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees(emp_no), 
	Primary Key (dept_no, emp_no)
);

Select * From department_manager

Create Table dept_emp -- junction table
(
	emp_no INT,
	dept_no VARCHAR, 
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees(emp_no), 
	Primary Key (emp_no, dept_no)
);

Select * From dept_emp;

Create Table salaries
(
	emp_no INT Primary Key,
	salary INT,
	Foreign Key (emp_no) References employees(emp_no)
);

Select * From salaries;

--List the following details of each employee: employee number, last name, first name, sex, and salary.


--List first name, last name, and hire date for employees who were hired in 1986.
--Select * from employees;
-- use BETWEEN function since the hire_date is DATE datatype
SELECT first_name, last_name, hire_date
From employees
Where hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


--List the department of each employee with the following information: employee number, last name, first name, and department name.


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules'
And last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select * from employees;
Select * from departments;
Select * from dept_emp;

Select employees.emp_no, first_name, last_name, dept_name
From employees
Inner Join dept_emp
On employees.emp_no = dept_emp.emp_no
Inner Join departments
On departments.dept_no = dept_emp.dept_no
Where departments.dept_name IN ('Sales', 'Development');


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select * from employees;
Select last_name, COUNT(last_name) AS "Last Name Count"
From employees
Group By last_name
Order By "Last Name Count" DESC;
