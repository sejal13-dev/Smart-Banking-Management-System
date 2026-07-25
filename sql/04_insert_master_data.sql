/*
=========================================================
Project : Smart Banking Management System
File    : 04_insert_master_data.sql
Author  : Sejal Priya
Version : 1.0

Description:
Insert master data into reference tables.
=========================================================
*/

USE smart_banking_system;
/*=========================================================
INSERT INTO Branches
=========================================================*/

INSERT INTO Branches
(
    branch_code,
    branch_name,
    ifsc_code,
    address_line1,
    address_line2,
    city,
    state,
    pincode,
    phone,
    email
)
VALUES
('BR001','MG Road Branch','SBIN0001001','MG Road','Near Metro Station','Bengaluru','Karnataka','560001','08022221111','mgroad@smartbank.com'),

('BR002','Whitefield Branch','SBIN0001002','ITPL Main Road','Whitefield','Bengaluru','Karnataka','560066','08022222222','whitefield@smartbank.com'),

('BR003','Electronic City Branch','SBIN0001003','Phase 1','Electronic City','Bengaluru','Karnataka','560100','08022223333','ecity@smartbank.com'),

('BR004','Koramangala Branch','SBIN0001004','80 Feet Road','Koramangala','Bengaluru','Karnataka','560034','08022224444','koramangala@smartbank.com'),

('BR005','Indiranagar Branch','SBIN0001005','100 Feet Road','Indiranagar','Bengaluru','Karnataka','560038','08022225555','indiranagar@smartbank.com');

/*=========================================================
INSERT INTO Roles
=========================================================*/

INSERT INTO Roles
(
    role_name,
    role_description
)
VALUES
('Branch Manager','Manages complete branch operations'),

('Assistant Manager','Assists branch manager'),

('Cashier','Handles cash transactions'),

('Loan Officer','Processes loan applications'),

('Relationship Manager','Manages premium customers'),

('Customer Support','Handles customer queries'),

('Auditor','Performs internal audits');

/*=========================================================
INSERT INTO Account_Types
=========================================================*/

INSERT INTO Account_Types
(
    account_type_name,
    minimum_balance,
    interest_rate,
    description
)
VALUES
('Savings',1000,3.50,'Regular savings account'),

('Current',10000,0.00,'Business current account'),

('Salary',0,3.00,'Salary account'),

('Fixed Deposit',5000,6.80,'Fixed deposit account'),

('Recurring Deposit',1000,6.20,'Recurring deposit account');

/*=========================================================
INSERT INTO Card_Types
=========================================================*/

INSERT INTO Card_Types
(
    card_type_name,
    annual_fee,
    daily_withdrawal_limit,
    description
)
VALUES
('Debit Card',250,50000,'Standard debit card'),

('Credit Card',1000,100000,'Credit card'),

('RuPay Platinum',500,75000,'RuPay premium card'),

('Visa Platinum',750,100000,'Visa premium card');

/*=========================================================
INSERT INTO Loan_Types
=========================================================*/

INSERT INTO Loan_Types
(
    loan_type_name,
    minimum_amount,
    maximum_amount,
    interest_rate,
    maximum_tenure_months,
    description
)
VALUES
('Home Loan',500000,10000000,8.50,360,'Housing loan'),

('Car Loan',100000,3000000,9.25,84,'Vehicle loan'),

('Education Loan',50000,5000000,8.00,180,'Education loan'),

('Personal Loan',50000,2000000,11.50,60,'Personal finance'),

('Gold Loan',10000,5000000,7.75,36,'Loan against gold');

/*=========================================================
INSERT INTO Transaction_Types
=========================================================*/

INSERT INTO Transaction_Types
(
    transaction_type_name,
    description
)
VALUES
('Deposit','Cash or cheque deposit'),

('Withdrawal','Cash withdrawal'),

('Transfer','Account to account transfer'),

('UPI','Unified Payments Interface'),

('NEFT','National Electronic Funds Transfer'),

('RTGS','Real Time Gross Settlement'),

('IMPS','Immediate Payment Service');