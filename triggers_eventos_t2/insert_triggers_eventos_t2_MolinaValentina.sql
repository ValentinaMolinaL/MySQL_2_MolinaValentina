 use triggers_eventos_t2;

-- Insertar regiones
INSERT INTO regions (region_id, region_name) VALUES 
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'South America');

-- Insertar países
INSERT INTO countries (country_id, country_name, region_id) VALUES 
('US', 'United States', 1),
('CA', 'Canada', 1),
('FR', 'France', 2),
('JP', 'Japan', 3);

-- Insertar ubicaciones
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES 
(100, '123 Main St', '12345', 'New York', 'NY', 'US'),
(101, '456 Elm St', '67890', 'Toronto', 'ON', 'CA'),
(102, '789 Maple Ave', '54321', 'Paris', 'IDF', 'FR');

-- Insertar departamentos
INSERT INTO departments (department_id, department_name, location_id) VALUES 
(10, 'Finance', 100),
(20, 'Marketing', 101),
(30, 'IT', 102);

-- Insertar trabajos
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES 
(1, 'Accountant', 50000, 90000),
(2, 'Software Developer', 60000, 120000),
(3, 'HR Manager', 70000, 150000);

-- Insertar empleados
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '2020-01-15', 1, 75000, NULL, 10),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678', '2021-06-01', 2, 80000, 1, 20),
(3, 'Alice', 'Johnson', 'alicej@example.com', '555-9012', '2019-03-10', 3, 95000, 1, 30);

-- Insertar dependientes
INSERT INTO dependents (dependent_id, first_name, last_name, relationship, employee_id) VALUES 
(1, 'Emily', 'Doe', 'Daughter', 1),
(2, 'Michael', 'Doe', 'Son', 1),
(3, 'Sophia', 'Smith', 'Spouse', 2);