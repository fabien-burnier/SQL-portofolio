-- Drop tables if they already exist
DROP TABLE IF EXISTS employee_demographics;
DROP TABLE IF EXISTS employee_salary;
DROP TABLE IF EXISTS parks_departments;

-- Create tables first

CREATE TABLE parks_departments (
  department_id INTEGER PRIMARY KEY AUTOINCREMENT,
  department_name TEXT NOT NULL
);

CREATE TABLE employee_demographics (
  employee_id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INTEGER,
  gender TEXT,
  birth_date TEXT -- Stored as ISO string in SQLite
);

CREATE TABLE employee_salary (
  employee_id INTEGER,
  first_name TEXT,
  last_name TEXT,
  occupation TEXT,
  salary INTEGER,
  dept_id INTEGER,
  FOREIGN KEY (employee_id) REFERENCES employee_demographics(employee_id),
  FOREIGN KEY (dept_id) REFERENCES parks_departments(department_id)
);

-- Insert data into parks_departments

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

-- Insert data into employee_demographics

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

-- Insert data into employee_salary

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000, 1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000, 1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000, 1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000, 1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000, 1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
(7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
(8, 'Chris', 'Traeger', 'City Manager', 90000, 3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1);
