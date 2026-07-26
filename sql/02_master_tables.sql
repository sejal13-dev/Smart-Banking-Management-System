/*
=========================================================
Project : Smart Banking Management System
File    : 02_master_tables.sql
Author  : Sejal Priya
Version : 1.0

Description:
Creates all master/reference tables required
for the Smart Banking Management System.

=========================================================
*/

USE smart_banking_system;
/*=========================================================
 TABLE: Branches
 Description:
 Stores information about all bank branches.
=========================================================*/

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
/*=========================================================
 TABLE: Employees
 Description:
 Stores details of bank employees.
=========================================================*/

CREATE TABLE Employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    branch_id INT NOT NULL,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    gender ENUM('MALE','FEMALE','OTHER') NOT NULL,

    date_of_birth DATE NOT NULL,

    phone VARCHAR(15) NOT NULL UNIQUE,

    email VARCHAR(100) NOT NULL UNIQUE,

    hire_date DATE NOT NULL,

    salary DECIMAL(12,2) NOT NULL,

    employee_status ENUM('ACTIVE','INACTIVE','ON_LEAVE')
        DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);
/*=========================================================
 TABLE: Roles
=========================================================*/

CREATE TABLE Roles
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(50) NOT NULL UNIQUE,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: Employee_Roles
=========================================================*/

CREATE TABLE Employee_Roles
(
    employee_role_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT NOT NULL,

    role_id INT NOT NULL,

    assigned_date DATE NOT NULL,

    CONSTRAINT fk_er_employee
        FOREIGN KEY(employee_id)
        REFERENCES Employees(employee_id),

    CONSTRAINT fk_er_role
        FOREIGN KEY(role_id)
        REFERENCES Roles(role_id),

    CONSTRAINT uq_employee_role
        UNIQUE(employee_id, role_id)
);
/*=========================================================
 TABLE: Customers
=========================================================*/

CREATE TABLE Customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    gender ENUM('MALE','FEMALE','OTHER'),

    date_of_birth DATE NOT NULL,

    phone VARCHAR(15) NOT NULL UNIQUE,

    email VARCHAR(100) UNIQUE,

    address VARCHAR(255) NOT NULL,

    city VARCHAR(50) NOT NULL,

    state VARCHAR(50) NOT NULL,

    pincode CHAR(6) NOT NULL,

    customer_status ENUM('ACTIVE','INACTIVE','BLOCKED')
        DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: KYC
=========================================================*/

CREATE TABLE KYC
(
    kyc_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL UNIQUE,

    aadhaar_number CHAR(12) NOT NULL UNIQUE,

    pan_number VARCHAR(10) NOT NULL UNIQUE,

    document_verified BOOLEAN DEFAULT FALSE,

    verification_date DATE,

    verified_by INT,

    CONSTRAINT fk_kyc_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_kyc_employee
        FOREIGN KEY(verified_by)
        REFERENCES Employees(employee_id)
);
/*=========================================================
 TABLE: Nominees
=========================================================*/

CREATE TABLE Nominees
(
    nominee_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    nominee_name VARCHAR(100) NOT NULL,

    relationship VARCHAR(50) NOT NULL,

    date_of_birth DATE,

    phone VARCHAR(15),

    CONSTRAINT fk_nominee_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
);
/*=========================================================
 TABLE: Account_Types
=========================================================*/

CREATE TABLE Account_Types
(
    account_type_id INT AUTO_INCREMENT PRIMARY KEY,

    account_type_name VARCHAR(50) UNIQUE NOT NULL,

    minimum_balance DECIMAL(12,2) DEFAULT 0,

    interest_rate DECIMAL(5,2) DEFAULT 0
);
/*=========================================================
 TABLE: Card_Types
=========================================================*/

CREATE TABLE Card_Types
(
    card_type_id INT AUTO_INCREMENT PRIMARY KEY,

    card_name VARCHAR(50) UNIQUE NOT NULL,

    annual_fee DECIMAL(10,2) DEFAULT 0,

    daily_limit DECIMAL(12,2) NOT NULL
);
/*=========================================================
 TABLE: Loan_Types
=========================================================*/

CREATE TABLE Loan_Types
(
    loan_type_id INT AUTO_INCREMENT PRIMARY KEY,

    loan_name VARCHAR(50) UNIQUE NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    max_tenure_months INT NOT NULL
);
/*=========================================================
 TABLE: Transaction_Types
=========================================================*/

CREATE TABLE Transaction_Types
(
    transaction_type_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_name VARCHAR(50) UNIQUE NOT NULL,

    description VARCHAR(255)
);