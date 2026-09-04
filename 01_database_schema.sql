CREATE DATABASE ecommerce_capstone;
USE ecommerce_capstone;

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE Categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

CREATE TABLE Products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category_id INT,
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY(category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items(
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    discount_percent INT,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(product_id) REFERENCES Products(product_id)
);