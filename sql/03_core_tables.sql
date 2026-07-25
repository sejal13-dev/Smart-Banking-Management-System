/*
=========================================================
Project : Smart Banking Management System
File    : 03_core_tables.sql
Author  : Sejal Priya
Version : 1.0

Description:
Creates all core banking tables.

=========================================================
*/

USE smart_banking_system;
/*=========================================================
 TABLE: Accounts
=========================================================*/

CREATE TABLE Accounts
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    account_number VARCHAR(20) NOT NULL UNIQUE,

    account_type_id INT NOT NULL,

    branch_id INT NOT NULL,

    opening_balance DECIMAL(15,2) NOT NULL,

    current_balance DECIMAL(15,2)
        NOT NULL DEFAULT 0.00,

    account_status
        ENUM('ACTIVE','FROZEN','CLOSED')
        DEFAULT 'ACTIVE',

    opened_on DATE NOT NULL,

    closed_on DATE NULL,

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_type
        FOREIGN KEY(account_type_id)
        REFERENCES Account_Types(account_type_id),

    CONSTRAINT fk_account_branch
        FOREIGN KEY(branch_id)
        REFERENCES Branches(branch_id)
);
/*=========================================================
 TABLE: Account_Holders
 Description:
 Maps customers to bank accounts.
 Supports both single and joint account holders.
=========================================================*/

CREATE TABLE Account_Holders
(
    account_holder_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    customer_id INT NOT NULL,

    holder_type ENUM('PRIMARY','JOINT')
        DEFAULT 'PRIMARY',

    added_on DATE
        DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_accountholder_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_accountholder_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT uq_account_customer
        UNIQUE(account_id, customer_id)
);
/*=========================================================
 TABLE: Beneficiaries
=========================================================*/

CREATE TABLE Beneficiaries
(
    beneficiary_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    beneficiary_name VARCHAR(100) NOT NULL,

    beneficiary_account_number VARCHAR(20) NOT NULL,

    beneficiary_ifsc VARCHAR(15) NOT NULL,

    bank_name VARCHAR(100) NOT NULL,

    nickname VARCHAR(50),

    status ENUM('ACTIVE','INACTIVE')
        DEFAULT 'ACTIVE',

    added_on DATE
        DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_beneficiary_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
);
/*=========================================================
 TABLE: Transactions
 Description:
 Stores all financial transactions.
=========================================================*/

CREATE TABLE Transactions
(
    transaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,

    transaction_reference VARCHAR(30) NOT NULL UNIQUE,

    from_account_id INT,

    to_account_id INT,

    transaction_type_id INT NOT NULL,

    amount DECIMAL(15,2) NOT NULL,

    transaction_date TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    transaction_status
        ENUM('PENDING','SUCCESS','FAILED','REVERSED')
        DEFAULT 'SUCCESS',

    remarks VARCHAR(255),

    CONSTRAINT fk_transaction_from_account
        FOREIGN KEY(from_account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_transaction_to_account
        FOREIGN KEY(to_account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_transaction_type
        FOREIGN KEY(transaction_type_id)
        REFERENCES Transaction_Types(transaction_type_id)
);
/*=========================================================
 TABLE: Cards
=========================================================*/

CREATE TABLE Cards
(
    card_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    card_type_id INT NOT NULL,

    card_number VARCHAR(20) NOT NULL UNIQUE,

    expiry_date DATE NOT NULL,

    cvv CHAR(3) NOT NULL,

    issue_date DATE NOT NULL,

    card_status
        ENUM('ACTIVE','BLOCKED','EXPIRED')
        DEFAULT 'ACTIVE',

    daily_limit DECIMAL(12,2) DEFAULT 50000.00,

    CONSTRAINT fk_card_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_card_type
        FOREIGN KEY(card_type_id)
        REFERENCES Card_Types(card_type_id)
);
/*=========================================================
 TABLE: Loans
 Description:
 Stores all customer loan information.
=========================================================*/

CREATE TABLE Loans
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    loan_type_id INT NOT NULL,

    account_id INT NOT NULL,

    loan_amount DECIMAL(15,2) NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    tenure_months INT NOT NULL,

    monthly_emi DECIMAL(15,2) NOT NULL,

    outstanding_amount DECIMAL(15,2) NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE NOT NULL,

    loan_status
        ENUM('ACTIVE','CLOSED','DEFAULTED')
        DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_loan_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_loan_type
        FOREIGN KEY(loan_type_id)
        REFERENCES Loan_Types(loan_type_id),

    CONSTRAINT fk_loan_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id)
);
/*=========================================================
 TABLE: EMI_Schedule
=========================================================*/

CREATE TABLE EMI_Schedule
(
    emi_schedule_id INT AUTO_INCREMENT PRIMARY KEY,

    loan_id INT NOT NULL,

    installment_number INT NOT NULL,

    due_date DATE NOT NULL,

    principal_amount DECIMAL(15,2) NOT NULL,

    interest_amount DECIMAL(15,2) NOT NULL,

    total_amount DECIMAL(15,2) NOT NULL,

    emi_status
        ENUM('PENDING','PAID','OVERDUE')
        DEFAULT 'PENDING',

    CONSTRAINT fk_emi_schedule_loan
        FOREIGN KEY(loan_id)
        REFERENCES Loans(loan_id)
);
/*=========================================================
 TABLE: EMI_Payments
=========================================================*/

CREATE TABLE EMI_Payments
(
    emi_payment_id INT AUTO_INCREMENT PRIMARY KEY,

    emi_schedule_id INT NOT NULL,

    payment_date DATE NOT NULL,

    amount_paid DECIMAL(15,2) NOT NULL,

    payment_mode
        ENUM('UPI','NEFT','RTGS','IMPS','CASH','CHEQUE')
        NOT NULL,

    payment_reference VARCHAR(50) UNIQUE,

    payment_status
        ENUM('SUCCESS','FAILED','PENDING')
        DEFAULT 'SUCCESS',

    CONSTRAINT fk_emi_payment_schedule
        FOREIGN KEY(emi_schedule_id)
        REFERENCES EMI_Schedule(emi_schedule_id)
);