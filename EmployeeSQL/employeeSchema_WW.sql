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