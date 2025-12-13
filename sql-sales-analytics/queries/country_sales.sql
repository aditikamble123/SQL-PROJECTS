SELECT
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_price) AS total_revenue
FROM orders_fact o
JOIN customers_dim c
    ON o.user_id = c.user_id
GROUP BY c.country
ORDER BY total_revenue DESC;
