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