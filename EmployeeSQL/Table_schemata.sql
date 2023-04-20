Departments
-
dept_no varchar(20) pk
dept_name varchar(20)

Department_Employee
-
emp_no integer pk FK >- Employees.emp_no
dept_no varchar(20) pk FK >- Departments.dept_no

Department_Manager
-
dept_no varchar(20) pk FK >- Departments.dept_no
emp_no integer pk FK >- Employees.emp_no

Employees
-
emp_no integer pk 
emp_title_id varchar(20) FK >- Titles.title_id
birth_date date
first_name varchar(20)
last_name varchar(20)
sex varchar(1)
hire_date date

Salaries
-
emp_no integer pk FK >- Employees.emp_no
salary integer

Titles
-
title_id varchar(20) pk
title varchar(20)