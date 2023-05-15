-- DATA ENGINEERING PROCESS

-- Alter datestyle format and set to postgres default
-- Show datestyle format
SHOW datestyle;
-- Set datestlye to MDY
ALTER DATABASE "Employees_db" SET datestyle TO "ISO, MDY";

--Default: Drop tables before Creating Tables to avoid errors
-- Cascade allows tables with foreigns to be dropped
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles CASCADE;

-- Create Tables for DB
-- Create departments table
CREATE TABLE departments(
	dept_no VARCHAR(10) UNIQUE NOT NULL,
	dept_name VARCHAR (60) NOT NULL,
	PRIMARY KEY (dept_no)
	);
	
-- Create title table
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);	
-- Create employees table
CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex char(1) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY(
        "emp_no")
	);

-- Create department employees table
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no,dept_no)
	);

-- Create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
	);

-- Create salaries table
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no),
	salary INTEGER NOT NULL
	);
	
-- Display each table
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- Manually Import data into tables using the Import GUI
-- Alternatively, import data into Tables using 'COPY FROM'
-- To use alternative method, set file permission to Full control
-- Copy Table in corresponding Order of creation to avoid Foreign Key Contraint Error

-- Copy departments data into table
COPY departments(dept_no,dept_name)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\departments.csv'
DELIMITER ','
CSV HEADER;

--Copy titles data into table
COPY titles(title_id,title)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\titles.csv'
DELIMITER ','
CSV HEADER;

--Copy employees data into table
COPY employees(emp_no,emp_title_id, birth_date,first_name, last_name, sex,hire_date)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\employees.csv'
DELIMITER ','
CSV HEADER;

--Copy department_employees data into table
COPY dept_emp(emp_no, dept_no)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

--Copy department_managers data into table
COPY dept_manager(dept_no, emp_no)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

--Copy salaries data into table
COPY salaries(emp_no, salary)
FROM 'C:\Users\evans\Documents\Code\Challenge\Challenge_9\sql-challenge\data\salaries.csv'
DELIMITER ','
QUOTE ' '
CSV HEADER;



