-- Project 01: Small Business Sales Database
-- Basic queries and JOIN practice

-- 1. List all orders with customer names
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 2. List products included in each order
SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items AS oi
INNER JOIN products AS p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id, p.product_name;