CREATE DATABASE revly;
USE revly;
SHOW TABLES;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM order_payments;

CREATE VIEW sales_fact AS
SELECT
    o.order_id,
    o.customer_id,
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
    
    