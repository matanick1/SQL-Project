CREATE TABLE "Departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employee" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Department_Manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(20)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

-- List the employee number, last name, first name, sex, and salary of each employee
Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
From "Employees"
Join "Salaries" on "Employees".emp_no = "Salaries".emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
Select "Employees".first_name, "Employees".last_name, "Employees".hire_date
From "Employees"
Where hire_date between '1986-01-01' and '1986-12-31'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
Select "Employees".first_name, "Employees".last_name, "Employees".emp_no, "Departments".dept_name, "Departments".dept_no
From "Employees"
Join "Department_Manager" on "Employees".emp_no = "Department_Manager".emp_no
Join "Departments" on "Department_Manager".dept_no = "Departments".dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
Select "Departments".dept_no, "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
From "Departments"
Join "Department_Manager" on "Departments".dept_no = "Department_Manager".dept_no
Join "Employees" on "Department_Manager".emp_no = "Employees".emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
Select "Employees".first_name, "Employees".last_name, "Employees".sex
From "Employees"
Where first_name = 'Hercules' and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name
Select "Employees".emp_no, "Employees".last_name, "Employees".first_name
From "Employees"
Join "Department_Manager" on "Employees".emp_no = "Department_Manager".emp_no
Join "Departments" on "Department_Manager".dept_no = "Departments".dept_no
Where dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
From "Employees"
Join "Department_Manager" on "Employees".emp_no = "Department_Manager".emp_no
Join "Departments" on "Department_Manager".dept_no = "Departments".dept_no
Where dept_name = 'Sales' or dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
Select "Employees".last_name,  count(last_name) as "frequency_count"
From "Employees"
Group by last_name
Order by "frequency_count" desc
