# Employee-Management-System-using-SQL

An Employee Management System (EMS) is a basic database solution to manage and organize employee information efficiently. This system enables CRUD operations for employee records, such as adding, updating, viewing, and deleting employee details, as well as managing departments and positions within an organization.

## Features

- **Employee Records Management**: Add, update, view, and delete employee records.
- **Department and Position Management**: Define departments and positions with corresponding salaries.
- **Employee Queries**:
  - View employees by department, position, or specific criteria.
  - Calculate and view average salary per department.
  - Identify top earners and longest-tenured employees.
  - Query employees with custom date ranges and conditions.
- **Database Constraints**:
  - Each employee belongs to a department and holds a position.
  - Unique emails for employees to avoid duplicate records.

## Database Schema

The database consists of three main tables:

1. **Department**:
   - `department_id`: Primary key for identifying the department.
   - `department_name`: Name of the department (e.g., HR, Finance).

2. **Position**:
   - `position_id`: Primary key for identifying the position.
   - `position_title`: Title of the position (e.g., Manager, Engineer).
   - `salary`: Salary associated with the position.

3. **Employee**:
   - `employee_id`: Primary key for identifying the employee.
   - `first_name` and `last_name`: Basic details of the employee.
   - `email`: Unique identifier for contact.
   - `phone_number`: Contact number.
   - `hire_date`: Date of hiring.
   - `department_id`: Foreign key linking to `Department`.
   - `position_id`: Foreign key linking to `Position`.

## SQL Code

Here’s the SQL code to set up the tables and some sample data:

```sql
-- Create the database
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

-- Table for departments
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

-- Table for positions
CREATE TABLE Position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Table for employees
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
    FOREIGN KEY (position_id) REFERENCES Position(position_id)
);

-- Sample data for testing
INSERT INTO Department (department_name)
VALUES ('Human Resources'), ('Finance'), ('Engineering'), ('Sales');

INSERT INTO Position (position_title, salary)
VALUES ('Manager', 60000), ('Engineer', 50000), ('Sales Executive', 40000), ('Accountant', 45000);

INSERT INTO Employee (first_name, last_name, email, phone_number, hire_date, department_id, position_id)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890', '2021-01-15', 1, 1),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2021-06-20', 3, 2),
    ('Emma', 'Brown', 'emma.brown@example.com', '2345678901', '2022-03-30', 4, 3);
```

## Example Queries

Below are some example queries you can use in the EMS:

- **View all employees**:
    ```sql
    SELECT * FROM Employee;
    ```

- **Count the number of employees in each department**:
    ```sql
    SELECT d.department_name, COUNT(e.employee_id) AS total_employees
    FROM Department d
    LEFT JOIN Employee e ON d.department_id = e.department_id
    GROUP BY d.department_name;
    ```

- **List top earners in each department**:
    ```sql
    SELECT e.first_name, e.last_name, d.department_name, p.salary
    FROM Employee e
    JOIN Department d ON e.department_id = d.department_id
    JOIN Position p ON e.position_id = p.position_id
    ORDER BY d.department_name, p.salary DESC
    LIMIT 3;
    ```

## Requirements

- SQL-compatible Database (e.g., MySQL, PostgreSQL)
- SQL Client (e.g., MySQL Workbench, pgAdmin, or CLI)

## Getting Started

1. **Clone the repository** (if applicable):
    ```bash
    git clone https://github.com/yourusername/EmployeeManagementSystem.git
    cd EmployeeManagementSystem
    ```

2. **Run SQL Scripts**:
   - Import the SQL file provided in this repository to your SQL database.
   - Alternatively, copy the SQL schema and sample data and execute it in your SQL client.

3. **Modify Configuration**:
   - Adjust connection settings (database name, username, password) based on your setup.

4. **Run Queries**:
   - Test the provided queries to ensure that data retrieval and modifications work as expected.

## Contributing

If you'd like to contribute, feel free to create pull requests or submit issues to improve functionality or expand this system's features.
