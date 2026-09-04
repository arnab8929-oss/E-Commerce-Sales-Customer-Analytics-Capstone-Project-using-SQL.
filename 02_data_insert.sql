INSERT INTO Categories (category_name)
VALUES
('Electronics'),
('Fashion'),
('Home & Kitchen'),
('Beauty'),
('Sports'),
('Books'),
('Toys'),
('Groceries');

INSERT INTO Customers 
(customer_name, email, city, state, signup_date)
VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', 'Kolkata', 'West Bengal', '2024-01-15'),
('Priya Singh', 'priya.singh@gmail.com', 'Mumbai', 'Maharashtra', '2024-02-10'),
('Amit Kumar', 'amit.kumar@gmail.com', 'Delhi', 'Delhi', '2024-02-22'),
('Sneha Das', 'sneha.das@gmail.com', 'Kolkata', 'West Bengal', '2024-03-05'),
('Arjun Patel', 'arjun.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2024-03-18'),
('Neha Gupta', 'neha.gupta@gmail.com', 'Bengaluru', 'Karnataka', '2024-04-02'),
('Rohan Verma', 'rohan.verma@gmail.com', 'Pune', 'Maharashtra', '2024-04-15'),
('Ananya Roy', 'ananya.roy@gmail.com', 'Kolkata', 'West Bengal', '2024-05-01'),
('Vikram Singh', 'vikram.singh@gmail.com', 'Jaipur', 'Rajasthan', '2024-05-20'),
('Pooja Mehta', 'pooja.mehta@gmail.com', 'Mumbai', 'Maharashtra', '2024-06-10'),
('Sourav Ghosh', 'sourav.ghosh@gmail.com', 'Kolkata', 'West Bengal', '2024-06-25'),
('Kavya Nair', 'kavya.nair@gmail.com', 'Chennai', 'Tamil Nadu', '2024-07-12'),
('Aditya Joshi', 'aditya.joshi@gmail.com', 'Hyderabad', 'Telangana', '2024-08-05'),
('Ishita Banerjee', 'ishita.banerjee@gmail.com', 'Kolkata', 'West Bengal', '2024-08-20'),
('Manish Yadav', 'manish.yadav@gmail.com', 'Lucknow', 'Uttar Pradesh', '2024-09-10');

INSERT INTO Products
(product_name, category_id, cost_price, selling_price, stock_quantity)
VALUES
('Wireless Mouse', 1, 450.00, 799.00, 100),
('Bluetooth Speaker', 1, 1200.00, 1799.00, 50),
('Smart Watch', 1, 2500.00, 3999.00, 40),
('USB Keyboard', 1, 700.00, 1199.00, 80),
('Wireless Earbuds', 1, 1500.00, 2499.00, 60),

('Cotton T-Shirt', 2, 300.00, 699.00, 200),
('Denim Jeans', 2, 900.00, 1599.00, 100),
('Running Shoes', 2, 1400.00, 2499.00, 75),
('Leather Jacket', 2, 2500.00, 4999.00, 30),
('Casual Shirt', 2, 500.00, 999.00, 120),

('Non-Stick Pan', 3, 600.00, 1099.00, 50),
('Water Bottle', 3, 250.00, 499.00, 150),
('Table Lamp', 3, 700.00, 1299.00, 45),
('Coffee Maker', 3, 1800.00, 2999.00, 25),
('Bedsheet Set', 3, 800.00, 1499.00, 60),

('Face Wash', 4, 150.00, 299.00, 200),
('Shampoo', 4, 180.00, 349.00, 150),
('Body Lotion', 4, 220.00, 449.00, 100),

('Football', 5, 500.00, 999.00, 70),
('Yoga Mat', 5, 400.00, 799.00, 90),
('Cricket Bat', 5, 1200.00, 2499.00, 40),

('SQL for Beginners', 6, 250.00, 499.00, 100),
('Data Analytics Guide', 6, 400.00, 799.00, 70),

('Building Blocks Set', 7, 600.00, 1199.00, 50),
('Remote Control Car', 7, 900.00, 1799.00, 35),

('Basmati Rice 5kg', 8, 400.00, 650.00, 100),
('Cooking Oil 1L', 8, 100.00, 180.00, 200),
('Green Tea', 8, 150.00, 299.00, 120);

INSERT INTO Orders
(customer_id, order_date, payment_method, order_status)
VALUES
(1, '2025-01-05', 'UPI', 'Delivered'),
(2, '2025-01-08', 'Credit Card', 'Delivered'),
(3, '2025-01-10', 'Cash on Delivery', 'Cancelled'),
(1, '2025-01-15', 'UPI', 'Delivered'),
(4, '2025-01-20', 'Debit Card', 'Delivered'),
(5, '2025-02-02', 'UPI', 'Delivered'),
(6, '2025-02-05', 'Credit Card', 'Returned'),
(7, '2025-02-10', 'UPI', 'Delivered'),
(8, '2025-02-14', 'Cash on Delivery', 'Delivered'),
(2, '2025-02-18', 'Debit Card', 'Cancelled'),
(9, '2025-03-01', 'UPI', 'Delivered'),
(10, '2025-03-05', 'Credit Card', 'Delivered'),
(3, '2025-03-08', 'UPI', 'Delivered'),
(11, '2025-03-15', 'Cash on Delivery', 'Returned'),
(12, '2025-03-20', 'Debit Card', 'Delivered'),
(13, '2025-04-02', 'UPI', 'Delivered'),
(14, '2025-04-07', 'Credit Card', 'Delivered'),
(15, '2025-04-12', 'Cash on Delivery', 'Pending'),
(1, '2025-04-18', 'UPI', 'Delivered'),
(5, '2025-04-25', 'Debit Card', 'Cancelled'),
(6, '2025-05-03', 'Credit Card', 'Delivered'),
(7, '2025-05-10', 'UPI', 'Delivered'),
(8, '2025-05-15', 'Cash on Delivery', 'Delivered'),
(9, '2025-05-20', 'Debit Card', 'Returned'),
(10, '2025-05-28', 'UPI', 'Delivered'),
(11, '2025-06-02', 'Credit Card', 'Delivered'),
(12, '2025-06-08', 'UPI', 'Delivered'),
(13, '2025-06-15', 'Cash on Delivery', 'Cancelled'),
(14, '2025-06-20', 'Debit Card', 'Delivered'),
(15, '2025-06-28', 'UPI', 'Delivered');

INSERT INTO Order_Items
(order_id, product_id, quantity, price_per_unit, discount_percent)
VALUES
(1, 1, 2, 799.00, 10),
(1, 6, 1, 699.00, 0),

(2, 2, 1, 1799.00, 5),
(2, 8, 1, 2499.00, 10),

(3, 3, 1, 3999.00, 0),

(4, 5, 2, 2499.00, 15),
(4, 22, 1, 499.00, 0),

(5, 11, 1, 1099.00, 5),
(5, 16, 2, 299.00, 0),

(6, 19, 1, 999.00, 10),
(6, 20, 1, 799.00, 0),

(7, 3, 1, 3999.00, 20),

(8, 7, 1, 1599.00, 10),
(8, 12, 2, 499.00, 0),

(9, 14, 1, 2999.00, 5),

(10, 9, 1, 4999.00, 15),

(11, 21, 1, 2499.00, 10),
(11, 19, 2, 999.00, 0),

(12, 2, 1, 1799.00, 0),
(12, 23, 1, 799.00, 5),

(13, 1, 1, 799.00, 0),
(13, 17, 2, 349.00, 10),

(14, 26, 2, 650.00, 5),

(15, 13, 1, 1299.00, 0),
(15, 18, 1, 449.00, 10),

(16, 4, 1, 1199.00, 0),
(16, 5, 1, 2499.00, 10),

(17, 8, 1, 2499.00, 5),

(18, 24, 1, 1199.00, 0),
(18, 25, 1, 1799.00, 10),

(19, 6, 3, 699.00, 15),

(20, 10, 2, 999.00, 0),

(21, 14, 1, 2999.00, 10),
(21, 27, 3, 180.00, 0),

(22, 20, 2, 799.00, 5),

(23, 11, 1, 1099.00, 0),
(23, 15, 2, 1499.00, 10),

(24, 3, 1, 3999.00, 15),

(25, 22, 2, 499.00, 0),

(26, 7, 1, 1599.00, 10),
(26, 16, 2, 299.00, 0),

(27, 12, 4, 499.00, 5),

(28, 21, 1, 2499.00, 0),

(29, 18, 2, 449.00, 10),
(29, 17, 1, 349.00, 0),

(30, 1, 2, 799.00, 5),
(30, 28, 3, 299.00, 0);