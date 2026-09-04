-- Calculate total spending by each customer
SELECT o.customer_id AS customer_id , SUM((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100))
AS total_spending
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id;
-- FIND top 10 customers by spending
SELECT o.customer_id AS customer_id , SUM((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100))
AS total_spending
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id ORDER BY total_spending DESC LIMIT 10;
-- Find the average spending per customer.
SELECT o.customer_id AS customer_id , AVG((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100))
AS average_spending
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id;
-- Find customers who spent more than the average customer.
SELECT o.customer_id AS customer_id , AVG((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100))
AS average_spending
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id HAVING AVG((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100)) >
(
    SELECT AVG((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100))
    AS average_spending
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
);
-- Find repeat customers.
SELECT customer_id AS repeated_customers , COUNT(*) AS repeat_times
FROM Orders GROUP BY customer_id HAVING COUNT(*) > 1;
-- Find customers who purchased from more than one category.
SELECT o.customer_id AS customer_id,COUNT(p.category_id) AS count_category
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id HAVING COUNT(p.category_id) > 1;
-- Find the customer who generated the highest revenue.
SELECT o.customer_id AS customer_id , SUM((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent/100)
- (oi.quantity * p.cost_price))
AS total_revenue
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p 
ON p.product_id = oi.product_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_id ORDER BY total_revenue DESC LIMIT 1;