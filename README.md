# README

## Project Overview

This project consists of an SQL database structure aimed at managing departments, employees, salaries, and titles in an organization.

### Files Included:

1. `Query.sql` - Contains SQL commands for creating the database tables.
2. `QuickDBD-ERD Code.png` - An Entity-Relationship Diagram (ERD) or code related to QuickDBD, visualizing the relationships between the tables.
3. `Table_schemata.sql` - A text representation of the table schemas and their relationships.

## Table Descriptions:

### 1. Departments
- **dept_no**: varchar(20), primary key
- **dept_name**: varchar(20)

### 2. Department_Employee
- **emp_no**: integer, primary key, foreign key referencing `Employees.emp_no`
- **dept_no**: varchar(20), primary key, foreign key referencing `Departments.dept_no`

### 3. Department_Manager
- **dept_no**: varchar(20), primary key, foreign key referencing `Departments.dept_no`
- **emp_no**: integer, primary key, foreign key referencing `Employees.emp_no`

### 4. Employees
- **emp_no**: integer, primary key
- **emp_title_id**: varchar(20), foreign key referencing `Titles.title_id`
- **birth_date**: date
- **first_name**: varchar(20)
- **last_name**: varchar(20)
- **sex**: varchar(1)
- **hire_date**: date

### 5. Salaries
- **emp_no**: integer, primary key, foreign key referencing `Employees.emp_no`
- **salary**: integer

### 6. Titles
- **title_id**: varchar(20), primary key
- **title**: varchar(20)

## How to Use:

1. Execute the `Query.sql` file in your SQL database management system to create the tables.
2. Refer to the `QuickDBD-ERD Code.png` for a visual representation of the relationships between tables or for related code.
3. The `Table_schemata.sql` file can be used as a quick reference to understand the structure and relationships of the tables.
