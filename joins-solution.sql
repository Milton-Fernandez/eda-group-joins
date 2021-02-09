--1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;

--2 Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "products" ON  "orders".id = "products".id  
JOIN "line_items" ON "products".id = "line_items".product_id;

--3 Which warehouses have cheetos?
SELECT  "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

--4 Which warehouses have diet pepsi?

SELECT  "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

--5 Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, count("customers".id) FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".id;
--6 How many customers do we have?
SELECT count(*) FROM "customers";

--7 How many products do we carry?
SELECT count(*) FROM "products";

--8 What is the total available on-hand quantity of diet pepsi?
SELECT "products".description,sum("line_items".quantity) FROM "products"
JOIN "line_items" ON "line_items".product_id = "products".id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;
