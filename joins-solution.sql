--Base Goals

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

--Stretch
--9 How much was the total cost for each order?
SELECT o."id", SUM(li."quantity" * p."unit_price") FROM "orders" as o
JOIN "line_items" as li on o."id" = li."order_id"
JOIN "products" as p on p."id" = li."product_id"
GROUP BY o."id" ORDER BY o."id";

--10 How much has each customer spent in total?
SELECT c."id", SUM(li."quantity" * p."unit_price") FROM "customers" as c
JOIN "addresses" as a on c."id" = a."customer_id"
JOIN "orders" as o on a."id" = o."address_id"
JOIN "line_items" as li on o."id" = li."order_id"
JOIN "products" as p on p."id" = li."product_id"
GROUP BY c."id" ORDER BY c."id";