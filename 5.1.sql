  show databases;
  create database P5;
  USE P5;
CREATE TABLE employees ( 
  emp_id INT, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50), 
  dept VARCHAR(50), 
  salary INT, 
  hired_date DATE, 
  PRIMARY KEY (emp_id) -- creates a primary index on emp_id 
) ENGINE=InnoDB; 
CREATE INDEX idx_lastname ON employees(last_name); 
CREATE INDEX idx_dept_salary ON employees(dept, salary); 