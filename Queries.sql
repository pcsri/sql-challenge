-- Database: challenge9
--Viewing data in the tables after the import from the CSV files completed successfully

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;

select count(*) from employees;

select * from salaries;
select * from titles;

--List the employee number, last name, first name, sex, and salary of each employee.

select a.emp_no, a.last_name, a.first_name, a.sex, b.salary 
from employees a, salaries b
where a.emp_no = b.emp_no;

--List the first name, last name, and hire date for the employees 
--who were hired in 1986

select a.emp_no, a.last_name, a.hire_date 
from employees a
where a.hire_date between '1986-01-01' and '1986-12-31' 

--List the department number for each employee 
--along with that 
--employee’s employee number, last name, first name, and department name.

select a.emp_no, a.last_name, a.first_name, b.dept_name 
from employees a, departments b, dept_emp c
where a.emp_no = c.emp_no
and b.dept_no = c.dept_no;

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name 
--begins with the letter B.

select a.first_name, a.last_name, a.sex 
from employees a
where a.first_name = 'Hercules'
and a.last_name like 'B%';

--List each employee in the Sales department, 
--including their employee number, last name, and first name.

select a.emp_no, a.last_name, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.dept_no = (
	select dept_no
	from departments
	where dept_name like 'Sale%')

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.

select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and b.dept_no in (
	select dept_no
	from departments
	where dept_name like 'Sale%' 
	or dept_name like 'Development%')

--List the frequency counts, in descending order, 
--of all the employee last names 
--(that is, how many employees share each last name).

select last_name desc, count(last_name) 
from employees
group by last_name
order by count(last_name) desc;
