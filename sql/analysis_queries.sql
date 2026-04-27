-- Total Revenue -- 
SELECT SUM(sales) AS "Total Revenue"
FROM order_items;

-- Total Profit -- 
SELECT SUM(profit) AS "Total Profit"
FROM order_items;

-- Profit Margin --
SELECT SUM(profit) / SUM(sales) * 100 AS "Profit Margin"
FROM order_items;

-- Total Orders --
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Average Order Value --
SELECT SUM(sales) / COUNT(order_id) AS "Average Order Value (AOV)"
FROM order_items;

-- Monthly Revenue --
SELECT 
DATE_TRUNC('month', order_date) AS "Month",
SUM(order_items.sales) AS "Monthly Revenue"
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Month"
ORDER BY "Month"; 

-- Monthly Profit --
SELECT 
DATE_TRUNC('month', order_date) AS "Month",
SUM(order_items.profit) AS "Monthly Profit"
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Month"
ORDER BY "Month"; 

-- Year by Year Growth --
SELECT
DATE_PART('year', order_date) AS "Year",
SUM(order_items.sales) AS "Yearly Revenue"
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Year"
ORDER BY "Year";

-- Revenue by Region --
SELECT 
customers.region AS "Region",
SUM(order_items.sales) AS "Region Revenue"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Region"
ORDER BY "Region Revenue" DESC;

-- Profit by State -- 
SELECT 
customers.state AS "State",
SUM(order_items.profit) AS "Profit"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "State"
ORDER BY "State" ASC;

-- Top 10 Products by Revenue --
SELECT 
products.product_name AS "Product",
SUM(order_items.sales) AS "Revenue"
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY "Product"
ORDER BY "Revenue" DESC
LIMIT 10;

-- Profit by Category -- 
SELECT
products.category AS "Category",
SUM(order_items.profit) AS "Profit"
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY "Category"
ORDER BY "Profit" DESC; 

-- Discount vs Profit Analysis --
SELECT 
discount,
AVG(profit) AS avg_profit
FROM order_items
GROUP BY discount
ORDER BY discount;

-- Customers with more than 1 order
SELECT 
customers.customer_id AS "Customer ID",
customers.customer_name AS "Customer Name",
COUNT(orders.order_id) AS "Total Orders"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING COUNT(orders.order_id) > 1
ORDER BY "Total Orders" DESC;

-- Top 10 Customers by Revenue --
SELECT
customers.customer_name AS "Customer Name",
SUM(order_items.sales) AS "Revenue"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Customer Name"
ORDER BY "Revenue" DESC
LIMIT 10;

-- Customer Lifetime Value (CLV) -- 
SELECT 
customers.customer_id AS "Customer ID",
customers.customer_name AS "Customer Name",
SUM(order_items.sales) AS "Lifetime Value"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY customers.customer_id
ORDER BY "Lifetime Value" DESC;

-- Average Shipping time -- 
SELECT 
AVG(ship_date - order_date) AS "Average Shipping time"
FROM orders;

-- Shipping Mode Performance -- 
SELECT 
ship_mode AS "Shipping Mode",
AVG(ship_date - order_date) AS "Average Shipping time"
FROM orders
GROUP BY "Shipping Mode"
ORDER BY "Average Shipping time";



