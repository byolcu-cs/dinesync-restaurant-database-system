-- Drop database if exists (to start fresh)
DROP DATABASE IF EXISTS DineSyncDB;

-- Create fresh database
CREATE DATABASE DineSyncDB;
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

-- Insert Customers
INSERT INTO Customer (customer_name, customer_phone, customer_email) VALUES
('John Doe', '5551234567', 'john@example.com'),
('Jane Smith', '5559876543', 'jane@example.com'),
('Alice Johnson', '5552345678', 'alice@example.com'),
('Michael Scott', '5553456789', 'mscott@example.com'),
('Dwight Schrute', '5554567890', 'dwight@example.com'),
('Pam Beesly', '5555678901', 'pam@example.com'),
('Jim Halpert', '5556789012', 'jim@example.com'),
('Ryan Howard', '5557890123', 'ryan@example.com'),
('Kelly Kapoor', '5558901234', 'kelly@example.com'),
('Stanley Hudson', '5559012345', 'stanley@example.com');

-- Insert Staff
INSERT INTO Staff (staff_name, staff_role, staff_phone) VALUES
('Tom Server', 'Server', '5551112222'),
('Lucy Bartender', 'Bartender', '5553334444'),
('Bariscan Yolcu', 'Manager', '5559990000'),
('Taylor Guerrero', 'Server', '5558887777'),
('Angela Martin', 'Manager', '5556665555'),
('Oscar Martinez', 'Bartender', '5554443333'),
('Phyllis Vance', 'Server', '5552221111'),
('Meredith Palmer', 'Server', '5551113333'),
('Creed Bratton', 'Bartender', '5556667777'),
('Kevin Malone', 'Server', '5557776666');

-- Insert Food Items
INSERT INTO Food (food_name, food_price, food_description, food_type) VALUES
('Burger', 9.99, 'Beef burger with fries', 'Main'),
('Salad', 6.99, 'Fresh garden salad', 'Appetizer'),
('Chocolate Cake', 4.99, 'Rich chocolate dessert', 'Dessert'),
('Steak', 18.99, 'Grilled sirloin steak', 'Main'),
('French Fries', 3.99, 'Crispy golden fries', 'Side'),
('Chicken Wings', 7.99, 'Buffalo-style wings', 'Appetizer'),
('Fish and Chips', 12.49, 'Beer-battered fish with fries', 'Main'),
('Mozzarella Sticks', 5.99, 'Fried mozzarella cheese sticks', 'Appetizer'),
('Tacos', 8.99, 'Beef tacos with salsa', 'Main'),
('Ice Cream Sundae', 5.49, 'Vanilla ice cream with toppings', 'Dessert');

-- Insert Drinks
INSERT INTO Drink (drink_name, drink_price, drink_description) VALUES
('Cola', 2.99, 'Refreshing soda beverage'),
('Beer', 5.49, 'Draft lager beer'),
('Margarita', 8.99, 'Classic tequila cocktail'),
('Orange Juice', 3.49, 'Fresh squeezed orange juice'),
('Iced Tea', 2.99, 'Sweetened iced tea'),
('Lemonade', 2.99, 'Homemade lemonade'),
('Coffee', 2.49, 'Fresh brewed coffee'),
('Red Wine', 9.99, 'Cabernet Sauvignon glass'),
('Whiskey Sour', 7.99, 'Whiskey with lemon juice'),
('Water', 0.00, 'Still water');

-- Insert Orders
INSERT INTO `Order` (customer_id, staff_id, order_type, order_time, order_notes, order_status) VALUES
(1, 1, 'Dine-In', NOW(), 'No onions', 'In Progress'),
(2, 2, 'Takeout', NOW(), '', 'Completed'),
(3, 3, 'Dine-In', NOW(), 'Birthday party', 'Completed'),
(4, 4, 'Takeout', NOW(), '', 'Completed'),
(5, 5, 'Dine-In', NOW(), 'Extra spicy', 'In Progress'),
(6, 6, 'Dine-In', NOW(), '', 'Completed'),
(7, 7, 'Takeout', NOW(), 'Add extra napkins', 'In Progress'),
(8, 8, 'Takeout', NOW(), '', 'Completed'),
(9, 9, 'Dine-In', NOW(), 'No peanuts', 'Completed'),
(10, 10, 'Dine-In', NOW(), 'Birthday cake surprise', 'In Progress');

-- Insert Order_Items
INSERT INTO Order_Item (order_id, item_type, item_id, quantity) VALUES
(1, 'Food', 1, 2),
(1, 'Drink', 1, 2),
(2, 'Food', 2, 1),
(2, 'Drink', 2, 1),
(3, 'Food', 4, 1),
(3, 'Drink', 8, 2),
(4, 'Food', 7, 1),
(4, 'Drink', 6, 1),
(5, 'Food', 5, 1),
(5, 'Drink', 4, 1),
(6, 'Food', 6, 2),
(7, 'Drink', 3, 2),
(8, 'Food', 9, 1),
(9, 'Drink', 5, 2),
(10, 'Food', 10, 2),
(10, 'Drink', 10, 2);

-- Insert Payments
INSERT INTO Payment (order_id, amount, payment_method) VALUES
(1, 29.97, 'Card'),
(2, 12.49, 'Cash'),
(3, 55.99, 'Mobile'),
(4, 18.49, 'Card'),
(5, 22.99, 'Card'),
(6, 31.50, 'Cash'),
(7, 17.00, 'Mobile'),
(8, 15.00, 'Card'),
(9, 19.99, 'Cash'),
(10, 24.50, 'Mobile');


-- Demo SELECT statements
SELECT * FROM Customer;
SELECT * FROM Staff;
SELECT * FROM Food;
SELECT * FROM Drink;
SELECT * FROM `Order`;
SELECT * FROM Order_Item;
SELECT * FROM Payment;

-- How many customers are registered?
SELECT COUNT(*) AS total_customers FROM Customer;

-- How many staff members by role?
SELECT staff_role, COUNT(*) AS count_by_role FROM Staff GROUP BY staff_role;

-- Average price of food items
SELECT AVG(food_price) AS avg_food_price FROM Food;

-- Highest price among all drinks
SELECT MAX(drink_price) AS highest_drink_price FROM Drink;

-- Number of orders by order type (Dine-In or Takeout)
SELECT order_type, COUNT(*) AS count_by_type FROM `Order` GROUP BY order_type;

-- Total quantity of items ordered
SELECT SUM(quantity) AS total_items_ordered FROM Order_Item;

-- Total revenue collected from all payments
SELECT SUM(amount) AS total_revenue FROM Payment;

------------------

-- List of customer names with their order IDs
SELECT Customer.customer_name, `Order`.order_id
FROM Customer
JOIN `Order` ON Customer.customer_id = `Order`.customer_id;

-- List of staff names who handled each order
SELECT Staff.staff_name, `Order`.order_id
FROM Staff
JOIN `Order` ON Staff.staff_id = `Order`.staff_id;

-- List of order IDs with their ordered item types and quantities
SELECT `Order`.order_id, Order_Item.item_type, Order_Item.quantity
FROM `Order`
JOIN Order_Item ON `Order`.order_id = Order_Item.order_id;

-- List of order IDs with payment amounts and payment methods
SELECT `Order`.order_id, Payment.amount, Payment.payment_method
FROM `Order`
JOIN Payment ON `Order`.order_id = Payment.order_id;

----------------

CREATE TABLE Reservation (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    reservation_date DATE NOT NULL,
    reservation_time TIME NOT NULL,
    party_size INT NOT NULL,
    special_requests VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Example Inserts
INSERT INTO Reservation (customer_id, reservation_date, reservation_time, party_size, special_requests) VALUES
(1, '2025-05-01', '19:00:00', 4, 'Window seat requested'),
(3, '2025-05-02', '20:30:00', 2, ''),
(5, '2025-05-03', '18:00:00', 6, 'Birthday celebration'),
(7, '2025-05-04', '19:30:00', 3, 'Quiet area preferred');

-- Example Query to View Reservations
SELECT Reservation.reservation_id, Customer.customer_name, Reservation.reservation_date, Reservation.reservation_time, Reservation.party_size, Reservation.special_requests
FROM Reservation
JOIN Customer ON Reservation.customer_id = Customer.customer_id;
