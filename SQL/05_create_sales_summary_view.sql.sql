-- Create a reusable sales summary view

CREATE OR REPLACE VIEW sales_summary AS
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT product_id) AS different_products_sold,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2) AS average_item_value,
    MIN(quantity * unit_price) AS smallest_item_total,
    MAX(quantity * unit_price) AS largest_item_total
FROM order_items;



-- Create a product performance view

CREATE OR REPLACE VIEW product_performance AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category;



-- Create a customer spending view

CREATE OR REPLACE VIEW customer_spending AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;



-- Create a category performance view

CREATE OR REPLACE VIEW category_performance AS
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders_with_category,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.category;