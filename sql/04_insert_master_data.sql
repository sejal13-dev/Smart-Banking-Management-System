/*
=========================================================
Project : Smart Banking Management System
File    : 04_insert_master_data.sql
Author  : Sejal Priya
Version : 1.0

Description:
Insert all master/reference data.

=========================================================
*/

USE smart_banking_system;





/*=========================================================
                ROLES MASTER DATA
=========================================================*/

INSERT INTO Roles
(role_name, description)
VALUES
('Branch Manager','Manages complete branch operations'),
('Cashier','Handles deposits and withdrawals'),
('Customer Service Executive','Customer account services'),
('Loan Officer','Processes customer loans'),
('Accountant','Maintains bank accounts'),
('Auditor','Audits banking transactions'),
('Relationship Manager','Handles premium customers'),
('System Administrator','Manages banking software');





/*=========================================================
                BRANCH MASTER DATA
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
(
'BR001',
'Head Office',
'SBIN0001001',
'MG Road',
'Near City Mall',
'Bangalore',
'Karnataka',
'560001',
'9876543210',
'headoffice@smartbank.com'
),

(
'BR002',
'Indiranagar Branch',
'SBIN0001002',
'100 Feet Road',
'Indiranagar',
'Bangalore',
'Karnataka',
'560038',
'9876543211',
'indiranagar@smartbank.com'
),

(
'BR003',
'Whitefield Branch',
'SBIN0001003',
'ITPL Main Road',
'Whitefield',
'Bangalore',
'Karnataka',
'560066',
'9876543212',
'whitefield@smartbank.com'
),

(
'BR004',
'Electronic City Branch',
'SBIN0001004',
'Phase 1',
'Electronic City',
'Bangalore',
'Karnataka',
'560100',
'9876543213',
'ecity@smartbank.com'
),

(
'BR005',
'Mysore Branch',
'SBIN0001005',
'Sayyaji Rao Road',
'Central Mysore',
'Mysore',
'Karnataka',
'570001',
'9876543214',
'mysore@smartbank.com'
);





/*=========================================================
            ACCOUNT TYPES MASTER DATA
=========================================================*/

INSERT INTO Account_Types
(
account_type_name,
minimum_balance,
interest_rate
)
VALUES
('Savings',1000,3.50),
('Current',5000,0.00),
('Salary',0,3.00),
('Fixed Deposit',10000,6.80);





/*=========================================================
                CARD TYPES MASTER DATA
=========================================================*/

INSERT INTO Card_Types
(
card_name,
annual_fee,
daily_limit
)
VALUES
('Debit Card',250,50000),
('Credit Card',1000,200000),
('Platinum Credit Card',2500,500000);





/*=========================================================
                LOAN TYPES MASTER DATA
=========================================================*/

INSERT INTO Loan_Types
(
loan_name,
interest_rate,
max_tenure_months
)
VALUES
('Home Loan',8.50,360),
('Car Loan',9.25,84),
('Education Loan',8.10,180),
('Personal Loan',11.50,60),
('Gold Loan',7.75,36);





/*=========================================================
            TRANSACTION TYPES MASTER DATA
=========================================================*/

INSERT INTO Transaction_Types
(
transaction_name,
description
)
VALUES
('Deposit','Cash or cheque deposit'),
('Withdrawal','Cash withdrawal'),
('Fund Transfer','Account to account transfer'),
('UPI','UPI Payment'),
('NEFT','National Electronic Fund Transfer'),
('RTGS','Real Time Gross Settlement'),
('IMPS','Immediate Payment Service'),
('ATM Withdrawal','ATM Cash Withdrawal');



