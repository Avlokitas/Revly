WITH monthly_sales AS
(
SELECT
YEAR(order_purchase_timestamp) yr,
MONTH(order_purchase_timestamp) mn,
SUM(payment_value) revenue
FROM sales_fact
GROUP BY yr,mn
)
SELECT *
FROM monthly_sales
ORDER BY yr,mn;


WITH category_sales AS
(
SELECT
product_category_name,
SUM(payment_value) revenue
FROM sales_fact
GROUP BY product_category_name
)

SELECT *
FROM category_sales
ORDER BY revenue DESC;