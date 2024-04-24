-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(25)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE department_employees (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT pk_department_employees PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE department_manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_department_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(25)   NOT NULL,
    last_name varchar(25)   NOT NULL,
    sex char   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    title_id varchar(5)   NOT NULL,
    title varchar(25)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE department_employees ADD CONSTRAINT fk_department_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE department_employees ADD CONSTRAINT fk_department_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager ADD CONSTRAINT fk_department_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager ADD CONSTRAINT fk_department_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

