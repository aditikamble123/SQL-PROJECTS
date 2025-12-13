SELECT
    user_id,
    COUNT(order_id) AS order_count
FROM orders_fact
GROUP BY user_id
HAVING COUNT(order_id) > 1
ORDER BY order_count DESC;
