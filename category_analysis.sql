SELECT
product_category_name,
ROUND(SUM(payment_value),2) revenue
FROM sales_fact
GROUP BY product_category_name
ORDER BY revenue DESC;

SELECT
product_category_name,
COUNT(*) orders_count
FROM sales_fact
GROUP BY product_category_name
ORDER BY orders_count DESC
LIMIT 10;

SELECT
product_category_name,
COUNT(*) orders_count
FROM sales_fact
GROUP BY product_category_name
ORDER BY orders_count
LIMIT 10;