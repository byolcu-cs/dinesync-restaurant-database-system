-- Create Database
CREATE DATABASE IF NOT EXISTS DineSyncDB;
USE DineSyncDB;

-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(15),
    customer_email VARCHAR(100)
);

-- Create Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    staff_role ENUM('Server', 'Bartender', 'Manager') NOT NULL,
    staff_phone VARCHAR(15)
);

-- Create Food Table
CREATE TABLE Food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    food_price DECIMAL(6,2) NOT NULL,
    food_description VARCHAR(255),
    food_type ENUM('Appetizer', 'Main', 'Side', 'Dessert') NOT NULL
);

-- Create Drink Table
CREATE TABLE Drink (
    drink_id INT AUTO_INCREMENT PRIMARY KEY,
    drink_name VARCHAR(100) NOT NULL,
    drink_price DECIMAL(6,2) NOT NULL,
    drink_description VARCHAR(255)
);

-- Create Order Table
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    order_type ENUM('Dine-In', 'Takeout'),
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_notes VARCHAR(300),
    order_status ENUM('In Progress', 'Completed'),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create Order_Item Table
CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_type ENUM('Food', 'Drink') NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- Create Payment Table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Mobile') NOT NULL,
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- Insert Sample Data

-- Insert Customers
INSERT INTO Customer (customer_name, customer_phone, customer_email) VALUES
('John Doe', '5551234567', 'john@example.com'),
('Jane Smith', '5559876543', 'jane@example.com'),
('Alice Johnson', '5552345678', 'alice@example.com');

-- Insert Staff
INSERT INTO Staff (staff_name, staff_role, staff_phone) VALUES
('Tom Server', 'Server', '5551112222'),
('Lucy Bartender', 'Bartender', '5553334444'),
('Bariscan Yolcu', 'Manager', '5559990000');

-- Insert Food Items
INSERT INTO Food (food_name, food_price, food_description, food_type) VALUES
('Burger', 9.99, 'Beef burger with fries', 'Main'),
('Salad', 6.99, 'Fresh garden salad', 'Appetizer'),
('Chocolate Cake', 4.99, 'Rich chocolate dessert', 'Dessert');

-- Insert Drinks
INSERT INTO Drink (drink_name, drink_price, drink_description) VALUES
('Cola', 1.99, 'Refreshing soda drink'),
('Beer', 5.50, 'Craft beer');

-- Insert Orders
INSERT INTO `Order` (customer_id, staff_id, order_type, order_time, order_notes, order_status) VALUES
(1, 1, 'Dine-In', NOW(), 'No onions', 'In Progress'),
(2, 2, 'Takeout', NOW(), '', 'Completed');

-- Insert Order_Items
INSERT INTO Order_Item (order_id, item_type, item_id, quantity) VALUES
(1, 'Food', 1, 2),
(1, 'Drink', 1, 2),
(2, 'Food', 2, 1);

-- Insert Payments
INSERT INTO Payment (order_id, amount, payment_method) VALUES
(1, 25.48, 'Card'),
(2, 6.99, 'Cash');
