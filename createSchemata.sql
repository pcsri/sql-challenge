-- Database: challenge9
-- DROP DATABASE IF EXISTS challenge9;

CREATE DATABASE challenge9
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
--CREATE TABLE SCRIPTS FOR ALL 6 TABLES
--departments, dept_emp, dept_manager, employees, salaries, titles
--with primary keys and columns that should not have NULL value

--create departments table
create table departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50)
);

create table dept_emp(
	emp_no int,
	dept_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

create table dept_manager(
	dept_no VARCHAR(10) not null,
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

create table employees(
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date date,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex	VARCHAR(10),
	hire_date date,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

create table salaries(
	emp_no int,
	salary int,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

create table titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(50) not null
);
