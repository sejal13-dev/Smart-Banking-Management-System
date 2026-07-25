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
 Stores employee information.
=========================================================*/

CREATE TABLE Employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_code VARCHAR(15) NOT NULL UNIQUE,

    branch_id INT NOT NULL,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    gender ENUM('MALE','FEMALE','OTHER')
        NOT NULL,

    date_of_birth DATE NOT NULL,

    email VARCHAR(100)
        NOT NULL UNIQUE,

    phone VARCHAR(15)
        NOT NULL UNIQUE,

    designation VARCHAR(60)
        NOT NULL,

    hire_date DATE
        NOT NULL,

    salary DECIMAL(12,2)
        NOT NULL,

    employment_status
        ENUM('ACTIVE','INACTIVE','RESIGNED')
        DEFAULT 'ACTIVE',

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_employee_branch
        FOREIGN KEY(branch_id)
        REFERENCES Branches(branch_id)
);
/*=========================================================
 TABLE: Roles
 Description:
 Stores all employee roles in the bank.
=========================================================*/

CREATE TABLE Roles
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(50) NOT NULL UNIQUE,

    role_description VARCHAR(255),

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: Employee_Roles
 Description:
 Maps employees to one or more roles.
=========================================================*/

CREATE TABLE Employee_Roles
(
    employee_role_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT NOT NULL,

    role_id INT NOT NULL,

    assigned_date DATE
        DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_emp_role_employee
        FOREIGN KEY(employee_id)
        REFERENCES Employees(employee_id),

    CONSTRAINT fk_emp_role_role
        FOREIGN KEY(role_id)
        REFERENCES Roles(role_id),

    CONSTRAINT uq_employee_role
        UNIQUE(employee_id, role_id)
);
/*=========================================================
 TABLE: Customers
 Description:
 Stores customer personal information.
=========================================================*/

CREATE TABLE Customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_code VARCHAR(15) NOT NULL UNIQUE,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    gender ENUM('MALE','FEMALE','OTHER')
        NOT NULL,

    date_of_birth DATE NOT NULL,

    email VARCHAR(100)
        UNIQUE,

    phone VARCHAR(15)
        NOT NULL UNIQUE,

    address_line1 VARCHAR(150)
        NOT NULL,

    address_line2 VARCHAR(150),

    city VARCHAR(50)
        NOT NULL,

    state VARCHAR(50)
        NOT NULL,

    pincode CHAR(6)
        NOT NULL,

    customer_status
        ENUM('ACTIVE','INACTIVE','BLOCKED')
        DEFAULT 'ACTIVE',

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: KYC
 Description:
 Stores customer KYC information.
=========================================================*/

CREATE TABLE KYC
(
    kyc_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL UNIQUE,

    aadhaar_number CHAR(12)
        NOT NULL UNIQUE,

    pan_number CHAR(10)
        NOT NULL UNIQUE,

    passport_number VARCHAR(20),

    voter_id VARCHAR(20),

    driving_license VARCHAR(25),

    kyc_status
        ENUM('PENDING','VERIFIED','REJECTED')
        DEFAULT 'PENDING',

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
 Description:
 Stores customer nominee information.
=========================================================*/

CREATE TABLE Nominees
(
    nominee_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    nominee_name VARCHAR(100)
        NOT NULL,

    relationship VARCHAR(50)
        NOT NULL,

    date_of_birth DATE,

    phone VARCHAR(15),

    share_percentage DECIMAL(5,2)
        DEFAULT 100.00,

    CONSTRAINT fk_nominee_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
);
/*=========================================================
 TABLE: Account_Types
 Description:
 Stores different types of bank accounts.
=========================================================*/

CREATE TABLE Account_Types
(
    account_type_id INT AUTO_INCREMENT PRIMARY KEY,

    account_type_name VARCHAR(50) NOT NULL UNIQUE,

    minimum_balance DECIMAL(12,2) NOT NULL,

    interest_rate DECIMAL(5,2) DEFAULT 0.00,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: Card_Types
 Description:
 Stores different bank card types.
=========================================================*/

CREATE TABLE Card_Types
(
    card_type_id INT AUTO_INCREMENT PRIMARY KEY,

    card_type_name VARCHAR(50) NOT NULL UNIQUE,

    annual_fee DECIMAL(10,2) DEFAULT 0.00,

    daily_withdrawal_limit DECIMAL(12,2),

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: Loan_Types
 Description:
 Stores loan categories offered by the bank.
=========================================================*/

CREATE TABLE Loan_Types
(
    loan_type_id INT AUTO_INCREMENT PRIMARY KEY,

    loan_type_name VARCHAR(50) NOT NULL UNIQUE,

    minimum_amount DECIMAL(15,2),

    maximum_amount DECIMAL(15,2),

    interest_rate DECIMAL(5,2) NOT NULL,

    maximum_tenure_months INT,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
/*=========================================================
 TABLE: Transaction_Types
 Description:
 Stores all supported banking transaction types.
=========================================================*/

CREATE TABLE Transaction_Types
(
    transaction_type_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_type_name VARCHAR(50) NOT NULL UNIQUE,

    description VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);