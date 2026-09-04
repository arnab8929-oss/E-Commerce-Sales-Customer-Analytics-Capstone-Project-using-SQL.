-- Rank products based on revenue
SELECT p.product_name AS product_name,
SUM(oi.quantity * (p.selling_price - p.cost_price)) AS revenue,
DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * (p.selling_price - p.cost_price))
 DESC) AS ranking
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_id;
-- Rank customers based on total spending
SELECT c.customer_name AS customer_name,SUM((oi.quantity * oi.price_per_unit)*(1 - (oi.discount_percent/100))) AS total_spending,
DENSE_RANK() OVER (ORDER BY SUM((oi.quantity * oi.price_per_unit)*(1 - (oi.discount_percent/100))) DESC) AS ranking
FROM Orders o
JOIN Customers c 
ON o.customer_id = c.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id;
-- Find the top 3 products in every category
WITH ranked_products AS(
    SELECT c.category_name AS category_name,
    p.product_name AS product_name,
    SUM(oi.quantity) AS total_sold,
    DENSE_RANK() OVER(PARTITION BY c.category_id
    ORDER BY SUM(oi.quantity) DESC) AS product_rank
    FROM Order_Items oi
    JOIN Products p
    ON oi.product_id = p.product_id
    JOIN Categories c
    ON c.category_id = p.category_id
    GROUP BY p.product_id
)
SELECT * FROM ranked_products
WHERE product_rank <= 3;
-- Calculate running total sales by date.
SELECT o.order_date AS order_date , SUM(oi.quantity * oi.price_per_unit) AS daily_sales , SUM(SUM(oi.quantity * oi.price_per_unit))
OVER (ORDER BY o.order_date) AS running_total_sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_date;
-- Compare each month's sales with the previous month
SELECT MONTH(o.order_date) AS months , SUM(oi.price_per_unit * oi.quantity) AS total_sales , LAG(SUM(oi.price_per_unit * oi.quantity))
OVER (ORDER BY MONTH(o.order_date))AS previous_sales
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date);
-- Calculate month-over-month sales 
WITH monthly_sales AS (
    SELECT MONTH(o.order_date) AS months , SUM(oi.price_per_unit * oi.quantity) AS total_sales , LAG(SUM(oi.price_per_unit * oi.quantity))
    OVER (ORDER BY MONTH(o.order_date))AS previous_sales
    FROM Order_Items oi
    JOIN Orders o
    ON o.order_id = oi.order_id
    GROUP BY MONTH(o.order_date)
) 
SELECT months,total_sales,previous_sales, ((total_sales - previous_sales)/previous_sales) * 100 AS Growth_in_percent
FROM monthly_sales;
-- Find each customer's first order using ROW_NUMBER().
WITH new_orders AS (
    SELECT customer_id,order_date,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
    FROM Orders
)
SELECT customer_id,order_date AS first_order_date
FROM new_orders WHERE row_num = 1; 
-- Find each customer's latest order.
WITH new_orders AS (
    SELECT customer_id,order_date,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS row_num
    FROM Orders
)
SELECT customer_id,order_date AS latest_order_date
FROM new_orders WHERE row_num = 1; 
-- Calculate the percentage contribution of each category to total sales.
SELECT c.category_name,(SUM(oi.quantity * oi.price_per_unit) / (SELECT SUM(oi1.quantity * oi1.price_per_unit) FROM Order_Items oi1
JOIN Orders o1 ON o1.order_id = oi1.order_id WHERE o1.order_status = 'Delivered')) * 100 AS percent_contribution
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories c
ON p.category_id = c.category_id
GROUP BY c.category_id;
-- Find the highest-selling product within every category.
WITH ranked_product AS (
    SELECT c.category_name AS category_name,
    p.product_name AS product_name,
    SUM(oi.quantity) AS total_sold,
    ROW_NUMBER() OVER (PARTITION BY c.category_id ORDER BY SUM(oi.quantity) DESC) AS product_rank
    FROM Order_Items oi
    JOIN Products p
    ON oi.product_id = p.product_id
    JOIN Categories c
    ON p.category_id = c.category_id
    GROUP BY p.product_id
)
SELECT category_name,product_name,total_sold,product_rank FROM ranked_product
WHERE product_rank = 1;