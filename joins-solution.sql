--1. Get all customers and their addresses.
SELECT * FROM customers, addresses

SELECT customer.id AS id, first_name, last_name, street, city, state, zip, address_type
FROM customers 
JOIN addresses  ON (customer.id = addresses.customer_id);

--2.Get all orders and their line items (orders, quantity and product).
SELECT * FROM orders, line_items, products

SELECT "orders".order_date, "line_items".quantity, "products".description, "products".unit_price, ("line_items".quantity * "products".unit_price) AS order_total
FROM line_items li
JOIN "orders" ON ("orders".id = "line_items".order_id)
JOIN "products" ON ("products".id = "line_items".product_id);

--3.Which warehouses have cheetos?
SELECT * FROM warehouse, warehouse_product, products

SELECT w.warehouse
FROM "products" 
JOIN warehouse_product wp ON ("products".id = wp.product_id)
JOIN warehouse w ON (w.id = wp.warehouse_id)
WHERE "products".description = 'cheetos';

--BETA WAREHOUSE
--4.Which warehouses have diet pepsi?
SELECT * FROM warehouse, warehouse_product, products
--Beta Warehouse