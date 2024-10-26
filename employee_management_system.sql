-- Create the database
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

-- Table for departments informatin
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

-- Table for positions of employee
CREATE TABLE emp_position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Table for employees information
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE,
    department_id INT,
    position_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (position_id) REFERENCES emp_position(position_id)
);



-- Insert data into Department
INSERT INTO Department (department_name)
VALUES ('Human Resources'), ('Finance'), ('Engineering'), ('Sales'),('Marketing'),('IT'),('Customer service'),('Accounting');

select * from Department;


-- Insert data into Position
INSERT INTO emp_position (position_title, salary)
VALUES ('Senior Manager',70000),('Manager', 60000), ('Assistant Manager',50000), ('Engineer', 50000), 
		('Sales Executive', 40000), ('Accountant', 45000),('Admin',30000),('Associate', 40000);

select * from emp_position;


-- Insert data into Employee
INSERT INTO Employee (first_name, last_name, email, phone_number, hire_date, department_id, position_id)
VALUES 
    ('John', 'Doe', 'john.doe@gmail.com', '1234567890', '2021-01-15', 1, 1),
    ('Jane', 'Smith', 'jane.smith@gmail.com', '9987654321', '2021-06-20', 3, 2),
    ('Jay', 'Kadam', 'jay@gmail.com', '8978798767', '2023-03-30', 4, 3),
    ('sagar', 'Kadam', 'sagar@gmail.com', '9975798767', '2024-03-30', 2, 3),
    ('Joel', 'dmello', 'joel@gmail.com', '9979898767', '2023-09-01', 5, 4),
    ('amar', 'vagh', 'amar@gmail.com', '8978723767', '2023-02-15', 6, 1),
    ('nikita', 'lad', 'nikita@gmail.com', '9978798747', '2021-01-04', 2, 6);

select * from Employee;



## Retrive all employee
SELECT e.employee_id, e.first_name, e.last_name, e.email, d.department_name, p.position_title, p.salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN emp_position p ON e.position_id = p.position_id;


## Add a new employee
INSERT INTO Employee (first_name, last_name, email, phone_number, hire_date, department_id, position_id)
VALUES ('Mike', 'Johnson', 'mike.johnson@gmail.com', '9876543210', '2023-09-07', 2, 4),
		('Jack', 'salvi', 'jack@gmail.com', '9876590080', '2022-05-07', 7, 6),
		('Mina', 'kadam', 'mina@gmail.com', '9989043210', '2023-08-09', 8, 7);
select * from Employee;

## Update employee position and salary
UPDATE Employee
SET position_id = 2
WHERE employee_id = 1;


## Get employees in a specific department:
SELECT first_name, last_name, email
FROM Employee
WHERE department_id = 2;


## Find Employees Hired Within a Specific Date Range
SELECT first_name, last_name, hire_date
FROM Employee
WHERE hire_date BETWEEN '2022-01-01' AND '2023-12-31';


##  List Employees Along with Department and Position Details
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, p.position_title, p.salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN emp_position p ON e.position_id = p.position_id;


## Count the Number of Employees in Each Department
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name;


## Calculate Average Salary per Department
SELECT d.department_name, AVG(p.salary) AS average_salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN emp_position p ON e.position_id = p.position_id
GROUP BY d.department_name;


##  List All Employees with Salaries Above a Certain Amount
SELECT first_name, last_name, salary
FROM Employee e
JOIN emp_position p ON e.position_id = p.position_id
WHERE p.salary > 50000;


## Find the Employee with the Highest Salary
SELECT first_name, last_name, salary
FROM Employee e
JOIN emp_position p ON e.position_id = p.position_id
ORDER BY salary DESC
LIMIT 1;


## Find Employees Not Assigned to Any Department
SELECT first_name, last_name
FROM Employee
WHERE department_id IS NULL;


## Update Employee Salary by a Certain Percentage Based on Position
SET SQL_SAFE_UPDATES = 0;

UPDATE emp_position
SET salary = salary * 1.10
WHERE position_title = 'Engineer';

SET SQL_SAFE_UPDATES = 1;  -- Turn it back on after the update, if needed



## Find Departments with No Employees
SELECT department_name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


## Retrieve Department with the Highest Average Salary
SELECT d.department_name, AVG(p.salary) AS average_salary
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
JOIN emp_position p ON e.position_id = p.position_id
GROUP BY d.department_name
ORDER BY average_salary DESC
LIMIT 1;


## Find Employees by Partial Match on Name
SELECT first_name, last_name
FROM Employee
WHERE first_name LIKE '%an%';


## Promote an Employee to a New Position
UPDATE Employee
SET position_id = 1  -- assuming 1 is the ID for Manager position
WHERE employee_id = 4;


## Display the Top 3 Highest-Paid Employees in Each Department
SELECT e.first_name, e.last_name, d.department_name, p.salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
JOIN emp_position p ON e.position_id = p.position_id
ORDER BY d.department_name, p.salary DESC
LIMIT 3;


