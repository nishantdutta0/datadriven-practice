WITH monthly_sales AS (
    SELECT
        product_id,
        SUBSTR(transaction_date, 1, 7) AS month,
        SUM(total_amount) AS monthly_total
    FROM transactions
    WHERE product_id IS NOT NULL
    GROUP BY product_id, SUBSTR(transaction_date, 1, 7)
)
SELECT
    product_id,
    month,
    monthly_total,
    SUM(monthly_total) OVER (
        PARTITION BY product_id
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_total
FROM monthly_sales
ORDER BY product_id, month;
