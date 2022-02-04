-- Задача 1: С помощью SQL-запроса найти, сколько в среднем товаров находится в одном заказе в
-- разрезе стран (RU, KZ) для заказов, созданных в мае 2020 года

SELECT 
   SUBSTRING("Position number", 1, 2 ) AS Country,
   COUNT(DISTINCT "Order ID")  * 1.00 / count(op."Product id") AS "Products per order"
FROM "Order position" op
JOIN "Order" o ON  o."id" = op."Order ID"
WHERE EXTRACT(MONTH FROM o."Created dttm")= 5
GROUP BY SUBSTRING("Position number", 1, 2 );


-- Задача 2: С помощью SQL-запроса найти последний созданный заказ для товара (Product ID) 
-- 9589688538 и месяц, в котором был создан заказ. Задание выполнить с использованием оконных 
-- функций.

SELECT 
	last_value ("Product id") OVER (PARTITION BY "Created dttm" ORDER BY 1 DESC) AS "Product ID",
	last_value ("Order number") OVER (PARTITION BY "Created dttm" ORDER BY 1 DESC) AS "Order number",
	EXTRACT(MONTH FROM o."Created dttm") AS "Month"
FROM "Order position" op
JOIN "Order" o ON  o."id" = op."Order ID"
WHERE op."Product id" = 9589688538;



-- Задача 3: С помощью SQL-запроса найти процент отмененных (CANCELLED) позиций заказов, 
-- созданных с начала 2020 года по месяцам


SELECT 
		EXTRACT(MONTH FROM o."Created dttm") AS "Month",
		count(CASE "State" WHEN 'CANCELLED' THEN 1 ELSE NULL END) * 1.00 / COUNT("State") AS "%, cancelled"
FROM "Order position" op
JOIN "Order" o ON  o."id" = op."Order ID"
GROUP BY EXTRACT(MONTH FROM o."Created dttm")
ORDER BY 1;