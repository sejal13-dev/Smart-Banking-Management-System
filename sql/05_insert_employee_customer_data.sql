/*
=========================================================
Project : Smart Banking Management System
File    : 05_insert_employee_customer_data.sql
=========================================================
*/

USE smart_banking_system;
INSERT INTO Employees
(
employee_code,
branch_id,
first_name,
last_name,
gender,
date_of_birth,
email,
phone,
designation,
hire_date,
salary
)
VALUES

('EMP001',1,'Rahul','Sharma','MALE','1990-05-12','rahul.sharma@smartbank.com','9876500001','Branch Manager','2018-01-15',85000),

('EMP002',1,'Priya','Singh','FEMALE','1994-07-20','priya.singh@smartbank.com','9876500002','Cashier','2020-06-10',42000),

('EMP003',2,'Amit','Verma','MALE','1991-11-11','amit.verma@smartbank.com','9876500003','Loan Officer','2019-09-18',60000),

('EMP004',2,'Sneha','Patel','FEMALE','1995-02-05','sneha.patel@smartbank.com','9876500004','Customer Support','2021-03-01',38000),

('EMP005',3,'Karan','Mehta','MALE','1988-12-18','karan.mehta@smartbank.com','9876500005','Relationship Manager','2017-08-25',72000),

('EMP006',4,'Neha','Gupta','FEMALE','1993-09-09','neha.gupta@smartbank.com','9876500006','Assistant Manager','2019-05-30',65000),

('EMP007',5,'Rohit','Joshi','MALE','1992-01-14','rohit.joshi@smartbank.com','9876500007','Auditor','2018-04-20',70000);

INSERT INTO Employee_Roles
(
employee_id,
role_id
)
VALUES

(1,1),

(2,3),

(3,4),

(4,6),

(5,5),

(6,2),

(7,7);

INSERT INTO Customers
(
customer_code,
first_name,
last_name,
gender,
date_of_birth,
email,
phone,
aadhaar_number,
pan_number,
address_line1,
city,
state,
pincode
)
VALUES

('CUS001','Aarav','Sharma','MALE','1998-01-12','aarav@gmail.com','9876600001','123456789012','ABCDE1234F','MG Road','Bengaluru','Karnataka','560001'),

('CUS002','Ananya','Patel','FEMALE','1997-03-20','ananya@gmail.com','9876600002','123456789013','ABCDE1234G','Whitefield','Bengaluru','Karnataka','560066'),

('CUS003','Vihaan','Gupta','MALE','1994-05-18','vihaan@gmail.com','9876600003','123456789014','ABCDE1234H','Electronic City','Bengaluru','Karnataka','560100'),

('CUS004','Diya','Verma','FEMALE','1996-09-08','diya@gmail.com','9876600004','123456789015','ABCDE1234J','Koramangala','Bengaluru','Karnataka','560034'),

('CUS005','Arjun','Mehta','MALE','1995-07-22','arjun@gmail.com','9876600005','123456789016','ABCDE1234K','Indiranagar','Bengaluru','Karnataka','560038');

INSERT INTO KYC
(
customer_id,
aadhaar_verified,
pan_verified,
kyc_status,
verification_date,
verified_by
)
VALUES

(1,TRUE,TRUE,'VERIFIED','2024-01-10',1),

(2,TRUE,TRUE,'VERIFIED','2024-01-12',1),

(3,TRUE,TRUE,'VERIFIED','2024-02-01',3),

(4,TRUE,FALSE,'PENDING',NULL,NULL),

(5,TRUE,TRUE,'VERIFIED','2024-02-15',6);

INSERT INTO Nominees
(
customer_id,
nominee_name,
relationship,
date_of_birth,
phone,
address
)
VALUES

(1,'Sunita Sharma','Mother','1975-06-15','9876700001','Bengaluru'),

(2,'Raj Patel','Father','1970-09-12','9876700002','Ahmedabad'),

(3,'Riya Gupta','Sister','2000-05-18','9876700003','Delhi'),

(4,'Amit Verma','Brother','1993-03-21','9876700004','Pune'),

(5,'Anjali Mehta','Spouse','1996-10-11','9876700005','Mumbai');