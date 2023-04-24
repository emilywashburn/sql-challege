--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from "Employees" e
join "Salaries" s on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from "Employees"
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from "Department_manager" dm
join "Employees" e
on dm.emp_no = e.emp_no
join "Departments" d
on dm.dept_no = d.dept_no
order by d.dept_name;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e
join "Department_employees" de
on e.emp_no = de.emp_no
join "Departments" d 
on d.dept_no = de.dept_no
order by d.dept_name;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from "Employees"
where first_name = 'Hercules' and last_name like 'B%'
order by last_name;

--List each employee in the Sales department, including their employee number, last name, and first name.
select d.dept_name, e.emp_no, e.last_name, e.first_name
from "Employees" e
join "Department_employees" de 
on e.emp_no = de.emp_no
join "Departments" d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e
join "Department_employees" de 
on e.emp_no = de.emp_no
join "Departments" d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by d.dept_name;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(emp_no) as same_last_name
from "Employees"
group by last_name
order by same_last_name desc;