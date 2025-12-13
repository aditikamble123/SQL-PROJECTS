SELECT
    c.user_id,
    c.country,
    SUM(o.total_price) AS total_spent
FROM orders_fact o
JOIN customers_dim c
    ON o.user_id = c.user_id
GROUP BY c.user_id, c.country
ORDER BY total_spent DESC
LIMIT 10;
