-- Order summary by status
-- Objective: show how many orders exist in each status
-- Source table: orders
-- Returned columns: status, order_count

SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;