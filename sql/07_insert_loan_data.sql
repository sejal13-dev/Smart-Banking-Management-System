/*
=========================================================
Project : Smart Banking Management System
File    : 07_insert_loan_data.sql
=========================================================
*/

USE smart_banking_system;

INSERT INTO Loans
(
    customer_id,
    loan_type_id,
    account_id,
    loan_amount,
    interest_rate,
    tenure_months,
    monthly_emi,
    outstanding_amount,
    start_date,
    end_date
)
VALUES

(1,1,1,2500000.00,8.50,240,21695.34,2500000.00,'2024-01-01','2044-01-01'),

(2,2,2,800000.00,9.25,84,12930.42,800000.00,'2024-02-01','2031-02-01'),

(3,3,3,500000.00,8.00,60,10138.20,500000.00,'2024-03-01','2029-03-01'),

(4,4,4,300000.00,11.50,36,9895.17,300000.00,'2024-04-01','2027-04-01'),

(5,5,5,200000.00,7.75,24,9005.14,200000.00,'2024-05-01','2026-05-01');

INSERT INTO EMI_Schedule
(
loan_id,
installment_number,
due_date,
principal_amount,
interest_amount,
total_amount
)
VALUES

(1,1,'2024-02-01',15000.00,6695.34,21695.34),
(1,2,'2024-03-01',15100.00,6595.34,21695.34),
(1,3,'2024-04-01',15200.00,6495.34,21695.34),

(2,1,'2024-03-01',11000.00,1930.42,12930.42),
(2,2,'2024-04-01',11100.00,1830.42,12930.42),
(2,3,'2024-05-01',11200.00,1730.42,12930.42),

(3,1,'2024-04-01',9000.00,1138.20,10138.20),
(3,2,'2024-05-01',9050.00,1088.20,10138.20),
(3,3,'2024-06-01',9100.00,1038.20,10138.20),

(4,1,'2024-05-01',8500.00,1395.17,9895.17),
(4,2,'2024-06-01',8550.00,1345.17,9895.17),
(4,3,'2024-07-01',8600.00,1295.17,9895.17),

(5,1,'2024-06-01',8000.00,1005.14,9005.14),
(5,2,'2024-07-01',8050.00,955.14,9005.14),
(5,3,'2024-08-01',8100.00,905.14,9005.14);

INSERT INTO EMI_Payments
(
emi_schedule_id,
payment_date,
amount_paid,
payment_mode,
payment_reference
)
VALUES

(1,'2024-02-01',21695.34,'UPI','EMI100001'),

(2,'2024-03-01',21695.34,'NEFT','EMI100002'),

(4,'2024-03-01',12930.42,'IMPS','EMI100003'),

(7,'2024-04-01',10138.20,'UPI','EMI100004'),

(10,'2024-05-01',9895.17,'RTGS','EMI100005');

SELECT *
FROM EMI_Payments;

SELECT customer_id, customer_code
FROM Customers;

SELECT *
FROM Account_Holders;

SELECT COUNT(*) AS branches FROM Branches;

SELECT COUNT(*) AS employees FROM Employees;

SELECT COUNT(*) AS customers FROM Customers;

SELECT COUNT(*) AS accounts FROM Accounts;

SELECT customer_id, customer_code
FROM Customers;
INSERT INTO Account_Holders;