SELECT
customer_id,
ROUND(SUM(payment_value),2) revenue
FROM sales_fact
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;

SELECT
ROUND(
SUM(payment_value)/
COUNT(DISTINCT customer_id)
,2)
AS avg_revenue_per_customer
FROM sales_fact;

CREATE OR REPLACE VIEW sales_fact AS
SELECT
    o.order_id,
    c.customer_unique_id,
    c.customer_state,
    p.product_category_name,
    oi.price,
    pay.payment_type,
    pay.payment_value,
    o.order_purchase_timestamp
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN order_payments pay
    ON o.order_id = pay.order_id;
    
    
    SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_unique_id
    FROM sales_fact
    GROUP BY customer_unique_id
    HAVING COUNT(DISTINCT order_id) > 1
) x;

DESCRIBE sales_fact;