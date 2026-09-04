-- How many total customers are there?
SELECT COUNT(*) AS total_customers
FROM Customers;
-- How many customers are there in each city?
SELECT city,COUNT(customer_id) AS total_customers
FROM Customers GROUP BY city;
-- Which city has the most customers?
SELECT city AS cities_with_highest_customers,COUNT(customer_id) AS total_customers
FROM Customers GROUP BY city HAVING COUNT(customer_id) =
(SELECT COUNT(customer_id) AS total_customers
FROM Customers GROUP BY city ORDER BY total_customers DESC LIMIT 1);
-- Find the customers who have not placed any orders.
SELECT * FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);
-- Find the customers who placed the most orders?
SELECT customer_id AS customer_with_most_orders,COUNT(order_id) AS total_order FROM Orders
GROUP BY customer_id HAVING COUNT(order_id) =
(SELECT COUNT(order_id) AS total_orders
FROM Orders GROUP BY customer_id ORDER BY total_orders DESC LIMIT 1);