/*
=========================================================
Project : Smart Banking Management System
File    : 06_insert_account_data.sql
=========================================================
*/

USE smart_banking_system;

INSERT INTO Accounts
(
    account_number,
    account_type_id,
    branch_id,
    opening_balance,
    current_balance,
    opened_on
)
VALUES
('SB10000001',1,1,25000.00,25000.00,'2024-01-15'),

('SB10000002',1,2,15000.00,15000.00,'2024-02-01'),

('SB10000003',3,3,5000.00,5000.00,'2024-02-10'),

('SB10000004',2,4,100000.00,100000.00,'2024-03-01'),

('SB10000005',1,5,35000.00,35000.00,'2024-03-15');

INSERT INTO Account_Holders
(
    account_id,
    customer_id,
    holder_type
)
VALUES
(1,1,'PRIMARY'),

(2,2,'PRIMARY'),

(3,3,'PRIMARY'),

(4,4,'PRIMARY'),

(5,5,'PRIMARY');

INSERT INTO Beneficiaries
(
customer_id,
beneficiary_name,
beneficiary_account_number,
beneficiary_ifsc,
bank_name,
nickname
)
VALUES

(1,'Ananya Patel','SB10000002','SBIN0001002','Smart Bank','Friend'),

(2,'Aarav Sharma','SB10000001','SBIN0001001','Smart Bank','Brother'),

(3,'Arjun Mehta','SB10000005','SBIN0001005','Smart Bank','Office'),

(4,'Vihaan Gupta','SB10000003','SBIN0001003','Smart Bank','Family'),

(5,'Diya Verma','SB10000004','SBIN0001004','Smart Bank','Business');

INSERT INTO Cards
(
account_id,
card_type_id,
card_number,
expiry_date,
cvv,
issue_date
)
VALUES

(1,1,'5234567890123456','2029-12-31','123','2024-01-20'),

(2,1,'5234567890123457','2029-12-31','234','2024-02-02'),

(3,3,'5234567890123458','2029-12-31','345','2024-02-12'),

(4,2,'5234567890123459','2029-12-31','456','2024-03-03'),

(5,4,'5234567890123460','2029-12-31','567','2024-03-20');