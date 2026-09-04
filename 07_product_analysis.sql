-- Find top 10 best-selling products by quantity
SELECT oi.product_id AS product_id,SUM(oi.quantity) AS total_quantity
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY product_id ORDER BY total_quantity DESC LIMIT 10;
-- Product generating the highest revenue
SELECT p.product_name AS product_name,SUM(oi.quantity * (p.selling_price - p.cost_price)) AS revenue
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
JOIN Orders o
ON o.order_id = oi.order_id
WHERE order_status = 'Delivered'
GROUP BY product_name ORDER BY revenue DESC LIMIT 1;
-- Find the products with the lowest sales.
SELECT p.product_name AS product_name_with_lowest_sales,SUM(oi.quantity * oi.price_per_unit) AS total_sales
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
JOIN Orders o
ON o.order_id = oi.order_id
WHERE order_status = 'Delivered'
GROUP BY product_name ORDER BY total_sales ASC LIMIT 1;
-- Find products that have never been ordered
SELECT product_name FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Order_Items
);
-- Find the average discount for each product
SELECT oi.product_id AS product_id,AVG(oi.discount_percent) AS average_discount
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
GROUP BY product_id;