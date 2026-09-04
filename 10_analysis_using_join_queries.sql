-- Display orders along with customer names.
SELECT o.* ,c.customer_name AS customer_name
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id;
-- Display products along with their category names.
SELECT p.*,c.category_name AS category_name
FROM Products p
JOIN Categories c
ON p.category_id = c.category_id;
-- Display every order with its purchased products.
SELECT o.*,p.product_name AS product_name
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id;
-- Display customer name, order ID, and total order amount.
SELECT c.customer_name,o.order_id,((oi.quantity * oi.price_per_unit) - (oi.quantity * oi.price_per_unit) * (oi.discount_percent / 100))
AS total_order_amount
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id;
-- Find customers who purchased wireless mouse product.
SELECT c.customer_name
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
WHERE p.Product_name = 'Wireless Mouse';
-- Find categories purchased by each customer.
SELECT c.category_name AS categories_purchased_by_each_customer
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
HAVING COUNT(DISTINCT o.customer_id) = (
    SELECT COUNT(customer_id)
    FROM Customers 
);

