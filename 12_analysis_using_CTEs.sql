-- Use a CTE to calculate total sales for every customer.
WITH customer_sales AS (
    SELECT o.customer_id AS customer_id , SUM(oi.quantity * oi.price_per_unit) AS total_sales
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
)
SELECT c.customer_name AS customer_name , c1.total_sales AS total_sales
FROM Customers c 
JOIN customer_sales c1
ON c.customer_id = c1.customer_id;
-- Find the top 3 customers using a CTE.
WITH customer_sales1 AS (
    SELECT o.customer_id AS customer_id , SUM(oi.quantity * oi.price_per_unit) AS total_sales
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
)
SELECT c.customer_name AS customer_name , c1.total_sales AS total_sales
FROM Customers c
JOIN customer_sales1 c1
ON c.customer_id = c1.customer_id ORDER BY total_sales DESC LIMIT 3;
-- Use a CTE to calculate monthly revenue.
WITH monthly_revenue AS (
    SELECT MONTH(o.Order_Date) AS months , SUM((oi.quantity * oi.price_per_unit)*(1 - (oi.discount_percent/100)) - (oi.quantity * 
    p.cost_price)) AS total_revenue
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    JOIN Products p
    ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY months
)
SELECT months,total_revenue
FROM monthly_revenue;
-- Find categories whose revenue is above average using a CTE.
WITH category_revenue AS (
    SELECT p.category_id AS category_id,
    SUM((oi.quantity * oi.price_per_unit)*(1 - (oi.discount_percent/100)) - (oi.quantity * 
    p.cost_price)) AS total_revenue
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    JOIN Products p
    ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.category_id
)
SELECT c.category_name AS category_name, c1.total_revenue AS total_revenue
FROM Categories c
JOIN category_revenue c1
ON c.category_id = c1.category_id
WHERE c1.total_revenue > (
    SELECT AVG((oi.quantity * oi.price_per_unit)*(1 - (oi.discount_percent/100)) - (oi.quantity * 
    p.cost_price)) 
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    JOIN Products p
    ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
);
