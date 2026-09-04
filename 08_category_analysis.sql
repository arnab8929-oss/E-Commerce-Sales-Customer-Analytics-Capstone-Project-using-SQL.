-- Calculate sales for each category
SELECT c.category_name AS category_name,SUM(oi.quantity * oi.price_per_unit) AS total_sales
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
JOIN Products p
ON p.product_id = oi.product_id
JOIN Categories c
ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name;
-- Find the category with the highest revenue
SELECT c.category_name AS category_name,SUM(oi.quantity * (p.selling_price - p.cost_price)) AS total_revenue
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
JOIN Products p
ON p.product_id = oi.product_id
JOIN Categories c
ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name ORDER BY total_revenue DESC LIMIT 1;
-- Find the category with the lowest revenue
SELECT c.category_name AS category_name,SUM(oi.quantity * (p.selling_price - p.cost_price)) AS total_revenue
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
JOIN Products p
ON p.product_id = oi.product_id
JOIN Categories c
ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name ORDER BY total_revenue LIMIT 1;
-- Calculate the total quantity sold by category
SELECT c.category_name AS category_name,SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
JOIN Products p
ON p.product_id = oi.product_id
JOIN Categories c
ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name;
-- Find the number of products in each category
SELECT category_id,SUM(product_id) AS total_products
FROM Products GROUP BY category_id;
-- Find categories that generated sales above the average sales
SELECT c.category_name AS category_name,AVG(oi.quantity * oi.price_per_unit) AS average_sales
FROM Order_Items oi
JOIN Orders o
ON o.order_id = oi.order_id
JOIN Products p
ON p.product_id = oi.product_id
JOIN Categories c
ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered' 
GROUP BY c.category_name
HAVING AVG(oi.quantity * oi.price_per_unit) > (
    (SELECT AVG(ox.quantity * ox.price_per_unit)
    FROM Order_Items ox 
    JOIN Orders os
    ON ox.order_id = os.order_id
    WHERE os.order_status = 'Delivered')
);
