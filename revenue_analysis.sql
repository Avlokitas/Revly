SELECT
ROUND(SUM(payment_value),2) AS total_revenue
FROM sales_fact;

SELECT
YEAR(order_purchase_timestamp) AS year,
MONTH(order_purchase_timestamp) AS month,
ROUND(SUM(payment_value),2) AS revenue
FROM sales_fact
GROUP BY year,month
ORDER BY year,month;

SELECT
customer_state,
ROUND(SUM(payment_value),2) AS revenue
FROM sales_fact
GROUP BY customer_state
ORDER BY revenue DESC;