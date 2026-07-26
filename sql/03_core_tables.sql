/*=========================================================
 TABLE: Accounts
 Description:
 Stores all customer bank accounts.
=========================================================*/

CREATE TABLE Accounts
(
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    account_number VARCHAR(20) NOT NULL UNIQUE,

    account_type_id INT NOT NULL,

    branch_id INT NOT NULL,

    opening_balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,

    current_balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,

    account_status ENUM('ACTIVE','INACTIVE','FROZEN','CLOSED')
        DEFAULT 'ACTIVE',

    opened_on DATE NOT NULL,

    closed_on DATE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_type
        FOREIGN KEY (account_type_id)
        REFERENCES Account_Types(account_type_id),

    CONSTRAINT fk_account_branch
        FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);
/*=========================================================
 TABLE: Account_Holders
 Description:
 Maps customers to their bank accounts.
 Supports single and joint accounts.
=========================================================*/

CREATE TABLE Account_Holders
(
    account_holder_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    customer_id INT NOT NULL,

    holder_type ENUM('PRIMARY','JOINT')
        DEFAULT 'PRIMARY',

    added_on DATE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ah_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_ah_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT uq_account_customer
        UNIQUE(account_id, customer_id)
);
/*=========================================================
 TABLE: Beneficiaries
 Description:
 Stores beneficiary accounts added by customers.
=========================================================*/

CREATE TABLE Beneficiaries
(
    beneficiary_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    beneficiary_name VARCHAR(100) NOT NULL,

    bank_name VARCHAR(100) NOT NULL,

    account_number VARCHAR(20) NOT NULL,

    ifsc_code VARCHAR(15) NOT NULL,

    nickname VARCHAR(50),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

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
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    account_id INT NOT NULL,

    beneficiary_id INT,

    transaction_type_id INT NOT NULL,

    transaction_reference VARCHAR(30) NOT NULL UNIQUE,

    amount DECIMAL(15,2) NOT NULL,

    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    remarks VARCHAR(255),

    transaction_status ENUM('SUCCESS','FAILED','PENDING')
        DEFAULT 'SUCCESS',

    CONSTRAINT fk_transaction_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_transaction_beneficiary
        FOREIGN KEY(beneficiary_id)
        REFERENCES Beneficiaries(beneficiary_id),

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

    cvv CHAR(3) NOT NULL,

    expiry_date DATE NOT NULL,

    issue_date DATE NOT NULL,

    card_status ENUM('ACTIVE','BLOCKED','EXPIRED')
        DEFAULT 'ACTIVE',

    CONSTRAINT fk_card_account
        FOREIGN KEY(account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_card_type
        FOREIGN KEY(card_type_id)
        REFERENCES Card_Types(card_type_id)
);
/*=========================================================
 TABLE: Loans
=========================================================*/

CREATE TABLE Loans
(
    loan_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    loan_type_id INT NOT NULL,

    principal_amount DECIMAL(15,2) NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL,

    tenure_months INT NOT NULL,

    monthly_emi DECIMAL(15,2) NOT NULL,

    outstanding_balance DECIMAL(15,2) NOT NULL,

    loan_start_date DATE NOT NULL,

    loan_end_date DATE,

    loan_status ENUM('ACTIVE','CLOSED','DEFAULTED')
        DEFAULT 'ACTIVE',

    CONSTRAINT fk_loan_customer
        FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_loan_type
        FOREIGN KEY(loan_type_id)
        REFERENCES Loan_Types(loan_type_id)
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

    principal_component DECIMAL(15,2) NOT NULL,

    interest_component DECIMAL(15,2) NOT NULL,

    total_amount DECIMAL(15,2) NOT NULL,

    payment_status ENUM('PENDING','PAID','OVERDUE')
        DEFAULT 'PENDING',

    CONSTRAINT fk_schedule_loan
        FOREIGN KEY(loan_id)
        REFERENCES Loans(loan_id)
);
/*=========================================================
 TABLE: EMI_Payments
=========================================================*/

CREATE TABLE EMI_Payments
(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    emi_schedule_id INT NOT NULL,

    payment_date DATE NOT NULL,

    amount_paid DECIMAL(15,2) NOT NULL,

    payment_mode ENUM('UPI','NEFT','IMPS','CARD','CASH') NOT NULL,

    transaction_reference VARCHAR(30) UNIQUE,

    CONSTRAINT fk_payment_schedule
        FOREIGN KEY(emi_schedule_id)
        REFERENCES EMI_Schedule(emi_schedule_id)
);
/*=========================================================
 TABLE: Fraud_Alerts
 Description:
 Stores alerts generated for suspicious transactions.
=========================================================*/

CREATE TABLE Fraud_Alerts
(
    fraud_alert_id INT AUTO_INCREMENT PRIMARY KEY,

    transaction_id INT NOT NULL,

    alert_type VARCHAR(100) NOT NULL,

    risk_score DECIMAL(5,2) NOT NULL,

    alert_status ENUM('OPEN','UNDER_REVIEW','RESOLVED')
        DEFAULT 'OPEN',

    detected_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    reviewed_by INT,

    remarks VARCHAR(255),

    CONSTRAINT fk_fraud_transaction
        FOREIGN KEY(transaction_id)
        REFERENCES Transactions(transaction_id),

    CONSTRAINT fk_fraud_employee
        FOREIGN KEY(reviewed_by)
        REFERENCES Employees(employee_id)
);
/*=========================================================
 TABLE: Audit_Logs
 Description:
 Records all important database activities.
=========================================================*/

CREATE TABLE Audit_Logs
(
    audit_log_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT,

    table_name VARCHAR(100) NOT NULL,

    operation_type ENUM('INSERT','UPDATE','DELETE')
        NOT NULL,

    record_id INT NOT NULL,

    operation_timestamp TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    remarks VARCHAR(255),

    CONSTRAINT fk_audit_employee
        FOREIGN KEY(employee_id)
        REFERENCES Employees(employee_id)
);