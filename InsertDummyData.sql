-- Telecom Database Dummy Data Insert Script

-- Insert Service Plans (Basic, Standard, Premium, Enterprise)
INSERT INTO service_plans (name, monthly_fee, voice_limit, sms_limit, data_limit, overage_call_rate, overage_sms_rate, overage_data_rate) VALUES
('Basic Plan', 29.99, 500, 1000, 2048, 0.15, 0.05, 0.10),
('Standard Plan', 49.99, 1000, 2500, 5120, 0.12, 0.04, 0.08),
('Premium Plan', 79.99, 2000, 5000, 10240, 0.10, 0.03, 0.06),
('Enterprise Plan', 149.99, 5000, 10000, 25600, 0.08, 0.02, 0.04),
('Student Plan', 19.99, 300, 500, 1024, 0.18, 0.06, 0.12),
('Family Plan', 99.99, 3000, 7500, 15360, 0.09, 0.025, 0.05),
('Business Basic', 59.99, 1500, 3000, 7680, 0.11, 0.035, 0.07),
('Unlimited Plan', 199.99, 999999, 999999, 51200, 0.00, 0.00, 0.00);

-- Insert Network Elements
INSERT INTO network_elements (type, location, status, capacity) VALUES
('tower', 'Downtown Manhattan, NY', 'active', 1000),
('tower', 'Brooklyn Heights, NY', 'active', 800),
('tower', 'Queens Plaza, NY', 'maintenance', 600),
('tower', 'Bronx Central, NY', 'active', 750),
('base_station', 'Staten Island Port, NY', 'active', 400),
('base_station', 'Long Island City, NY', 'active', 500),
('base_station', 'Harlem District, NY', 'out_of_service', 300),
('switch', 'Central Exchange NYC', 'active', 5000),
('switch', 'Brooklyn Exchange', 'active', 3000),
('switch', 'Queens Exchange', 'active', 2500),
('router', 'Main Data Center NYC', 'active', 10000),
('router', 'Backup Data Center NJ', 'active', 8000),
('tower', 'Financial District, NY', 'active', 900),
('tower', 'Upper East Side, NY', 'active', 700),
('tower', 'Chelsea District, NY', 'active', 650),
('base_station', 'JFK Airport, NY', 'active', 800),
('base_station', 'LaGuardia Airport, NY', 'active', 600),
('base_station', 'Newark Airport, NJ', 'active', 700),
('switch', 'Airport Communications Hub', 'active', 4000),
('router', 'Regional Hub Philadelphia', 'active', 6000);

-- Insert Departments
INSERT INTO departments (department_name, is_outsource, created_date) VALUES
('Customer Service', FALSE, '2020-01-15 09:00:00'),
('Technical Support', FALSE, '2020-01-15 09:00:00'),
('Network Operations', FALSE, '2020-01-15 09:00:00'),
('Sales', FALSE, '2020-01-15 09:00:00'),
('Billing', FALSE, '2020-01-15 09:00:00'),
('IT Support', TRUE, '2020-03-01 10:00:00'),
('Security', FALSE, '2020-01-15 09:00:00'),
('Marketing', FALSE, '2020-02-01 09:00:00'),
('Human Resources', FALSE, '2020-01-15 09:00:00'),
('Finance', FALSE, '2020-01-15 09:00:00');

-- Insert Staff Members
INSERT INTO stuffs (department_id, tax_id, name, surname, marital_status, number_of_child, employment_status, employment_start_date, employment_end_date) VALUES
-- Customer Service Staff
(1, 123456789, 'John', 'Smith', 'married', 2, 'active', '2020-02-01 09:00:00', NULL),
(1, 123456790, 'Sarah', 'Johnson', 'single', 0, 'active', '2020-03-15 09:00:00', NULL),
(1, 123456791, 'Michael', 'Williams', 'married', 1, 'active', '2020-05-01 09:00:00', NULL),
(1, 123456792, 'Emma', 'Brown', 'single', 0, 'active', '2021-01-10 09:00:00', NULL),
(1, 123456793, 'David', 'Davis', 'married', 3, 'active', '2021-03-01 09:00:00', NULL),
-- Technical Support Staff
(2, 223456789, 'Robert', 'Miller', 'married', 1, 'active', '2020-02-15 09:00:00', NULL),
(2, 223456790, 'Lisa', 'Wilson', 'single', 0, 'active', '2020-04-01 09:00:00', NULL),
(2, 223456791, 'James', 'Moore', 'married', 2, 'active', '2020-06-15 09:00:00', NULL),
(2, 223456792, 'Jennifer', 'Taylor', 'single', 0, 'active', '2021-02-01 09:00:00', NULL),
-- Network Operations Staff
(3, 323456789, 'Christopher', 'Anderson', 'married', 1, 'active', '2020-01-20 09:00:00', NULL),
(3, 323456790, 'Amanda', 'Thomas', 'single', 0, 'active', '2020-07-01 09:00:00', NULL),
(3, 323456791, 'Matthew', 'Jackson', 'married', 2, 'active', '2020-09-15 09:00:00', NULL),
-- Sales Staff
(4, 423456789, 'Daniel', 'White', 'single', 0, 'active', '2020-03-01 09:00:00', NULL),
(4, 423456790, 'Ashley', 'Harris', 'married', 1, 'active', '2020-08-15 09:00:00', NULL),
(4, 423456791, 'Ryan', 'Martin', 'single', 0, 'active', '2021-01-01 09:00:00', NULL),
-- Billing Staff
(5, 523456789, 'Michelle', 'Thompson', 'married', 2, 'active', '2020-04-01 09:00:00', NULL),
(5, 523456790, 'Kevin', 'Garcia', 'single', 0, 'active', '2020-10-01 09:00:00', NULL),
-- Other departments
(6, 623456789, 'Brian', 'Martinez', 'married', 1, 'active', '2020-05-15 09:00:00', NULL),
(7, 723456789, 'Nicole', 'Robinson', 'single', 0, 'active', '2020-06-01 09:00:00', NULL),
(8, 823456789, 'Steven', 'Clark', 'married', 2, 'active', '2020-07-15 09:00:00', NULL),
(9, 923456789, 'Stephanie', 'Rodriguez', 'single', 0, 'active', '2020-08-01 09:00:00', NULL),
(10, 1023456789, 'Gregory', 'Lewis', 'married', 1, 'active', '2020-09-01 09:00:00', NULL);

-- Insert Customers
INSERT INTO customers (name, address, phone, email, created_date, status) VALUES
('Alice Johnson', '123 Main St, New York, NY 10001', '5551234567', 'alice.johnson@email.com', '2022-01-15 10:30:00', 'active'),
('Bob Smith', '456 Oak Ave, Brooklyn, NY 11201', '5551234568', 'bob.smith@email.com', '2022-01-20 14:45:00', 'active'),
('Carol Williams', '789 Pine Rd, Queens, NY 11354', '5551234569', 'carol.williams@email.com', '2022-02-01 09:15:00', 'active'),
('David Brown', '321 Elm St, Bronx, NY 10451', '5551234570', 'david.brown@email.com', '2022-02-15 16:20:00', 'active'),
('Eva Davis', '654 Maple Dr, Staten Island, NY 10301', '5551234571', 'eva.davis@email.com', '2022-03-01 11:00:00', 'active'),
('Frank Miller', '987 Cedar Ln, Manhattan, NY 10002', '5551234572', 'frank.miller@email.com', '2022-03-15 13:30:00', 'suspended'),
('Grace Wilson', '147 Birch St, Brooklyn, NY 11215', '5551234573', 'grace.wilson@email.com', '2022-04-01 08:45:00', 'active'),
('Henry Moore', '258 Walnut Ave, Queens, NY 11365', '5551234574', 'henry.moore@email.com', '2022-04-15 15:10:00', 'active'),
('Iris Taylor', '369 Cherry Rd, Bronx, NY 10458', '5551234575', 'iris.taylor@email.com', '2022-05-01 12:25:00', 'active'),
('Jack Anderson', '741 Spruce Dr, Staten Island, NY 10314', '5551234576', 'jack.anderson@email.com', '2022-05-15 17:40:00', 'active'),
('Kate Thomas', '852 Ash Ln, Manhattan, NY 10003', '5551234577', 'kate.thomas@email.com', '2022-06-01 10:15:00', 'active'),
('Leo Jackson', '963 Hickory St, Brooklyn, NY 11230', '5551234578', 'leo.jackson@email.com', '2022-06-15 14:55:00', 'terminated'),
('Mia White', '159 Poplar Ave, Queens, NY 11375', '5551234579', 'mia.white@email.com', '2022-07-01 09:30:00', 'active'),
('Noah Harris', '357 Sycamore Rd, Bronx, NY 10467', '5551234580', 'noah.harris@email.com', '2022-07-15 16:05:00', 'active'),
('Olivia Martin', '468 Willow Dr, Staten Island, NY 10308', '5551234581', 'olivia.martin@email.com', '2022-08-01 11:20:00', 'active'),
('Paul Thompson', '579 Magnolia Ln, Manhattan, NY 10004', '5551234582', 'paul.thompson@email.com', '2022-08-15 13:45:00', 'active'),
('Quinn Garcia', '680 Dogwood St, Brooklyn, NY 11220', '5551234583', 'quinn.garcia@email.com', '2022-09-01 08:10:00', 'active'),
('Rachel Martinez', '791 Redwood Ave, Queens, NY 11385', '5551234584', 'rachel.martinez@email.com', '2022-09-15 15:35:00', 'active'),
('Sam Robinson', '802 Cypress Rd, Bronx, NY 10475', '5551234585', 'sam.robinson@email.com', '2022-10-01 12:50:00', 'active'),
('Tina Clark', '913 Juniper Dr, Staten Island, NY 10312', '5551234586', 'tina.clark@email.com', '2022-10-15 17:15:00', 'active'),
('Uma Rodriguez', '024 Fir Ln, Manhattan, NY 10005', '5551234587', 'uma.rodriguez@email.com', '2022-11-01 10:40:00', 'active'),
('Victor Lewis', '135 Beech St, Brooklyn, NY 11235', '5551234588', 'victor.lewis@email.com', '2022-11-15 14:25:00', 'active'),
('Wendy Lee', '246 Chestnut Ave, Queens, NY 11395', '5551234589', 'wendy.lee@email.com', '2022-12-01 09:55:00', 'active'),
('Xavier Walker', '357 Locust Rd, Bronx, NY 10480', '5551234590', 'xavier.walker@email.com', '2022-12-15 16:30:00', 'suspended'),
('Yolanda Hall', '468 Pecan Dr, Staten Island, NY 10309', '5551234591', 'yolanda.hall@email.com', '2023-01-01 11:45:00', 'active'),
('Zachary Allen', '579 Hazel Ln, Manhattan, NY 10006', '5551234592', 'zachary.allen@email.com', '2023-01-15 13:10:00', 'active'),
('Anna Young', '680 Laurel St, Brooklyn, NY 11225', '5551234593', 'anna.young@email.com', '2023-02-01 08:35:00', 'active'),
('Benjamin King', '791 Basswood Ave, Queens, NY 11405', '5551234594', 'benjamin.king@email.com', '2023-02-15 15:00:00', 'active'),
('Catherine Wright', '802 Cottonwood Rd, Bronx, NY 10485', '5551234595', 'catherine.wright@email.com', '2023-03-01 12:15:00', 'active'),
('Daniel Lopez', '913 Elderberry Dr, Staten Island, NY 10313', '5551234596', 'daniel.lopez@email.com', '2023-03-15 17:50:00', 'active');

-- Insert Subscriptions
INSERT INTO subscriptions (customer_id, plan_id, start_date, end_date, status, phone_number) VALUES
-- Active subscriptions
(1, 2, '2022-01-15 10:30:00', NULL, 'active', '5551111001'),
(2, 1, '2022-01-20 14:45:00', NULL, 'active', '5551111002'),
(3, 3, '2022-02-01 09:15:00', NULL, 'active', '5551111003'),
(4, 2, '2022-02-15 16:20:00', NULL, 'active', '5551111004'),
(5, 4, '2022-03-01 11:00:00', NULL, 'active', '5551111005'),
(6, 1, '2022-03-15 13:30:00', '2024-03-15 13:30:00', 'canceled', '5551111006'),
(7, 6, '2022-04-01 08:45:00', NULL, 'active', '5551111007'),
(8, 2, '2022-04-15 15:10:00', NULL, 'active', '5551111008'),
(9, 3, '2022-05-01 12:25:00', NULL, 'active', '5551111009'),
(10, 5, '2022-05-15 17:40:00', NULL, 'active', '5551111010'),
(11, 1, '2022-06-01 10:15:00', NULL, 'active', '5551111011'),
(12, 2, '2022-06-15 14:55:00', '2023-06-15 14:55:00', 'expired', '5551111012'),
(13, 7, '2022-07-01 09:30:00', NULL, 'active', '5551111013'),
(14, 3, '2022-07-15 16:05:00', NULL, 'active', '5551111014'),
(15, 2, '2022-08-01 11:20:00', NULL, 'active', '5551111015'),
(16, 8, '2022-08-15 13:45:00', NULL, 'active', '5551111016'),
(17, 1, '2022-09-01 08:10:00', NULL, 'active', '5551111017'),
(18, 4, '2022-09-15 15:35:00', NULL, 'active', '5551111018'),
(19, 2, '2022-10-01 12:50:00', NULL, 'active', '5551111019'),
(20, 3, '2022-10-15 17:15:00', NULL, 'active', '5551111020'),
(21, 6, '2022-11-01 10:40:00', NULL, 'active', '5551111021'),
(22, 2, '2022-11-15 14:25:00', NULL, 'active', '5551111022'),
(23, 1, '2022-12-01 09:55:00', NULL, 'active', '5551111023'),
(24, 3, '2022-12-15 16:30:00', '2024-01-15 16:30:00', 'canceled', '5551111024'),
(25, 7, '2023-01-01 11:45:00', NULL, 'active', '5551111025'),
(26, 2, '2023-01-15 13:10:00', NULL, 'active', '5551111026'),
(27, 5, '2023-02-01 08:35:00', NULL, 'active', '5551111027'),
(28, 4, '2023-02-15 15:00:00', NULL, 'active', '5551111028'),
(29, 3, '2023-03-01 12:15:00', NULL, 'active', '5551111029'),
(30, 8, '2023-03-15 17:50:00', NULL, 'active', '5551111030'),
-- Additional subscriptions for some customers (multiple lines)
(1, 1, '2023-01-01 10:00:00', NULL, 'active', '5551111031'),
(3, 2, '2023-02-01 10:00:00', NULL, 'active', '5551111032'),
(5, 1, '2023-03-01 10:00:00', NULL, 'active', '5551111033'),
(7, 3, '2023-04-01 10:00:00', NULL, 'active', '5551111034'),
(10, 2, '2023-05-01 10:00:00', NULL, 'active', '5551111035');

-- Insert Call Records (Recent 3 months of data)
INSERT INTO call_record (subscription_id, network_element_id, start_time, duration, called_number, cost) VALUES
-- January 2025 calls
(1, 1, '2025-01-01 08:15:00', 180, '5552221111', 2.70),
(1, 1, '2025-01-01 14:30:00', 300, '5552221112', 4.50),
(2, 2, '2025-01-01 09:45:00', 120, '5552221113', 2.16),
(3, 1, '2025-01-01 16:20:00', 450, '5552221114', 4.50),
(4, 3, '2025-01-02 10:15:00', 240, '5552221115', 2.88),
(5, 1, '2025-01-02 13:45:00', 600, '5552221116', 4.80),
(6, 2, '2025-01-02 17:30:00', 90, '5552221117', 1.35),
(7, 4, '2025-01-03 08:00:00', 360, '5552221118', 3.24),
(8, 1, '2025-01-03 11:25:00', 180, '5552221119', 2.16),
(9, 5, '2025-01-03 15:50:00', 420, '5552221120', 4.20),
(10, 1, '2025-01-04 09:10:00', 150, '5552221121', 2.70),
(11, 2, '2025-01-04 12:35:00', 270, '5552221122', 4.05),
(13, 3, '2025-01-04 16:40:00', 330, '5552221123', 3.63),
(14, 1, '2025-01-05 08:55:00', 200, '5552221124', 2.00),
(15, 4, '2025-01-05 14:20:00', 480, '5552221125', 5.76),
-- February 2025 calls
(1, 1, '2025-02-01 09:30:00', 210, '5552222001', 3.15),
(2, 2, '2025-02-01 13:45:00', 150, '5552222002', 2.70),
(3, 1, '2025-02-01 17:15:00', 390, '5552222003', 3.90),
(4, 3, '2025-02-02 10:00:00', 180, '5552222004', 2.16),
(5, 1, '2025-02-02 14:30:00', 540, '5552222005', 4.32),
(7, 4, '2025-02-02 18:45:00', 120, '5552222006', 1.08),
(8, 1, '2025-02-03 08:20:00', 300, '5552222007', 3.60),
(9, 5, '2025-02-03 12:50:00', 240, '5552222008', 2.40),
(10, 1, '2025-02-03 16:10:00', 420, '5552222009', 7.56),
(11, 2, '2025-02-04 09:40:00', 160, '5552222010', 2.40),
-- March 2025 calls
(1, 1, '2025-03-01 10:15:00', 195, '5552223001', 2.93),
(2, 2, '2025-03-01 15:30:00', 135, '5552223002', 2.43),
(3, 1, '2025-03-01 18:45:00', 375, '5552223003', 3.75),
(4, 3, '2025-03-02 11:20:00', 225, '5552223004', 2.70),
(5, 1, '2025-03-02 16:40:00', 510, '5552223005', 4.08),
-- Add more calls for better data distribution
(16, 1, '2025-01-15 09:00:00', 600, '5552224001', 0.00), -- Unlimited plan
(17, 2, '2025-01-15 13:30:00', 90, '5552224002', 1.62),
(18, 4, '2025-01-15 17:45:00', 420, '5552224003', 3.36),
(19, 1, '2025-01-16 08:15:00', 180, '5552224004', 2.16),
(20, 3, '2025-01-16 12:30:00', 300, '5552224005', 3.00),
(21, 4, '2025-01-16 16:50:00', 240, '5552224006', 2.16),
(22, 1, '2025-01-17 10:25:00', 150, '5552224007', 1.80),
(23, 2, '2025-01-17 14:40:00', 360, '5552224008', 6.48),
(25, 4, '2025-01-17 18:15:00', 480, '5552224009', 4.20),
(26, 1, '2025-01-18 09:35:00', 120, '5552224010', 1.44);

-- Insert SMS Records
INSERT INTO sms_records (subscription_id, network_element_id, timestamp, recipient_number, cost) VALUES
-- January 2025 SMS
(1, 1, '2025-01-01 08:30:00', '5553331111', 0.05),
(1, 1, '2025-01-01 12:45:00', '5553331112', 0.05),
(2, 2, '2025-01-01 16:20:00', '5553331113', 0.06),
(3, 1, '2025-01-01 19:15:00', '5553331114', 0.03),
(4, 3, '2025-01-02 07:30:00', '5553331115', 0.04),
(5, 1, '2025-01-02 11:50:00', '5553331116', 0.02),
(6, 2, '2025-01-02 15:25:00', '5553331117', 0.06),
(7, 4, '2025-01-02 18:40:00', '5553331118', 0.025),
(8, 1, '2025-01-03 09:15:00', '5553331119', 0.04),
(9, 5, '2025-01-03 13:30:00', '5553331120', 0.03),
-- February 2025 SMS
(1, 1, '2025-02-01 10:20:00', '5553332001', 0.05),
(2, 2, '2025-02-01 14:35:00', '5553332002', 0.06),
(3, 1, '2025-02-01 17:50:00', '5553332003', 0.03),
(4, 3, '2025-02-02 08:15:00', '5553332004', 0.04),
(5, 1, '2025-02-02 12:40:00', '5553332005', 0.02),
-- March 2025 SMS
(1, 1, '2025-03-01 09:45:00', '5553333001', 0.05),
(2, 2, '2025-03-01 13:20:00', '5553333002', 0.06),
(3, 1, '2025-03-01 16:55:00', '5553333003', 0.03),
-- Add more SMS records
(10, 1, '2025-01-10 10:30:00', '5553334001', 0.18), -- Student plan overage
(11, 2, '2025-01-10 15:45:00', '5553334002', 0.05),
(13, 3, '2025-01-10 19:20:00', '5553334003', 0.035),
(14, 1, '2025-01-11 08:50:00', '5553334004', 0.03),
(15, 4, '2025-01-11 12:15:00', '5553334005', 0.04),
(16, 1, '2025-01-11 16:30:00', '5553334006', 0.00), -- Unlimited plan
(17, 2, '2025-01-12 09:40:00', '5553334007', 0.06),
(18, 4, '2025-01-12 14:25:00', '5553334008', 0.02),
(19, 1, '2025-01-12 18:10:00', '5553334009', 0.04),
(20, 3, '2025-01-13 07:55:00', '5553334010', 0.03);

-- Insert Data Usage Records
INSERT INTO data_usages (subscription_id, network_element_id, start_time, end_time, data_used, cost) VALUES
-- January 2025 data usage (MB)
(1, 1, '2025-01-01 08:00:00', '2025-01-01 08:30:00', 150, 0.00), -- Within limit
(1, 1, '2025-01-01 14:15:00', '2025-01-01 15:45:00', 320, 0.00),
(2, 2, '2025-01-01 09:30:00', '2025-01-01 10:15:00', 80, 0.00),
(3, 1, '2025-01-01 16:00:00', '2025-01-01 17:30:00', 450, 0.00),
(4, 3, '2025-01-02 10:00:00', '2025-01-02 11:20:00', 280, 0.00),
(5, 1, '2025-01-02 13:30:00', '2025-01-02 15:00:00', 1200, 0.00),
(6, 2, '2025-01-02 17:15:00', '2025-01-02 18:00:00', 95, 0.00),
(7, 4, '2025-01-03 08:45:00', '2025-01-03 10:30:00', 680, 0.00),
(8, 1, '2025-01-03 12:00:00', '2025-01-03 13:45:00', 220, 0.00),
(9, 5, '2025-01-03 16:30:00', '2025-01-03 18:15:00', 890, 0.00),
-- Data overage examples
(10, 1, '2025-01-15 09:00:00', '2025-01-15 12:00:00', 1200, 14.40)