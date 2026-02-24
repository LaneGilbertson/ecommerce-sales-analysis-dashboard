-- TO_DATE test --
SELECT
    order_date,
    TO_DATE(order_date, 'MM/DD/YYYY')
FROM staging_sales
LIMIT 5;

-- Check for missing customer IDs --
-- Expected result: 0 rows -- 
SELECT COUNT(*) 
FROM staging_sales
WHERE customer_id IS NULL;

-- Check for missing order IDs --
-- Expected result: 0 rows -- 
SELECT COUNT(*) 
FROM staging_sales
WHERE order_id IS NULL;

-- Check for duplicate order IDs --
SELECT order_id, COUNT(*)
FROM staging_sales
GROUP BY order_id 
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Check for null sales --
-- Expected result: 0 rows -- 
Select COUNT(*)
FROM staging_sales
WHERE sales IS NULL;

-- Table Insertion --
INSERT INTO customers (
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
FROM staging_sales
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO products (
    product_id,
    product_name,
    category,
    sub_category
)
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category
FROM staging_sales
ON CONFLICT (product_id) DO NOTHING;

INSERT INTO orders (
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id
)
SELECT DISTINCT
    order_id,
    TO_DATE(order_date, 'MM/DD/YYYY'),
    TO_DATE(ship_date, 'MM/DD/YYYY'),
    ship_mode,
    customer_id
FROM staging_sales
ON CONFLICT (order_id) DO NOTHING;

INSERT INTO order_items (
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM staging_sales;
