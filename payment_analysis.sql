SELECT
payment_type,
ROUND(SUM(payment_value),2) revenue
FROM sales_fact
GROUP BY payment_type
ORDER BY revenue DESC;