/*
=========================================================
Project : Smart Banking Management System
File    : 02_master_tables.sql
Author  : Sejal Priya
Version : 2.0
=========================================================
*/

USE smart_banking_system;

-- =====================================================
-- BRANCHES
-- =====================================================

CREATE TABLE Branches
(
    branch_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_code VARCHAR(10) NOT NULL UNIQUE,

    branch_name VARCHAR(100) NOT NULL,

    ifsc_code VARCHAR(15) NOT NULL UNIQUE,

    address_line1 VARCHAR(150) NOT NULL,

    address_line2 VARCHAR(150),

    city VARCHAR(50) NOT NULL,

    state VARCHAR(50) NOT NULL,

    pincode CHAR(6) NOT NULL,

    phone VARCHAR(15) NOT NULL,

    email VARCHAR(100) UNIQUE,

    branch_status ENUM('ACTIVE','INACTIVE')
    DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- ROLES
-- =====================================================

CREATE TABLE Roles
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(50) NOT NULL UNIQUE,

    role_description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- ACCOUNT TYPES
-- =====================================================

CREATE TABLE Account_Types
(
    account_type_id INT AUTO_INCREMENT PRIMARY KEY,

    account_type_name VARCHAR(50) NOT NULL UNIQUE,

    minimum_balance DECIMAL(12,2) NOT NULL,

    interest_rate DECIMAL(5,2) DEFAULT 0,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- TRANSACTION TYPES
-- =====================================================

CREATE TABLE Transaction_Types
(
    transaction_type_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_type_name VARCHAR(50) NOT NULL UNIQUE,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- CARD TYPES
-- =====================================================

CREATE TABLE Card_Types
(
    card_type_id INT AUTO_INCREMENT PRIMARY KEY,

    card_type_name VARCHAR(50) NOT NULL UNIQUE,

    annual_fee DECIMAL(10,2) DEFAULT 0,

    daily_withdrawal_limit DECIMAL(12,2),

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- LOAN TYPES
-- =====================================================

CREATE TABLE Loan_Types
(
    loan_type_id INT AUTO_INCREMENT PRIMARY KEY,

    loan_type_name VARCHAR(50) NOT NULL UNIQUE,

    minimum_amount DECIMAL(15,2),

    maximum_amount DECIMAL(15,2),

    interest_rate DECIMAL(5,2),

    maximum_tenure_months INT,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);