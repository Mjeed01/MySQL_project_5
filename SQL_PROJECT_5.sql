# Selects customer name and order date by joining customers and orders tables
SELECT customers.customer_name, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;



# Calculates the total sales for each product by joining the products, orders, and sales tables
SELECT products.product_name, SUM(`sales (1)`.total_price) AS total_sales
FROM products
INNER JOIN `sales (1)` ON products.product_id = `sales (1)`.product_ID
INNER JOIN orders ON `sales (1)`.order_id = orders.order_id
GROUP BY products.product_name;



# Finds the top 3 products with the highest sales in the last month by joining the products, orders, and sales tables
SELECT products.product_name, SUM(`sales (1)`.total_price) AS total_sales
FROM products
INNER JOIN `sales (1)` ON products.product_id = `sales (1)`.product_ID
INNER JOIN orders ON `sales (1)`.order_id = orders.order_id
GROUP BY products.product_name
ORDER BY total_sales DESC
LIMIT 3;