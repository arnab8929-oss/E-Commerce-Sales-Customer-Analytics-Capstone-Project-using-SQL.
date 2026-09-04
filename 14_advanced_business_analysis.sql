-- Which customers have not ordered anything in the last 3 months?
WITH customer_date AS (
    SELECT customer_id,order_date,LAG(order_date) OVER (ORDER BY order_date) AS previous_date
    FROM Orders
)
SELECT customer_id , order_date, previous_date
FROM
(SELECT customer_id,order_date,previous_date,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS row_num
FROM customer_date) AS temp
WHERE row_num  = 1 AND MONTH(order_date) - MONTH(previous_date) > 3;
-- Which products contribute the most to total revenue?
WITH product_revenue AS (
    SELECT p.product_name AS product_name,
    SUM(oi.quantity * (p.selling_price - p.cost_price)) AS revenue,
	ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity * (p.selling_price - p.cost_price)) DESC) AS row_num
    FROM Products p
    JOIN Order_Items oi
    ON p.product_id = oi.product_id
    GROUP BY p.product_id
)
SELECT product_name,revenue 
FROM product_revenue 
WHERE row_num = 1;
-- Find the top 20% of products generating the most revenue.
WITH product_revenue AS (
    SELECT p.product_name AS product_name,
    SUM(oi.quantity * (p.selling_price - p.cost_price)) AS revenue,
	ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity * (p.selling_price - p.cost_price)) DESC) AS row_num
    FROM Products p
    JOIN Order_Items oi
    ON p.product_id = oi.product_id
    GROUP BY p.product_id
)
SELECT product_name,revenue 
FROM product_revenue 
WHERE row_num <= (SELECT ROUND(COUNT(product_id) * 0.2 , 0) FROM Products);
-- Find products that are frequently purchased together.
SELECT p1.product_name AS product_1,
p2.product_name AS product_2,
COUNT(*) AS times
FROM Order_Items oi1
JOIN Order_Items oi2
ON oi1.order_id = oi2.order_id
AND oi1.product_id < oi2.product_id
JOIN Products p1
ON oi1.product_id = p1.product_id
JOIN Products p2
ON oi2.product_id = p2.product_id
GROUP BY p1.product_name,p2.product_name
ORDER BY times DESC;
-- Which customers have increasing spending over time?
WITH customer_order AS (
    SELECT o.customer_id AS customer_id , o.order_date AS order_date, (oi.price_per_unit * oi.quantity) AS spending , 
     LAG((oi.price_per_unit * oi.quantity)) OVER
    (ORDER BY o.order_date ASC) as previous_spending
	FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
)SELECT DISTINCT customer_id FROM Orders
WHERE customer_id NOT IN (SELECT customer_id
FROM customer_order
WHERE spending - previous_spending <= 0);
-- Find the busiest day based on the number of orders.
WITH busiest_day AS (
    SELECT o.order_date AS order_date,COUNT(oi.order_id) AS order_count,DENSE_RANK() OVER (ORDER BY COUNT(oi.order_id) DESC) 
    AS ranking
    FROM Orders o
	JOIN Order_Items oi
    ON o.order_id = oi.order_id
    GROUP BY o.order_date
)
SELECT * 
FROM busiest_day
WHERE ranking = 1;
-- Find the busiest month based on sales.
WITH busiest_month AS (
    SELECT MONTH(o.order_date) AS months,SUM(oi.quantity * oi.price_per_unit) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.price_per_unit) DESC) 
    AS ranking
    FROM Orders o
	JOIN Order_Items oi
    ON o.order_id = oi.order_id
    GROUP BY MONTH(o.order_date)
)
SELECT * 
FROM busiest_month
WHERE ranking = 1;
-- Calculate cancellation rate by payment method.
SELECT o.payment_method AS payment_method, ((SELECT COUNT(*) FROM Orders o1 WHERE o1.payment_method = o.payment_method 
AND o1.order_status = 'Cancelled')/
(SELECT COUNT(*) FROM Orders o2 WHERE o2.payment_method = o.payment_method)) * 100 AS cancellation_rate_in_percent
FROM Orders o GROUP BY o.payment_method;
-- Find customers who only placed cancelled orders.
SELECT DISTINCT customer_id 
FROM Orders WHERE customer_id NOT IN (SELECT customer_id
FROM Orders WHERE order_status = 'Delivered' OR order_status = 'Returned' OR order_status = 'Pending');
-- Find products that were ordered but never delivered.
SELECT oi.product_id AS product_id ,o.order_status AS order_status
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE oi.product_id NOT IN (
    SELECT oi.product_id
    FROM Order_Items oi
    JOIN Orders o
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered' OR o.order_status = 'Returned'
);