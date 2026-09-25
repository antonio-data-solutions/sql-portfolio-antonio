-- Data validation checks
-- Project: Small Business Sales Database
-- Database: small_business_sales
-- Purpose: identify missing, inconsistent, or invalid data
-- -----------------------------------------------------------

-- ===========================================================
-- DATA QUALITY CHECKS: 1 TO 18
-- ===========================================================

-- 1. Check for missing customer information
SELECT
    *
FROM customers
WHERE first_name IS NULL
   OR last_name IS NULL
   OR email IS NULL;


-- 2. Check for duplicate customer emails
SELECT
    email,
    COUNT(*) AS email_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;


-- 3. Check for orders without a matching customer
SELECT
    o.order_id,
    o.customer_id
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 4. Check for order items without a matching product
SELECT
    oi.order_id,
    oi.product_id
FROM order_items AS oi
LEFT JOIN products AS p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


-- 5. Check for invalid product prices
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price IS NULL
   OR unit_price <= 0;


-- 6. Check for invalid stock quantities
SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity IS NULL
   OR stock_quantity < 0;


-- 7. Summary of product prices and stock
SELECT
    COUNT(*) AS total_products,
    COUNT(unit_price) AS products_with_price,
    MIN(unit_price) AS minimum_price,
    MAX(unit_price) AS maximum_price,
    MIN(stock_quantity) AS minimum_stock,
    MAX(stock_quantity) AS maximum_stock
FROM products;


-- 8. Check for duplicate product names
SELECT
    product_name,
    COUNT(*) AS product_count
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;


-- 9. Summary of customer signup dates
SELECT
    COUNT(*) AS total_customers,
    COUNT(signup_date) AS customers_with_signup_date,
    MIN(signup_date) AS first_signup_date,
    MAX(signup_date) AS last_signup_date
FROM customers;


-- 10. Check for future signup dates
SELECT
    customer_id,
    first_name,
    last_name,
    signup_date
FROM customers
WHERE signup_date > CURRENT_DATE;


-- 11. Calculate order item totals
SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS item_total
FROM order_items;


-- 12. Check for invalid order item values
SELECT
    order_id,
    product_id,
    quantity,
    unit_price
FROM order_items
WHERE quantity <= 0
   OR unit_price IS NULL
   OR unit_price <= 0;


-- 13. Check order prices against current product prices
SELECT
    oi.order_id,
    oi.product_id,
    oi.unit_price AS order_unit_price,
    p.unit_price AS current_unit_price
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE oi.unit_price <> p.unit_price;


-- 14. Calculate total value of each order
SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_id;


-- 15. Check for orders without order items
SELECT
    o.order_id
FROM orders AS o
LEFT JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


-- 16. Check for duplicate order IDs
SELECT
    order_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 17. Check for missing order data
SELECT
    order_id,
    customer_id
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL;


-- 18. Check for customers without orders
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- -----------------------------------------------------------


-- ===========================================================
-- BUSINESS ANALYSIS: 19 TO 24
-- ===========================================================

-- 19. Count sales by product
SELECT
    oi.product_id,
    p.product_name,
    COUNT(*) AS times_ordered,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;


-- 20. Revenue by product
SELECT
    oi.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_name
ORDER BY total_revenue DESC;


-- 21. Revenue by customer
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;


-- 22. Calculate total revenue
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(quantity * unit_price) AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2) AS average_item_value
FROM order_items;


-- 23. Revenue by category
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders_with_category,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- 24. Final business summary
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT product_id) AS different_products_sold,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2) AS average_item_value,
    MIN(quantity * unit_price) AS smallest_item_total,
    MAX(quantity * unit_price) AS largest_item_total
FROM order_items;
-- -----------------------------------------------------------


-- SUMMARY

-- ===========================================================
-- DATA QUALITY CHECKS
-- ===========================================================

-- 1. Check for missing customer information
-- 2. Check for duplicate customer emails
-- 3. Check for orders without a matching customer
-- 4. Check for order items without a matching product
-- 5. Check for invalid product prices
-- 6. Check for invalid stock quantities
-- 7. Summary of product prices and stock
-- 8. Check for duplicate product names
-- 9. Summary of customer signup dates
-- 10. Check for future signup dates
-- 11. Calculate order item totals
-- 12. Check for invalid order item values
-- 13. Check order prices against current product prices
-- 14. Calculate total value of each order
-- 15. Check for orders without order items
-- 16. Check for duplicate order IDs
-- 17. Check for missing order data
-- 18. Check for customers without orders


-- ===========================================================
-- BUSINESS ANALYSIS
-- ===========================================================

-- 19. Count sales by product
-- 20. Revenue by product
-- 21. Revenue by customer
-- 22. Calculate total revenue
-- 23. Revenue by category
-- 24. Final business summary

-- -----------------------------------------------------------

-- ===========================================================
-- DATA QUALITY RESULTS
-- ===========================================================

-- All data quality checks returned no issues.
-- No missing customer names, last names, or emails were found.
-- No duplicate customer emails were found.
-- No invalid customer, order, product, or order item relationships were found.
-- No invalid product prices or stock quantities were found.
-- No future customer signup dates were found.
-- No duplicate order IDs or product names were found.
-- All orders have at least one order item.
-- All customers have at least one order.


-- ===========================================================
-- BUSINESS ANALYSIS RESULTS
-- ===========================================================

-- Total orders: 15
-- Different products sold: 10
-- Total units sold: 51
-- Total revenue: 2,326.80
-- Average item value: 86.18
-- Smallest item total: 24.90
-- Largest item total: 199.00
-- Top-selling product by units: Notebook, with 22 units sold.
-- Top product by revenue: Noise Cancelling Headphone, with 449.70 in revenue.
-- Top revenue category: Computer Accessories, with 798.50 in revenue.
-- Top customer by spending: Carla Mendes, with 612.90 spent.
-- Lowest customer spending: Brian Smith, with 122.20 spent.