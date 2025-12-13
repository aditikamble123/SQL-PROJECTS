WITH monthly_revenue AS (
    SELECT
        d.year,
        d.month,
        SUM(o.total_price) AS revenue
    FROM orders_fact o
    JOIN date_dim d
        ON o.date_id = d.date_id
    GROUP BY d.year, d.month
)
SELECT
    year,
    month,
    revenue,
    revenue - LAG(revenue) OVER (ORDER BY year, month) AS growth
FROM monthly_revenue;
