-- Find products whose selling price is above the average selling price.
SELECT product_name 
FROM Products
WHERE selling_price > 
(
    SELECT AVG(selling_price)
    FROM Products
);
-- Find customers whose spending is above average customer spending.
SELECT c.customer_name AS customer_name
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Customers c
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name HAVING AVG((oi.quantity * oi.price_per_unit) * (1 - (oi.discount_percent/100))) > (
    SELECT AVG((oi.quantity * oi.price_per_unit) * (1 - (oi.discount_percent/100)))
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
);
-- Find the second highest-selling product.
SELECT product_id AS second_highest_selling_products
FROM 
(SELECT oi.product_id AS product_id,COUNT(oi.quantity) AS product_count,DENSE_RANK() OVER (ORDER BY COUNT(oi.quantity) DESC) AS rnk
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY oi.product_id) AS temp
WHERE temp.rnk = 2;
-- Find products that have generated more revenue than the average product.
SELECT p.product_name AS product_name
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p 
ON p.product_id = oi.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id HAVING AVG(oi.quantity * (p.selling_price - p.cost_price)) >
(
    SELECT AVG(oi.quantity * (p.selling_price - p.cost_price))
    FROM Orders o
    JOIN Order_Items oi
    ON o.order_id = oi.order_id
    JOIN Products p
    ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
);
-- Find customers who placed more orders than the average customer.
SELECT c.customer_name AS customer_name,COUNT(o.order_id) AS placed_orders
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id HAVING COUNT(o.order_id) > (
	SELECT AVG(placed_orders)
    FROM
    (SELECT c.customer_name AS customer_name,COUNT(o.order_id) AS placed_orders
    FROM Orders o
    JOIN Customers c
    ON o.customer_id = c.customer_id
	GROUP BY c.customer_id) as temp
);
