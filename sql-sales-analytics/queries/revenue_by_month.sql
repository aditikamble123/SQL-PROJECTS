SELECT
    d.year,
    d.month,
    SUM(o.total_price) AS monthly_revenue
FROM orders_fact o
JOIN date_dim d
    ON o.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
