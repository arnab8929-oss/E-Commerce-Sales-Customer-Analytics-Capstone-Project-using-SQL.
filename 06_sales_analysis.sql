-- Calculate total sales
SELECT SUM(oi.quantity * oi.price_per_unit) AS total_sales
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';
-- Calculate total sales by month
SELECT MONTH(o.order_date) AS months,SUM(oi.price_per_unit * oi.quantity) AS total_sales
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date);
-- Calculate total quantity sold
SELECT SUM(oi.quantity) AS total_sold_quantity
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';
-- Find the top 5 highest-value orders
SELECT o.order_id AS highest_valued_orders,SUM(oi.quantity * oi.price_per_unit) AS total_value
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered' GROUP BY o.order_id ORDER BY total_value DESC LIMIT 5;
-- Calculte average order value
SELECT AVG(oi.quantity * oi.price_per_unit) AS average_order_value
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';
-- Find the months with highest sales
SELECT MONTH(o.order_date) AS months , SUM(oi.price_per_unit * oi.quantity) AS total_sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY months ORDER BY total_sales DESC LIMIT 1;
-- Daily sales trend
SELECT o.order_date AS order_date,SUM(oi.price_per_unit * oi.quantity) AS total_sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY order_date;
-- Monthly Sales trend
SELECT MONTH(o.order_date) AS months,SUM(oi.price_per_unit * oi.quantity) AS total_sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY months;