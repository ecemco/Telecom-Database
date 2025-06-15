

-- Database creation
CREATE DATABASE IF NOT EXISTS telecom_provider;
USE telecom_provider;

-- Customer table

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100),
    created_date DATETIME NOT NULL,
    status ENUM('active', 'suspended', 'terminated') DEFAULT 'active',
    INDEX idx_customer_phone (phone),
    INDEX idx_customer_status (status)
);

-- ServicePlan table

CREATE TABLE IF NOT EXISTS service_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    monthly_fee DECIMAL(10,2) NOT NULL,
    voice_limit INT,
    sms_limit INT ,
    data_limit INT,
    overage_call_rate DECIMAL(5,2),
    overage_sms_rate DECIMAL(5,2),
    overage_data_rate DECIMAL(5,2)
) ;

-- Subscription

CREATE TABLE IF NOT EXISTS subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME,
    status ENUM('active', 'pending', 'expired', 'canceled') DEFAULT 'active',
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ,
    FOREIGN KEY (plan_id) REFERENCES service_plans(plan_id) ,
    INDEX idx_subscription_phone (phone_number),
    INDEX idx_subscription_status (status),
    INDEX idx_subscription_customer (customer_id),
    INDEX idx_subscription_plan (plan_id)
);

-- NetworkElement table

CREATE TABLE IF NOT EXISTS network_elements (
    network_element_id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('tower', 'base_station', 'switch', 'router') NOT NULL,
    location VARCHAR(200) NOT NULL,
    status ENUM('active', 'maintenance', 'out_of_service') DEFAULT 'active',
    capacity INT,
    INDEX idx_network_status (status),
    INDEX idx_network_type (type)
);

-- CallRecord table

CREATE TABLE IF NOT EXISTS call_record (
    call_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    network_element_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    duration INT NOT NULL,
    called_number VARCHAR(20) NOT NULL,
    cost DECIMAL(6,2),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id),
    FOREIGN KEY (network_element_id) REFERENCES network_elements(network_element_id) ,
    INDEX idx_call_subscription (subscription_id),
    INDEX idx_call_time (start_time),
    INDEX idx_call_number (called_number)
);

-- SMSRecord table

CREATE TABLE IF NOT EXISTS sms_records (
    sms_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT NULL,
    network_element_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    recipient_number VARCHAR(20) NOT NULL,
    cost DECIMAL(5,2),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id) ,
    FOREIGN KEY (network_element_id) REFERENCES network_elements(network_element_id) ,
    INDEX idx_sms_subscription (subscription_id),
    INDEX idx_sms_time (timestamp),
    INDEX idx_sms_recipient (recipient_number)
);

-- DataUsage table

CREATE TABLE IF NOT EXISTS data_usages (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT NULL,
    network_element_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    data_used INT NOT NULL,
    cost DECIMAL(6,2),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id) ,
    FOREIGN KEY (network_element_id) REFERENCES network_elements(network_element_id) ,
    INDEX idx_usage_subscription (subscription_id),
    INDEX idx_usage_time (start_time)
) ;

-- Invoice table

CREATE TABLE IF NOT EXISTS invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT NULL,
    issue_date DATETIME NOT NULL,
    due_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'paid', 'overdue', 'canceled') DEFAULT 'pending',
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id),
    INDEX idx_invoice_subscription (subscription_id),
    INDEX idx_invoice_status (status),
    INDEX idx_invoice_dates (issue_date, due_date)
) ;

-- Payment table

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    method ENUM('credit_card', 'bank_transfer', 'cash', 'mobile_payment'),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    INDEX idx_payment_invoice (invoice_id),
    INDEX idx_payment_date (payment_date)
) ;

-- Departments

CREATE TABLE IF NOT EXISTS departments
(
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name varchar(50),
    is_outsource    BOOLEAN,
    created_date    DATETIME NOT NULL
);

-- Stuffs

CREATE TABLE IF NOT EXISTS stuffs (
    stuff_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    tax_id INT NOT NULL,
    name VARCHAR(50),
    surname VARCHAR(50),
    marital_status ENUM ('single','married'),
    number_of_child INT,
    employment_status ENUM ('active','passive','retired') DEFAULT 'active',
    employment_start_date DATETIME  NOT NULL,
    employment_end_date DATETIME NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    INDEX idx_employment_status (employment_status),
    INDEX idx_employment_start_date (employment_start_date)
);

-- Support Tickets

CREATE TABLE IF NOT EXISTS support_tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    subscription_id INT NULL,
    stuff_id INT NOT NULL,
    open_date DATETIME NOT NULL,
    close_date DATETIME,
    status ENUM('open', 'in_progress', 'resolved', 'escalated') DEFAULT 'open',
    description TEXT,
    resolution TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id),
    FOREIGN KEY (stuff_id) REFERENCES stuffs(stuff_id),
    INDEX idx_ticket_customer (customer_id),
    INDEX idx_ticket_status (status),
    INDEX idx_ticket_stuff (stuff_id),
    INDEX idx_ticket_dates (open_date, close_date)
);

