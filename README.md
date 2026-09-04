Got it bro 👍 I carefully checked your **actual 14-file structure**. Since your project goes from **database schema → data insertion → analysis → advanced business analysis**, the README should match those exact files.

Here is a polished README.md:

````md
# 🛒 E-Commerce SQL Capstone Project

## 📌 Project Overview

This project is a **pure SQL E-Commerce Capstone Project** focused on designing a relational database and performing business-focused data analysis.

The project simulates an e-commerce business by working with customers, categories, products, orders, and order items.

The analysis progresses from basic SQL queries to advanced SQL concepts such as **JOINs, Subqueries, Common Table Expressions (CTEs), and Window Functions**.

---

## 🎯 Project Objectives

The objectives of this project are to:

- Design a relational e-commerce database.
- Establish relationships using Primary Keys and Foreign Keys.
- Insert and manage e-commerce data.
- Perform customer, order, sales, product, and category analysis.
- Solve real-world business problems using SQL.
- Apply advanced SQL techniques to extract meaningful insights.

---

# 🗂️ Database Schema

The database consists of **5 interconnected tables**.

## 1. Customers

Stores customer information.

| Column | Description |
|--------|-------------|
| customer_id | Unique identifier for each customer |
| customer_name | Name of the customer |
| email | Customer email address |
| city | Customer city |
| state | Customer state |
| signup_date | Customer registration date |

---

## 2. Categories

Stores product category information.

| Column | Description |
|--------|-------------|
| category_id | Unique identifier for each category |
| category_name | Name of the category |

---

## 3. Products

Stores product information.

| Column | Description |
|--------|-------------|
| product_id | Unique identifier for each product |
| product_name | Name of the product |
| category_id | Associated product category |
| cost_price | Cost price of the product |
| selling_price | Selling price of the product |
| stock_quantity | Available stock quantity |

---

## 4. Orders

Stores information about customer orders.

| Column | Description |
|--------|-------------|
| order_id | Unique identifier for each order |
| customer_id | Customer who placed the order |
| order_date | Date the order was placed |
| payment_method | Payment method used |
| order_status | Current status of the order |

---

## 5. Order_Items

Stores individual products included in each order.

| Column | Description |
|--------|-------------|
| order_item_id | Unique identifier for each order item |
| order_id | Associated order |
| product_id | Purchased product |
| quantity | Quantity purchased |
| price_per_unit | Price per unit |
| discount_percent | Discount applied |

---

# 🔗 Table Relationships

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ▼
Order_Items
    │
    │ product_id
    ▼
Products
    │
    │ category_id
    ▼
Categories
````

---

# 📁 Project Structure

```text
E-Commerce-SQL-Capstone-Project/
│
├── 01_database_schema.sql
├── 02_data_insert.sql
├── 03_data_visualization.sql
├── 04_customer_analysis.sql
├── 05_order_analysis.sql
├── 06_sales_analysis.sql
├── 07_product_analysis.sql
├── 08_category_analysis.sql
├── 09_customer_spending_analysis.sql
├── 10_analysis_using_join_queries.sql
├── 11_analysis_using_subqueries.sql
├── 12_analysis_using_CTEs.sql
├── 13_analysis_using_window_functions.sql
├── 14_advanced_business_analysis.sql
│
└── README.md
```

---

# 📊 Project Analysis

## 📌 01. Database Schema

The database schema was created using SQL.

This includes:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Relationships between tables

---

## 📥 02. Data Insertion

Sample data was inserted into the following tables:

* Customers
* Categories
* Products
* Orders
* Order Items

The dataset represents a simulated e-commerce business environment.

---

## 📈 03. Data Visualization

This section focuses on preparing and presenting data in a structured way for easier analysis and understanding.

---

## 👥 04. Customer Analysis

Customer-focused analysis includes:

* Total number of customers
* Customers in each city
* City with the highest number of customers
* Customers who have not placed any orders
* Customers who placed the most orders

---

## 📦 05. Order Analysis

Order analysis includes:

* Total number of orders
* Orders by status
* Delivered orders
* Cancelled orders
* Orders placed in a particular month
* Orders by payment method

---

## 💰 06. Sales Analysis

Sales analysis includes:

* Total sales
* Monthly sales trends
* Month with the highest sales
* Total quantity sold
* Average order value
* Top high-value orders
* Daily sales trends
* Yearly sales trends

---

## 🛍️ 07. Product Analysis

Product-level analysis includes:

* Top-selling products
* Products generating the highest revenue
* Products with the lowest sales
* Products that have never been ordered
* Average discount by product
* Low-stock products
* Product with the highest quantity sold

---

## 📂 08. Category Analysis

Category-level analysis includes:

* Sales by category
* Category with the highest revenue
* Category with the lowest revenue
* Total quantity sold by category
* Number of products in each category
* Categories generating above-average sales

---

## 💳 09. Customer Spending Analysis

Customer spending analysis includes:

* Total spending by each customer
* Top customers based on spending
* Average customer spending
* Customers spending above average
* Repeat customers
* Customers purchasing from multiple categories
* Customer generating the highest revenue

---

## 🔗 10. Analysis Using JOIN Queries

JOIN operations were used to combine data from multiple tables.

Analysis includes:

* Orders with customer names
* Products with category names
* Orders with purchased products
* Customer names with order values
* Customers who purchased particular products
* Categories purchased by each customer

---

## 🔍 11. Analysis Using Subqueries

Subqueries were used to solve more complex business problems.

Analysis includes:

* Products priced above the average selling price
* Customers spending above average
* Second highest-selling product
* Products generating above-average revenue
* Customers who placed more orders than average

---

## 🧩 12. Analysis Using CTEs

Common Table Expressions (CTEs) were used to simplify complex SQL queries.

Analysis includes:

* Total sales for every customer
* Top customers
* Monthly revenue
* Categories generating above-average revenue
* Monthly sales comparison

---

## 🪟 13. Analysis Using Window Functions

Window Functions were used for advanced analytical calculations.

Functions used include:

* `RANK()`
* `ROW_NUMBER()`
* `LAG()`
* `SUM() OVER()`

Analysis includes:

* Ranking products based on revenue
* Ranking customers based on spending
* Finding the top 3 products in every category
* Calculating running total sales
* Comparing monthly sales with the previous month
* Calculating month-over-month sales growth
* Finding each customer's first order
* Finding each customer's latest order
* Calculating category contribution to total sales
* Finding the highest-selling product within every category

---

## 🔥 14. Advanced Business Analysis

Advanced business questions explored include:

* Customers who have not ordered anything in the last 3 months
* Products contributing the most to total revenue
* Top 20% of products generating the most revenue
* Products frequently purchased together
* Customers with increasing spending over time
* Busiest day based on the number of orders
* Busiest month based on sales
* Cancellation rate by payment method
* Customers who only placed cancelled orders
* Products that were ordered but never delivered

---

# 🛠️ SQL Concepts Used

This project demonstrates the following SQL concepts:

```text
✔ Database Creation
✔ Table Creation
✔ Primary Keys
✔ Foreign Keys
✔ INSERT
✔ SELECT
✔ WHERE
✔ ORDER BY
✔ LIMIT
✔ DISTINCT
✔ Aggregate Functions
✔ GROUP BY
✔ HAVING
✔ CASE WHEN
✔ INNER JOIN
✔ LEFT JOIN
✔ Subqueries
✔ Common Table Expressions (CTEs)
✔ Window Functions
✔ RANK()
✔ ROW_NUMBER()
✔ LAG()
✔ Running Totals
✔ Month-over-Month Growth
✔ Date Functions
```

---

# 📊 Key Business Areas Analyzed

The project focuses on:

* 👥 Customer Analysis
* 📦 Order Analysis
* 💰 Sales Analysis
* 🛍️ Product Analysis
* 📂 Category Analysis
* 💳 Customer Spending Analysis
* 🔗 JOIN Analysis
* 🔍 Subquery Analysis
* 🧩 CTE Analysis
* 🪟 Window Function Analysis
* 🔥 Advanced Business Analysis

---

# 🚀 Project Highlights

* 🗂️ **5 Relational Tables**
* 📁 **14 Organized SQL Files**
* 📊 **Customer, Order, Sales, Product and Category Analysis**
* 🔗 **Multi-table JOIN Operations**
* 🔍 **Subquery-Based Analysis**
* 🧩 **CTE-Based Analysis**
* 🪟 **Advanced Window Functions**
* 💼 **Business-Focused SQL Problems**

---

# 🛠️ Tools Used

* **MySQL**
* **MySQL Workbench**
* **GitHub**

---

# 💡 Key Learnings

Through this project, I gained hands-on experience in:

* Designing relational databases.
* Creating relationships using Primary and Foreign Keys.
* Working with multiple connected tables.
* Writing business-focused SQL queries.
* Using JOINs to combine multiple datasets.
* Solving complex problems using Subqueries.
* Simplifying queries using CTEs.
* Applying Window Functions for advanced analysis.
* Analyzing sales trends and customer behavior.
* Structuring a complete SQL project for a data analyst portfolio.

---

# 👨‍💻 Author

**Arnab Das**

Aspiring Data Analyst

---

## 🔗 Connect With Me

LinkedIn: [https://lnkd.in/p/gVTM5bCe](https://lnkd.in/p/gVTM5bCe)

---

⭐ If you found this project interesting, feel free to explore the SQL queries and analyses in this repository!


