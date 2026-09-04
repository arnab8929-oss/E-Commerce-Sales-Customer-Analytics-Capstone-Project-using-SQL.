-- How many total orders were placed?
SELECT COUNT(*) AS total_orders
FROM Orders;
-- How many orders are there for each order status?
SELECT order_status,COUNT(order_id) AS total_orders
FROM Orders GROUP BY order_status;
-- Find all delivered orders.
SELECT * FROM Orders
WHERE order_status = 'Delivered';
-- Find all cancelled orders.
SELECT * FROM orders
WHERE order_status = 'Cancelled';
-- Find the orders placed in February. 
SELECT * FROM Orders
WHERE MONTH(order_date) = 2;
-- Find the number of orders for each payment method.
SELECT payment_method,COUNT(order_id) AS total_orders
FROM Orders GROUP BY payment_method;

