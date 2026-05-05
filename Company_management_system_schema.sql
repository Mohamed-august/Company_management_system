
create database Company_management_system_schema;

use Company_management_system_schema; 

create table products
(
product_no int not null,
price decimal(10,2) not null,
product_name varchar(50) not null,
description varchar(50) not null,
CONSTRAINT products_pk PRIMARY KEY (product_no)
);
-- Employees Table
CREATE TABLE employees
(
 employee_id INT NOT NULL,
 Fname VARCHAR(20) NOT NULL,
Lname VARCHAR(20) NOT NULL,
position VARCHAR(50) NOT NULL,
department VARCHAR(50) NOT NULL,
salary decimal(10,3) NOT NULL,
Date_of_Hire date NOT NULL, 
email VARCHAR(50) not null,
 Bday int,
 Bmonth int,
 Byear int,
 password VARCHAR(50) not null,
 CONSTRAINT employees_pk PRIMARY KEY (employee_id)
);
create table manager
(
manager_id int not null,
Fname varchar(50) not null,
Lname varchar(50) not null, salary
numeric (7,2) not null,
Bday int,
Bmonth int,
Byear int,
CONSTRAINT manager_pk PRIMARY KEY (manager_id)
);
-- Suppliers Table
CREATE TABLE suppliers
(
 supplier_id INT NOT NULL, supplier_name
VARCHAR(50) NOT NULL,
contact_information VARCHAR(50) ,
products_supplied VARCHAR(50) NOT NULL ,
 CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);
create table purchase_order
(
order_no int not null, quantity int
not null, purchase_order_date date
not null, product_no int not null,
supplier_id int not null,
CONSTRAINT purchase_order_pk PRIMARY KEY (order_no),
CONSTRAINT purchase_order_products_fk FOREIGN KEY (product_no) REFERENCES
products(product_no),
CONSTRAINT purchase_order_suppliers_fk FOREIGN KEY (supplier_id) REFERENCES
suppliers(supplier_id)
);
create table employee_review
(
performance varchar(50) not null, employee_id
int not null,
CONSTRAINT employee_review_employees_fk FOREIGN KEY (employee_id)
REFERENCES employees (employee_id)
);
-- Departments Table
CREATE TABLE departments
(
 department_id INT NOT NULL, manager_id
INT NOT NULL, no_of_employees INT NOT
NULL, department_name VARCHAR(50)
NOT NULL,
 CONSTRAINT departments_pk PRIMARY KEY (department_id)
);
-- Projects Table
CREATE TABLE  projects
(
 project_id INT NOT NULL,
project_name VARCHAR(50) NOT NULL,
st_date date NOT NULL, end_date date
NOT NULL, 
department_id INT NOT
NULL, 
budget decimal(10,2) NOT NULL,
 CONSTRAINT projects_pk PRIMARY KEY (project_id),
 CONSTRAINT projects_departments_fk FOREIGN KEY (department_id) REFERENCES
departments (department_id)
);
create table phone_no
( phone_no int not null, 
employee_id int not null, 
manager_id int not null ,
constraint phone_no_employees_fk foreign key (employee_id) references
employees(employee_id),
constraint phone_no_manager_fk foreign key (manager_id) references
manager(manager_id)
);
-- Salaries Table
CREATE TABLE salaries
(
salary_id INT NOT NULL,
salary_paid decimal(7,2) NOT NULL,
bonuses numeric (7,2) NOT NULL,
mon date NOT NULL,
 employee_id INT NOT NULL,
 CONSTRAINT salaries_pk PRIMARY KEY (salary_id),
 CONSTRAINT salaries_employees_fk FOREIGN KEY (employee_id) REFERENCES
employees (employee_id)
);
-- Tasks Table
CREATE TABLE tasks
(
 task_no INT NOT NULL, task_name
VARCHAR(20) NOT NULL,
assigned_employee_id INT NOT NULL,
due_date date NOT NULL, 
stat VARCHAR(10),
 CONSTRAINT customer_feedbacks_pk PRIMARY KEY (task_no),
 CONSTRAINT tasks_employees_fk FOREIGN KEY (assigned_employee_id) REFERENCES
employees (employee_id)
);
-- Attendance Table
CREATE TABLE attendence
(
attendence_time INT NOT NULL,
employee_id INT NOT NULL,
attendence_date date NOT NULL,
check_in_time time NOT NULL,
check_out_time time NOT NULL,
employee_name varchar(50),
CONSTRAINT attendence_pk PRIMARY KEY (attendence_time),
CONSTRAINT attendence_employees_fk FOREIGN KEY (employee_id) REFERENCES
employees (employee_id)
);
-- Assets Table
CREATE TABLE assets
(
 asset_id INT NOT NULL, asset_name
VARCHAR(20) NOT NULL, asset_type
VARCHAR (20) NOT NULL, asset_value
decimal (7,2) NOT NULL, assigned_department
VARCHAR(20) NOT NULL,
 CONSTRAINT assets_pk PRIMARY KEY (asset_id)
);
-- Invoices Table
CREATE TABLE invoices
(
 invoice_id INT NOT NULL, supplier_id
INT NOT NULL, invoice_date date NOT NULL, 
invoice_amount decimal(7,2) NOT
NULL, 
payment_status VARCHAR(10) NOT NULL,
 CONSTRAINT invoices_pk PRIMARY KEY (invoice_id),
CONSTRAINT invoices_suppliers_fk FOREIGN KEY (supplier_id) REFERENCES
suppliers (supplier_id)
);
-- Meetings Table
CREATE TABLE  meetings
(
 meeting_id INT NOT NULL,
agenda VARCHAR(20) NOT NULL,
meeting_date date NOT NULL,
meeting_time time NOT NULL,
participants INT NOT NULL,
project_id INT NOT NULL,
 CONSTRAINT meetings_pk PRIMARY KEY (meeting_id),
 CONSTRAINT fk_meetings_projects_id
 FOREIGN KEY (project_id) REFERENCES
projects(project_id)

);
-- Leave requests Table
CREATE TABLE  leave_requests
(
 leave_no INT NOT NULL,
employee_id INT NOT NULL,
st_date date NOT NULL, end_date
date NOT NULL, reason
VARCHAR(20) NOT NULL,
approval_status VARCHAR(10) NOT NULL,
 CONSTRAINT leave_requests_pk PRIMARY KEY (leave_no),
 CONSTRAINT leave_requests_employees_fk FOREIGN KEY (employee_id) REFERENCES
 employees (employee_id)
);
-- Trainings Table
CREATE TABLE  trainings
(
 training_id INT NOT NULL, training_name
VARCHAR(50) NOT NULL,
 training_date date NOT NULL, 
 training_duration VARCHAR (20)
NOT NULL,
attendees INT NOT NULL,
 CONSTRAINT trainings_pk PRIMARY KEY (training_id)
);
-- Clients Table
CREATE TABLE clients
(
 client_id INT,
 first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
contact_information VARCHAR(50) NOT NULL,
street VARCHAR(50) NOT NULL, city
VARCHAR(50) NOT NULL,
 CONSTRAINT customers_pk PRIMARY KEY (client_id)
);
-- Complaints Table
CREATE TABLE complaints
(
 complaint_id INT NOT NULL,
employee_id INT NOT NULL,
client_id INT NOT NULL,
complaint_date date NOT NULL,
description VARCHAR(50),
 stat VARCHAR (10) NOT NULL,
resolution_date date NOT NULL,
 CONSTRAINT complaints_pk PRIMARY KEY (complaint_id),
 CONSTRAINT complaints_employees_fk FOREIGN KEY (employee_id)
 REFERENCES employees (employee_id),
 CONSTRAINT complaints_clients_items_fk FOREIGN KEY (client_id)
 REFERENCES clients (client_id)
);
CREATE TABLE register (
manager_ID INT,
employee_ID INT,
attendance_time INT,
 FOREIGN KEY (manager_ID) REFERENCES manager(manager_id),
 FOREIGN KEY (employee_ID) REFERENCES employees(employee_id),
 FOREIGN KEY (attendance_time) REFERENCES attendence(attendence_time)
);
CREATE TABLE has (
employee_ID INT,
training_ID INT, 
FOREIGN KEY (employee_ID) REFERENCES employees(employee_id),
FOREIGN KEY (training_ID) REFERENCES trainings(training_id)
);
CREATE TABLE has2 (
 Invoice_ID INT,
Product_ID INT,
 FOREIGN KEY (Invoice_ID) REFERENCES invoices(invoice_id),
 FOREIGN KEY (Product_ID) REFERENCES products(product_no)
);
CREATE TABLE fulfill (
 Supplier_ID INT,
Order_No INT,
 FOREIGN KEY (Supplier_ID) REFERENCES suppliers(supplier_id),
 FOREIGN KEY (Order_No) REFERENCES purchase_order(order_no)
);
CREATE TABLE works_on (
 employee_ID INT,
project_ID INT,
 FOREIGN KEY (employee_ID) REFERENCES employees(employee_id),
 FOREIGN KEY (project_ID) REFERENCES projects(project_id)
);
CREATE TABLE Assigned_to (
 client_ID INT,
project_ID INT,
FOREIGN KEY (client_ID)
REFERENCES
clients(client_id),
 FOREIGN KEY (project_ID) REFERENCES projects(project_id)
);
CREATE TABLE include (
 order_no INT,
 Product_ID INT,
 FOREIGN KEY (order_no) REFERENCES purchase_order(order_no),
 FOREIGN KEY (Product_ID) REFERENCES products(product_no)
);
INSERT INTO employees
(employee_id, Fname, Lname, position, department, salary, Date_of_Hire, email, Bday, Bmonth, Byear, password)
VALUES
(1, 'John', 'Doe', 'Software Engineer', 'IT', 75000.00, '2018-06-15', 'john.doe@example.com', 15, 6, 1987, 'John123!'),
(2, 'Jane', 'Smith', 'Data Analyst', 'IT', 68000.00, '2020-03-12', 'jane.smith@example.com', 23, 8, 1990, 'Jane123!'),
(3, 'Michael', 'Brown', 'HR Manager', 'Human Resources', 80000.00, '2017-11-03', 'michael.brown@example.com', 12, 4, 1985, 'Michael123!'),
(4, 'Emily', 'Davis', 'Marketing Specialist', 'Marketing', 56000.00, '2019-08-22', 'emily.davis@example.com', 3, 5, 1992, 'Emily123!'),
(5, 'Chris', 'Wilson', 'Project Manager', 'Operations', 95000.00, '2016-05-10', 'chris.wilson@example.com', 8, 9, 1983, 'Chris123!'),
(6, 'Sophia', 'Taylor', 'UI/UX Designer', 'Design', 72000.00, '2021-07-19', 'sophia.taylor@example.com', 19, 7, 1994, 'Sophia123!'),
(7, 'Daniel', 'Moore', 'Accountant', 'Finance', 67000.00, '2015-04-25', 'daniel.moore@example.com', 25, 4, 1982, 'Daniel123!'),
(8, 'Emma', 'Anderson', 'Legal Advisor', 'Legal', 90000.00, '2022-01-10', 'emma.anderson@example.com', 10, 1, 1990, 'Emma123!'),
(9, 'James', 'Thomas', 'Network Administrator', 'IT', 71000.00, '2018-09-14', 'james.thomas@example.com', 14, 9, 1986, 'James123!'),
(10, 'Olivia', 'Jackson', 'Business Analyst', 'Operations', 73000.00, '2020-12-07', 'olivia.jackson@example.com', 7, 12, 1991, 'Olivia123!'),
(11, 'Benjamin', 'White', 'Sales Manager', 'Sales', 85000.00, '2019-02-20', 'benjamin.white@example.com', 20, 2, 1984, 'Benjamin123!'),
(12, 'Mia', 'Harris', 'Content Writer', 'Marketing', 50000.00, '2021-11-05', 'mia.harris@example.com', 5, 11, 1995, 'Mia123!'),
(13, 'Lucas', 'Martin', 'Technical Support Specialist', 'Customer Service', 48000.00, '2017-03-30', 'lucas.martin@example.com', 30, 3, 1993, 'Lucas123!'),
(14, 'Isabella', 'Garcia', 'Recruiter', 'Human Resources', 60000.00, '2016-08-15', 'isabella.garcia@example.com', 15, 8, 1988, 'Isabella123!'),
(15, 'Alexander', 'Martinez', 'Operations Manager', 'Operations', 98000.00, '2015-01-23', 'alex.martinez@example.com', 23, 1, 1980, 'Alexander123!'),
(16, 'Charlotte', 'Rodriguez', 'Graphic Designer', 'Design', 65000.00, '2020-06-28', 'charlotte.rodriguez@example.com', 28, 6, 1992, 'Charlotte123!'),
(17, 'Ethan', 'Lewis', 'Financial Analyst', 'Finance', 72000.00, '2019-10-16', 'ethan.lewis@example.com', 16, 10, 1985, 'Ethan123!'),
(18, 'Ava', 'Lee', 'PR Specialist', 'Public Relations', 59000.00, '2021-03-01', 'ava.lee@example.com', 1, 3, 1990, 'Ava123!'),
(19, 'Liam', 'Walker', 'Software Architect', 'IT', 110000.00, '2014-12-09', 'liam.walker@example.com', 9, 12, 1983, 'Liam123!'),
(20, 'Amelia', 'Hall', 'Customer Service Manager', 'Customer Service', 64000.00, '2018-04-17', 'amelia.hall@example.com', 17, 4, 1991, 'Amelia123!');
INSERT INTO manager
(manager_id, Fname, Lname, salary, Bday, Bmonth, Byear)
VALUES
(1, 'John', 'Smith', 85000.00, 12, 5, 1980),
(2, 'Jane', 'Doe', 92000.00, 23, 8, 1978),
(3, 'Michael', 'Johnson', 87000.00, 15, 3, 1985),
(4, 'Emily', 'Brown', 89000.00, 7, 6, 1983),
(5, 'Chris', 'Wilson', 91000.00, 29, 11, 1982),
(6, 'Sophia', 'Taylor', 88000.00, 3, 2, 1986),
(7, 'Daniel', 'Moore', 86000.00, 18, 4, 1981),
(8, 'Emma', 'Anderson', 90000.00, 25, 10, 1979),
(9, 'James', 'Thomas', 94000.00, 9, 1, 1987),
(10, 'Olivia', 'Jackson', 87000.00, 14, 7, 1984),
(11, 'Benjamin', 'White', 93000.00, 21, 9, 1980),
(12, 'Mia', 'Harris', 85000.00, 30, 12, 1985),
(13, 'Lucas', 'Martin', 82000.00, 11, 5, 1986),
(14, 'Isabella', 'Garcia', 89000.00, 17, 8, 1983),
(15, 'Alexander', 'Martinez', 95000.00, 4, 3, 1978),
(16, 'Charlotte', 'Rodriguez', 87000.00, 8, 6, 1984),
(17, 'Ethan', 'Lewis', 86000.00, 19, 11, 1982),
(18, 'Ava', 'Lee', 91000.00, 2, 2, 1981),
(19, 'Liam', 'Walker', 94000.00, 26, 10, 1979),
(20, 'Amelia', 'Hall', 85000.00, 13, 1, 1985);
INSERT INTO clients (client_id, first_name,
last_name, contact_information, street, city)
VALUES
(1, 'John', 'Doe', '555-1111', '123 Elm St', 'Springfield'),
(2, 'Jane', 'Smith', '555-2222', '456 Oak St', 'Greenwich'),
(3, 'Sam', 'Johnson', '555-3333', '789 Pine St', 'Riverside'),
(4, 'Alice', 'Brown', '555-4444', '321 Birch St', 'Fairview'),
(5, 'Bob', 'Davis', '555-5555', '654 Cedar St', 'Lakeside'),
(6, 'Charlie', 'Wilson', '555-6666', '987 Maple St', 'Shady Grove'),
(7, 'David', 'Moore', '555-7777', '123 Birch St', 'Sunnydale'),
(8, 'Eva', 'Taylor', '555-8888', '456 Ash St', 'Hillside'),
(9, 'Grace', 'Anderson', '555-9999', '789 Oak St', 'Valley City'),
(10, 'Henry', 'Thomas', '555-1010', '123 Pine St', 'Mountainview'),
(11, 'Ivy', 'Martinez', '555-2020', '456 Maple St', 'Lakewood'),
(12, 'Jack', 'Jackson', '555-3030', '789 Birch St', 'Clearwater'),
(13, 'Karen', 'White', '555-4040', '321 Cedar St', 'Rivertown'),
(14, 'Liam', 'Harris', '555-5050', '654 Pine St', 'Westfield'),
(15, 'Mia', 'Young', '555-6060', '987 Ash St', 'Northfield'),
(16, 'Noah', 'King', '555-7070', '123 Cedar St', 'Brooklyn'),
(17, 'Olivia', 'Scott', '555-8080', '456 Pine St', 'Shawnee'),
(18, 'Paul', 'Adams', '555-9090', '789 Ash St', 'Portland'),
(19, 'Quinn', 'Carter', '555-1112', '321 Oak St', 'Pinehill'),
(20, 'Rachel', 'Mitchell', '555-1122', '654 Oak St', 'Springfield');
INSERT INTO trainings (training_id, training_name,
training_date, training_duration, attendees)
VALUES
(1, 'Leadership Training', '2023-09-01', '2 Days', 20),
(2, 'Project Management', '2023-09-05', '1 Day', 15),
(3, 'Communication Skills', '2023-09-10', '3 Days', 25),
(4, 'Technical Skills', '2023-09-15', '1 Day', 18),
(5, 'Sales Techniques', '2023-09-20', '2 Days', 12),
(6, 'HR Policies', '2023-09-25', '1 Day', 10),
(7, 'Team Building', '2023-10-01', '2 Days', 16),
(8, 'Time Management', '2023-10-05', '1 Day', 14),
(9, 'Customer Service', '2023-10-10', '3 Days', 22),
(10, 'IT Security', '2023-10-15', '2 Days', 19),
(11, 'Product Training', '2023-10-20', '1 Day', 15),
(12, 'Marketing Strategies', '2023-10-25', '2 Days', 13),
(13, 'Negotiation Skills', '2023-11-01', '3 Days', 20),
(14, 'Financial Management', '2023-11-05', '1 Day', 17),
(15, 'Workplace Safety', '2023-11-10', '1 Day', 12),
(16, 'Employee Well-being', '2023-11-15', '2 Days', 14),
(17, 'Client Relations', '2023-11-20', '3 Days', 18),
(18, 'Business Ethics', '2023-11-25', '1 Day', 20),
(19, 'Market Analysis', '2023-12-01', '2 Days', 16),
(20, 'Product Launch Strategies', '2023-12-05', '1 Day', 14);
INSERT INTO leave_requests (leave_no, employee_id,
st_date, end_date, reason, approval_status)
VALUES
(1, 1, '2023-09-01', '2023-09-05', 'Vacation', 'Approved'),
(2, 2, '2023-09-03', '2023-09-07', 'Sick Leave', 'Approved'),
(3, 3, '2023-09-05', '2023-09-09', 'Personal', 'Pending'),
(4, 4, '2023-09-06', '2023-09-10', 'Sick Leave', 'Approved'),
(5, 5, '2023-09-08', '2023-09-12', 'Vacation', 'Pending'),
(6, 6, '2023-09-10', '2023-09-14', 'Personal', 'Approved'),
(7, 7, '2023-09-12', '2023-09-16', 'Sick Leave', 'Pending'),
(8, 8, '2023-09-14', '2023-09-18', 'Vacation', 'Approved'),
(9, 9, '2023-09-15', '2023-09-19', 'Personal', 'Approved'),
(10, 10, '2023-09-17', '2023-09-21', 'Sick Leave', 'Approved'),
(11, 11, '2023-09-19', '2023-09-23', 'Vacation', 'Pending'),
(12, 12, '2023-09-21', '2023-09-25', 'Personal', 'Approved'),
(13, 13, '2023-09-23', '2023-09-27', 'Sick Leave', 'Approved'),
(14, 14, '2023-09-25', '2023-09-29', 'Vacation', 'Pending'),
(15, 15, '2023-09-27', '2023-10-01', 'Sick Leave', 'Approved'),
(16, 16, '2023-09-29', '2023-10-03', 'Vacation', 'Approved'),
(17, 17, '2023-10-01', '2023-10-05', 'Personal', 'Pending'),
(18, 18, '2023-10-03', '2023-10-07', 'Sick Leave', 'Approved'),
(19, 19, '2023-10-05', '2023-10-09', 'Vacation', 'Approved'),
(20, 19, '2023-10-07', '2023-10-11', 'Personal', 'Pending');
INSERT INTO suppliers (supplier_id, supplier_name,
contact_information, products_supplied)
VALUES
(1, 'Tech Supply Co.', '555-1234', 'Computers, Electronics'),
(2, 'Furniture Depot', '555-2345', 'Office Furniture'),
(3, 'Office Supplies Ltd.', '555-3456', 'Office Supplies, Stationery'),
(4, 'ElectroFix', '555-4567', 'Repair Services, Electronics'),
(5, 'Design World', '555-5678', 'Design Software, Equipment'),
(6, 'Marketing Partners', '555-6789', 'Marketing Services'),
(7, 'FoodCo', '555-7890', 'Catering Services'),
(8, 'Paper Goods Inc.', '555-8901', 'Paper Products, Stationery'),
(9, 'Office Chairs Inc.', '555-9012', 'Chairs, Tables'),
(10, 'Tech Innovations', '555-1122', 'Gadgets, Software'),
(11, 'EcoSupply', '555-2233', 'Sustainable Products'),
(12, 'Print Masters', '555-3344', 'Printing Services'),
(13, 'Furniture World', '555-4455', 'Furniture, Desks'),
(14, 'Data Solutions', '555-5566', 'Data Solutions, Storage'),
(15, 'EcoTech', '555-6677', 'Green Technology'),
(16, 'Security Systems', '555-7788', 'Security Equipment'),
(17, 'Global Office', '555-8899', 'Office Supplies, Office Furniture'),
(18, 'Design Studio', '555-9900', 'Design Services'),
(19, 'EventPlanners', '555-1234', 'Event Services, Catering'),
(20, 'Mobile Solutions', '555-5432', 'Mobile Devices');
INSERT INTO assets (asset_id, asset_name, asset_type,
asset_value, assigned_department)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'IT'),
(2, 'Office Chair', 'Furniture', 250.00, 'HR'),
(3, 'Projector', 'Electronics', 500.00, 'Sales'),
(4, 'Monitor', 'Electronics', 300.00, 'IT'),
(5, 'Table', 'Furniture', 150.00, 'Design'),
(6, 'Printer', 'Electronics', 350.00, 'Admin'),
(7, 'Desk', 'Furniture', 200.00, 'Finance'),
(8, 'Whiteboard', 'Furniture', 100.00, 'Marketing'),
(9, 'Router', 'Electronics', 120.00, 'IT'),
(10, 'Smartphone', 'Electronics', 800.00, 'Sales'),
(11, 'Keyboard', 'Electronics', 50.00, 'IT'),
(12, 'Filing Cabinet', 'Furniture', 300.00, 'Admin'),
(13, 'Speaker System', 'Electronics', 600.00, 'Sales'),
(14, 'Conference Table', 'Furniture', 1200.00, 'HR'),
(15, 'Camera', 'Electronics', 700.00, 'Design'),
(16, 'Phone System', 'Electronics', 400.00, 'Admin'),
(17, 'TV', 'Electronics', 1000.00, 'HR'),
(18, 'Scanner', 'Electronics', 250.00, 'Admin'),
(19, 'Projector Screen', 'Electronics', 300.00, 'Marketing'),
(20, 'Microwave', 'Appliance', 150.00, 'IT');
INSERT INTO attendence (attendence_time, employee_id, attendence_date, check_in_time, check_out_time, employee_name)
VALUES
(1, 1, '2023-10-01', '09:00:00', '17:00:00', 'John'),
(2, 2, '2023-10-01', '09:15:00', '17:15:00', 'Bob'),
(3, 3, '2023-10-01', '08:45:00', '17:05:00', 'Carol'),
(4, 4, '2023-10-01', '09:30:00', '17:00:00', 'David'),
(5, 5, '2023-10-01', '08:50:00', '17:10:00', 'Emma'),
(6, 6, '2023-10-01', '09:05:00', '17:00:00', 'Frank'),
(7, 7, '2023-10-01', '08:40:00', '17:00:00', 'Grace'),
(8, 8, '2023-10-01', '09:00:00', '17:15:00', 'Henry'),
(9, 9, '2023-10-01', '09:00:00', '17:00:00', 'Irene'),
(10, 10, '2023-10-01', '08:55:00', '17:00:00', 'Jack'),
(11, 11, '2023-10-01', '09:10:00', '17:10:00', 'Karen'),
(12, 12, '2023-10-01', '08:45:00', '17:05:00', 'Larry'),
(13, 13, '2023-10-01', '09:00:00', '17:00:00', 'Mona'),
(14, 14, '2023-10-01', '08:55:00', '17:00:00', 'Nina'),
(15, 15, '2023-10-01', '09:00:00', '17:30:00', 'Oscar'),
(16, 16, '2023-10-01', '08:50:00', '17:05:00', 'Paula'),
(17, 17, '2023-10-01', '09:00:00', '17:00:00', 'Quincy'),
(18, 18, '2023-10-01', '09:00:00', '17:05:00', 'Rachel'),
(19, 19, '2023-10-01', '08:55:00', '17:15:00', 'Steve'),
(20, 19, '2023-10-01', '09:00:00', '17:00:00', 'Steve');
INSERT INTO tasks (task_no, task_name,
assigned_employee_id, due_date, stat)
VALUES
(1, 'Task A', 1, '2023-12-01', 'Completed'),
(2, 'Task B', 2, '2023-11-20', 'In Pro'),
(3, 'Task C', 3, '2023-10-15', 'Completed'),
(4, 'Task D', 4, '2023-11-30', 'In Pro'),
(5, 'Task E', 5, '2023-12-05', 'Completed'),
(6, 'Task F', 6, '2023-09-25', 'In Pro'),
(7, 'Task G', 7, '2023-10-10', 'Completed'),
(8, 'Task H', 8, '2023-11-05', 'In Pro'),
(9, 'Task I', 9, '2023-10-20', 'Completed'),
(10, 'Task J', 10, '2023-12-15', 'In Pro'),
(11, 'Task K', 11, '2023-11-25', 'Completed'),
(12, 'Task L', 12, '2023-10-01', 'In Pro'),
(13, 'Task M', 13, '2023-11-15', 'Completed'),
(14, 'Task N', 14, '2023-09-30', 'In Pro'),
(15, 'Task O', 15, '2023-12-10', 'Completed'),
(16, 'Task P', 16, '2023-11-12', 'In Pro'),
(17, 'Task Q', 17, '2023-10-05', 'Completed'),
(18, 'Task R', 18, '2023-11-18', 'In Pro'),
(19, 'Task S', 19, '2023-12-20', 'Completed'),
(20, 'Task T', 20, '2023-09-20', 'In Pro');
INSERT INTO salaries (salary_id, salary_paid,
bonuses, mon, employee_id)
VALUES
(1, 55000.00, 5000.00, '2023-01-01', 1),
(2, 45000.00, 4000.00, '2023-01-01', 2),
(3, 60000.00, 3000.00, '2023-01-01', 3),
(4, 65000.00, 2000.00, '2023-01-01', 4),
(5, 50000.00, 1000.00, '2023-01-01', 5),
(6, 48000.00, 2500.00, '2023-01-01', 6),
(7, 55000.00, 3000.00, '2023-01-01', 7),
(8, 52000.00, 1500.00, '2023-01-01', 8),
(9, 45000.00, 3500.00, '2023-01-01', 9),
(10, 70000.00, 2500.00, '2023-01-01', 10), (11,
47000.00, 1000.00, '2023-01-01', 11),
(12, 65000.00, 4000.00, '2023-01-01', 12),
(13, 75000.00, 5000.00, '2023-01-01', 13),
(14, 54000.00, 3000.00, '2023-01-01', 14),
(15, 43000.00, 1500.00, '2023-01-01', 15),
(16, 62000.00, 3500.00, '2023-01-01', 16),
(17, 59000.00, 2500.00, '2023-01-01', 17),
(18, 45000.00, 2000.00, '2023-01-01', 18),
(19, 80000.00, 5000.00, '2023-01-01', 19),
(20, 47000.00, 1200.00, '2023-01-01', 19);
INSERT INTO departments (department_id,
manager_id, no_of_employees, department_name)
VALUES
(1, 1, 5, 'HR'),
(2, 3, 6, 'IT'),
(3, 5, 4, 'Design'),
(4, 10, 8, 'Sales'),
(5, 12, 7, 'Marketing'),
(6, 13, 9, 'Operations'),
(7, 6, 3, 'Finance'),
(8, 11, 5, 'Customer Service'),
(9, 4, 10, 'R&D'),
(10, 7, 3, 'Legal'),
(11, 2, 4, 'Purchasing'),
(12, 14, 6, 'Logistics'),
(13, 8, 5, 'Admin'),
(14, 9, 2, 'Compliance'),
(15, 15, 10, 'Security'),
(16, 17, 7, 'Business Development'),
(17, 18, 3, 'Operations Support'),
(18, 19, 4, 'Partnerships'),
(19, 20, 2, 'Events'),
(20, 3, 6, 'Public Relations');
INSERT INTO projects (project_id, project_name,
st_date, end_date, department_id, budget)
VALUES
(1, 'Project A', '2023-01-10', '2023-12-31', 1, 100000.00),
(2, 'Project B', '2023-05-15', '2024-05-15', 2, 250000.00),
(3, 'Project C', '2023-02-20', '2023-11-30', 3, 150000.00),
(4, 'Project D', '2023-04-05', '2024-04-05', 4, 200000.00),
(5, 'Project E', '2023-06-25', '2024-06-25', 5, 180000.00),
(6, 'Project F', '2023-08-10', '2024-08-10', 6, 120000.00),
(7, 'Project G', '2023-07-01', '2024-01-01', 7, 300000.00),
(8, 'Project H', '2023-09-15', '2024-03-15', 8, 50000.00),
(9, 'Project I', '2023-10-25', '2024-05-25', 9, 220000.00),
(10, 'Project J', '2023-03-18', '2023-09-18', 10, 85000.00),
(11, 'Project K', '2023-01-01', '2023-12-31', 11, 95000.00),
(12, 'Project L', '2023-02-10', '2023-08-10', 12, 110000.00),
(13, 'Project M', '2023-07-20', '2024-07-20', 13, 160000.00),
(14, 'Project N', '2023-04-05', '2023-12-05', 14, 300000.00),
(15, 'Project O', '2023-05-10', '2024-05-10', 15, 140000.00),
(16, 'Project P', '2023-06-15', '2023-12-15', 16, 200000.00),
(17, 'Project Q', '2023-09-01', '2024-03-01', 17, 250000.00),
(18, 'Project R', '2023-11-10', '2024-05-10', 18, 170000.00), (19,
'Project S', '2023-08-01', '2024-01-01', 19, 210000.00),
(20, 'Project T', '2023-05-05', '2024-05-05', 20, 190000.00);
INSERT INTO phone_no (phone_no, employee_id,
manager_id)
VALUES
(12345678,1,1),
(23456789,2,2),
(34567890,3,3),
(45678901,4,4),
(56789012,5,5),
(67890123,6,6),
(78901234,7,7),
(89012345,8,8),
(90123456,9,9),
(11223344,10,10),
(22334455,11,11),
(33445566,12,12),
(44556677,13,13),
(55667788,14,14),
(66778899,15,15),
(77889900,16,16),
(88990011,17,17),
(99001122,18,18),
(10111223,19,19),
(21222333,19,19);
INSERT INTO products
(product_no, price, product_name, description)
VALUES
(1, 49.99, 'Wireless Mouse', 'Ergonomic design for easy use'),
(2, 29.99, 'Keyboard', 'Mechanical with RGB lighting'),
(3, 799.99, 'Laptop', 'High performance for work and play'),
(4, 199.99, 'Monitor', '27-inch, 4K Ultra HD display'),
(5, 99.99, 'Smartphone', 'Budget-friendly and reliable'),
(6, 249.99, 'Headphones', 'Noise-canceling over-ear design'),
(7, 399.99, 'Tablet', 'Compact and lightweight for travel'),
(8, 15.99, 'USB-C Cable', 'Durable and fast charging'),
(9, 89.99, 'Webcam', 'Full HD 1080p video quality'),
(10, 69.99, 'Portable Speaker', 'Bluetooth with deep bass'),
(11, 149.99, 'Smartwatch', 'Track fitness and notifications'),
(12, 19.99, 'Mouse Pad', 'Large size with smooth surface'),
(13, 119.99, 'External SSD', '1TB storage with fast speeds'),
(14, 34.99, 'Phone Case', 'Shockproof and stylish'),
(15, 299.99, 'Gaming Console', 'Next-gen performance'),
(16, 22.99, 'HDMI Cable', 'Supports 4K resolution'),
(17, 179.99, 'Office Chair', 'Ergonomic with lumbar support'),
(18, 49.99, 'Desk Lamp', 'LED with adjustable brightness'),
(19, 529.99, 'Desktop PC', 'Powerful for gaming and editing'),
(20, 12.99, 'Power Bank', '10,000mAh for on-the-go charging');
INSERT INTO employee_review (performance,
employee_id)
VALUES
('Excellent', 1),
('Good', 2),
('Outstanding', 3),
('Average', 4),
('Excellent', 5),
('Good', 6),
('Average', 7),
('Outstanding', 8),
('Good', 9),
('Excellent', 10),
('Average', 11),
('Good', 12),
('Excellent', 13),
('Outstanding', 14),
('Average', 15),
('Good', 16),
('Excellent', 17),
('Outstanding', 18),
('Average', 19),
('Good', 19);
INSERT INTO complaints (complaint_id, employee_id,
client_id, complaint_date, description, stat, resolution_date)
VALUES
(1, 1, 1, '2023-09-01', 'Late delivery', 'Resolved', '2023-09-02'),
(2, 2, 2, '2023-09-03', 'Poor customer service', 'Pending', '2023-09-02'),
(3, 3, 3, '2023-09-05', 'Product defect', 'Resolved', '2023-09-06'),
(4, 4, 4, '2023-09-07', 'Incorrect invoice', 'Resolved', '2023-09-08'),
(5, 5, 5, '2023-09-09', 'Delay in response', 'Pending', '2023-09-08'),
(6, 6, 6, '2023-09-11', 'Late shipping', 'Resolved', '2023-09-12'),
(7, 7, 7, '2023-09-13', 'Missing parts', 'Resolved', '2023-09-14'),
(8, 8, 8, '2023-09-15', 'Product not as described', 'Pending', '2023-09-14'),
(9, 9, 9, '2023-09-17', 'Wrong item received', 'Resolved', '2023-09-18'),
(10, 10, 10, '2023-09-19', 'Late response to query', 'Pending', '2023-09-18'),
(11, 11, 11, '2023-09-21', 'Bad customer experience', 'Resolved', '2023-09-22'),
(12, 12, 12, '2023-09-23', 'Poor packaging', 'Resolved', '2023-09-24'),
(13, 13, 13, '2023-09-25', 'Overcharged for service', 'Pending', '2023-09-24'),
(14, 14, 14, '2023-09-27', 'No follow-up on issue', 'Resolved', '2023-09-28'),
(15, 15, 15, '2023-09-29', 'Service quality decline', 'Pending', '2023-09-28'),
(16, 16, 16, '2023-10-01', 'Not receiving updates', 'Resolved', '2023-10-02'),
(17, 17, 17, '2023-10-03', 'Unresponsive support team', 'Pending', '2023-10-02'),
(18, 18, 18, '2023-10-05', 'Faulty product', 'Resolved', '2023-10-06'),
(19, 19, 19, '2023-10-07', 'Delayed order delivery', 'Pending', '2023-10-06'),
(20, 19, 19, '2023-10-09', 'Broken product on arrival', 'Resolved', '2023-10-10');
INSERT INTO  invoices (invoice_id, supplier_id,
invoice_date, invoice_amount, payment_status)
VALUES
(1, 1, '2023-09-01', 15000.00, 'Paid'),
(2, 2, '2023-09-05', 3500.00, 'Paid'),
(3, 3, '2023-09-10', 2000.00, 'Pending'),
(4, 4, '2023-09-15', 800.00, 'Paid'),
(5, 5, '2023-09-20', 3000.00, 'Pending'),
(6, 6, '2023-09-25', 6000.00, 'Paid'),
(7, 7, '2023-09-30', 1200.00, 'Pending'),
(8, 8, '2023-10-01', 1500.00, 'Paid'),
(9, 9, '2023-10-05', 2000.00, 'Pending'),
(10, 10, '2023-10-10', 1800.00, 'Paid'),
(11, 11, '2023-10-15', 3500.00, 'Pending'),
(12, 12, '2023-10-20', 1200.00, 'Paid'),
(13, 13, '2023-10-25', 5000.00, 'Pending'),
(14, 14, '2023-10-30', 2500.00, 'Paid'),
(15, 15, '2023-11-01', 7500.00, 'Paid'),
(16, 16, '2023-11-05', 9000.00, 'Pending'),
(17, 17, '2023-11-10', 5500.00, 'Paid'),
(18, 18, '2023-11-15', 1200.00, 'Paid'),
(19, 19, '2023-11-20', 4300.00, 'Pending'),
(20, 19, '2023-11-25', 6000.00, 'Paid');
INSERT INTO purchase_order
(order_no, quantity, purchase_order_date, product_no, supplier_id)
VALUES
(1, 100, '2024-01-10', 1, 1),
(2, 200, '2024-01-12', 2, 2),
(3, 50, '2024-01-15', 3, 3),
(4, 150, '2024-01-18', 4, 4),
(5, 75, '2024-01-20', 5, 5),
(6, 300, '2024-01-22', 6, 6),
(7, 120, '2024-01-25', 7, 7),
(8, 400, '2024-01-27', 8, 8),
(9, 90, '2024-01-30', 9, 9),
(10, 180, '2024-02-01', 10, 10),
(11, 250, '2024-02-05', 11, 11),
(12, 110, '2024-02-07', 12, 12),
(13, 220, '2024-02-10', 13, 13),
(14, 330, '2024-02-12', 14, 14),
(15, 140, '2024-02-14', 15, 15),
(16, 310, '2024-02-17', 16, 16),
(17, 170, '2024-02-19', 17, 17),
(18, 450, '2024-02-22', 18, 18), (19,
95, '2024-02-25', 19, 19),
(20, 200, '2024-02-28', 20, 20);
INSERT INTO meetings
(meeting_id, agenda, meeting_date, meeting_time, participants,project_id) VALUES
(1, 'Budgeting', '2024-01-10', '10:00:00', 5, 1),
(2, 'Team Update', '2024-01-12', '14:00:00', 10, 2),
(3, 'Client Meeting', '2024-01-15', '09:30:00', 3, 3),
(4, 'Project Planning', '2024-01-18', '11:00:00', 8, 4),
(5, 'Design Review', '2024-01-20', '15:00:00', 6, 5),
(6, 'Sales Strategy', '2024-01-22', '13:00:00', 7, 6),
(7, 'Quarterly Review', '2024-01-25', '16:00:00', 12, 7),
(8, 'HR Policy', '2024-01-27', '10:30:00', 4, 8),
(9, 'Marketing Ideas', '2024-01-30', '11:30:00', 9, 9),
(10, 'Tech Updates', '2024-02-01', '14:30:00', 15, 10),
(11, 'Legal Advice', '2024-02-05', '09:00:00', 2, 11),
(12, 'Customer Feedback', '2024-02-07', '10:45:00', 8, 12),
(13, 'PR Campaign', '2024-02-10', '15:15:00', 6, 13),
(14, 'Operational Review', '2024-02-12', '13:30:00', 10, 14),
(15, 'Financial Goals', '2024-02-14', '12:00:00', 5, 15),
(16, 'Design Updates', '2024-02-17', '14:15:00', 8, 16),
(17, 'Product Demo', '2024-02-19', '10:30:00', 3, 17),
(18, 'Recruitment Plans', '2024-02-22', '16:45:00', 7, 18),
(19, 'System Upgrade', '2024-02-25', '11:15:00', 6, 19),
(20, 'Annual Planning', '2024-02-28', '09:00:00', 20, 19);
select employees.employee_id,manager_id from
employees join
manager on
employee_id=manager_id;
SELECT DISTINCT Fname
FROM employees
WHERE Fname IN (
 SELECT DISTINCT Fname
 FROM manager
);
SELECT salary_paid, SUM(salary_paid + bonuses) AS total
FROM salaries
WHERE bonuses > 2000.00
GROUP BY salary_paid
HAVING SUM(salary_paid + bonuses) > 85000.00;
SELECT salary_paid, SUM(salary_paid + bonuses) AS total
FROM salaries
WHERE (bonuses > 2000.00)
GROUP BY (salary_paid);
select (salary*0.05) as
interest
from employees; select agenda
from meetings
order by agenda, meeting_id desc;
select employee_id, Fname from employees;
select count(*) from employees where Bday>10;
select min(quantity) from purchase_order;
select avg(salary) from employees;
UPDATE invoices
SET invoice_date = '2024-09-01'
WHERE invoice_id = 1;
select department_name from departments where
department_name like '%e%';
select * from employees
where salary =(select max(salary) from employees); 

