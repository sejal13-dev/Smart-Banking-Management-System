/*=========================================================
                EMPLOYEE DATA
=========================================================*/

INSERT INTO Employees
(
branch_id,
first_name,
last_name,
gender,
date_of_birth,
phone,
email,
hire_date,
salary,
employee_status
)
VALUES

(1,'Rahul','Sharma','MALE','1985-06-15',
'9876500001',
'rahul.sharma@smartbank.com',
'2015-04-01',
85000,
'ACTIVE'),

(2,'Priya','Verma','FEMALE','1990-02-20',
'9876500002',
'priya.verma@smartbank.com',
'2018-01-15',
55000,
'ACTIVE'),

(3,'Amit','Patel','MALE','1988-09-10',
'9876500003',
'amit.patel@smartbank.com',
'2017-07-11',
60000,
'ACTIVE'),

(4,'Sneha','Rao','FEMALE','1992-12-05',
'9876500004',
'sneha.rao@smartbank.com',
'2019-09-01',
52000,
'ACTIVE'),

(5,'Karan','Singh','MALE','1987-03-11',
'9876500005',
'karan.singh@smartbank.com',
'2016-06-21',
65000,
'ACTIVE');

/*=========================================================
                EMPLOYEE ROLES
=========================================================*/

INSERT INTO Employee_Roles
(
employee_id,
role_id,
assigned_date
)
VALUES

(1,1,'2015-04-01'),

(2,2,'2018-01-15'),

(3,4,'2017-07-11'),

(4,3,'2019-09-01'),

(5,5,'2016-06-21');

/*=========================================================
                CUSTOMER DATA
=========================================================*/

INSERT INTO Customers
(
first_name,
last_name,
gender,
date_of_birth,
phone,
email,
address,
city,
state,
pincode,
customer_status
)
VALUES

('Arjun','Mehta','MALE',
'1995-05-20',
'9876600001',
'arjun@gmail.com',
'12 MG Road',
'Bangalore',
'Karnataka',
'560001',
'ACTIVE'),

('Neha','Sharma','FEMALE',
'1996-08-15',
'9876600002',
'neha@gmail.com',
'45 Indiranagar',
'Bangalore',
'Karnataka',
'560038',
'ACTIVE'),

('Rohan','Patil','MALE',
'1992-04-11',
'9876600003',
'rohan@gmail.com',
'Whitefield',
'Bangalore',
'Karnataka',
'560066',
'ACTIVE'),

('Anjali','Reddy','FEMALE',
'1997-12-08',
'9876600004',
'anjali@gmail.com',
'Electronic City',
'Bangalore',
'Karnataka',
'560100',
'ACTIVE'),

('Vikram','Joshi','MALE',
'1994-01-25',
'9876600005',
'vikram@gmail.com',
'Mysore',
'Mysore',
'Karnataka',
'570001',
'ACTIVE');

/*=========================================================
                    KYC DATA
=========================================================*/

INSERT INTO KYC
(
customer_id,
aadhaar_number,
pan_number,
document_verified,
verification_date,
verified_by
)
VALUES

(1,'123456789001','ABCDE1234F',TRUE,'2024-01-10',1),

(2,'123456789002','ABCDE1235G',TRUE,'2024-01-12',1),

(3,'123456789003','ABCDE1236H',TRUE,'2024-01-15',1),

(4,'123456789004','ABCDE1237J',TRUE,'2024-01-17',1),

(5,'123456789005','ABCDE1238K',TRUE,'2024-01-18',1);

/*=========================================================
                NOMINEE DATA
=========================================================*/

INSERT INTO Nominees
(
customer_id,
nominee_name,
relationship,
date_of_birth,
phone
)
VALUES

(1,'Sunita Mehta','Mother','1970-05-11','9877700001'),

(2,'Raj Sharma','Father','1968-11-02','9877700002'),

(3,'Pooja Patil','Wife','1993-04-17','9877700003'),

(4,'Ramesh Reddy','Father','1965-09-20','9877700004'),

(5,'Suman Joshi','Mother','1971-07-10','9877700005');


SELECT COUNT(*) FROM Employees;

SELECT COUNT(*) FROM Employee_Roles;

SELECT COUNT(*) FROM Customers;

SELECT COUNT(*) FROM KYC;

SELECT COUNT(*) FROM Nominees;