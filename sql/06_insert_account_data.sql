/*
=========================================================
Project : Smart Banking Management System
File    : 06_insert_account_data.sql
Author  : Sejal Priya
Version : 1.0

Description:
Inserts account related operational data.

Tables

1. Accounts
2. Account_Holders
3. Beneficiaries
4. Transactions
5. Cards

=========================================================
*/

USE smart_banking_system;

-- =====================================================
-- ACCOUNTS
-- =====================================================

INSERT INTO Accounts
(
account_number,
account_type_id,
branch_id,
opening_balance,
current_balance,
account_status,
opened_on
)
VALUES

('SB1000001',1,1,5000,8500,'ACTIVE','2024-01-15'),

('SB1000002',2,2,15000,18000,'ACTIVE','2024-02-01'),

('SB1000003',3,3,25000,28000,'ACTIVE','2024-02-20'),

('SB1000004',1,4,7000,6200,'ACTIVE','2024-03-05'),

('SB1000005',4,5,100000,110000,'ACTIVE','2024-03-18'),

('SB1000006',2,1,30000,29500,'ACTIVE','2024-04-01'),

('SB1000007',3,2,40000,42000,'ACTIVE','2024-04-15'),

('SB1000008',1,3,10000,9500,'ACTIVE','2024-05-01'),

('SB1000009',2,4,60000,58000,'ACTIVE','2024-05-20'),

('SB1000010',4,5,150000,155000,'ACTIVE','2024-06-01');

/*=========================================================
TABLE : Account_Holders
=========================================================*/

/*=========================================================
TABLE : Account_Holders
=========================================================*/

INSERT INTO Account_Holders
(
account_id,
customer_id,
holder_type,
added_on
)
VALUES

(1,1,'PRIMARY','2024-01-15'),

(2,2,'PRIMARY','2024-02-01'),

(3,3,'PRIMARY','2024-02-20'),

(4,4,'PRIMARY','2024-03-05'),

(5,5,'PRIMARY','2024-03-18');

/*=========================================================
TABLE : Beneficiaries
=========================================================*/

INSERT INTO Beneficiaries
(
customer_id,
beneficiary_name,
bank_name,
account_number,
ifsc_code,
nickname
)
VALUES

(1,'Rahul Sharma','HDFC Bank','876543210001','HDFC0001234','Brother'),

(2,'Priya Singh','ICICI Bank','876543210002','ICIC0002234','Sister'),

(3,'Amit Verma','Axis Bank','876543210003','UTIB0003234','Friend'),

(4,'Neha Gupta','SBI','876543210004','SBIN0004234','Mother'),

(5,'Rohit Jain','PNB','876543210005','PUNB0005234','Father');

/*=========================================================
TABLE : Transactions
=========================================================*/

/*=========================================================
TABLE : Transactions
=========================================================*/

INSERT INTO Transactions
(
account_id,
beneficiary_id,
transaction_type_id,
transaction_reference,
amount,
remarks,
transaction_status
)
VALUES

(1,1,1,'TXN100001',2500,'Cash Deposit','SUCCESS'),

(2,2,2,'TXN100002',5000,'ATM Withdrawal','SUCCESS'),

(3,3,4,'TXN100003',12000,'UPI Payment','SUCCESS'),

(4,4,5,'TXN100004',8000,'NEFT Transfer','SUCCESS'),

(5,5,6,'TXN100005',15000,'RTGS Transfer','SUCCESS');

/*=========================================================
TABLE : Cards
=========================================================*/

INSERT INTO Cards
(
account_id,
card_type_id,
card_number,
cvv,
expiry_date,
issue_date,
card_status
)
VALUES

(1,1,'5234567812340001','321','2029-01-31','2024-01-15','ACTIVE'),

(2,1,'5234567812340002','654','2029-02-28','2024-02-01','ACTIVE'),

(3,2,'5234567812340003','741','2029-03-31','2024-02-20','ACTIVE'),

(4,1,'5234567812340004','852','2029-04-30','2024-03-05','ACTIVE'),

(5,3,'5234567812340005','963','2029-05-31','2024-03-18','ACTIVE');