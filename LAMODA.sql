-- Создадим таблицу order
CREATE TABLE "Order" 
(	"Created dttm" timestamp , 
    ID INT PRIMARY KEY, 
    "Order number" VARCHAR(50)
   );

-- Создадим отношние Order position  
CREATE TABLE "Order position" 
(	ID INT,
	"Position number" VARCHAR(30),
	"Product id" DECIMAL(10,0),
	"State" VARCHAR(30),
	"Order ID" INT,
	FOREIGN KEY ("Order ID") REFERENCES "Order" (ID)
);

-- Заполним их
INSERT INTO "Order"  ("Created dttm", ID, "Order number")
VALUES
('2020-02-10 7:00', 40008, 'RU0004'),
('2020-03-10 7:00', 40009, 'KZ0005'),
('2020-03-10 7:00', 40010, 'RU0005'),
('2020-04-10 7:00', 40011, 'KZ0006'),
('2020-04-10 7:00', 40012, 'KZ0007'),
('2020-06-10 7:00', 40013, 'RU0006'),
('2020-07-10 7:00', 40014, 'KZ0008');

INSERT INTO "Order position"   (ID, "Position number", "Product id", "State" , "Order ID")
VALUES
(108, 'RU0004-1', 1008, 'SHIIPED', 40008),
(109, 'RU0004-2', 1009, 'CANCELLED', 40008),
(110, 'RU0005-1', 1010, 'CANCELLED', 40010),
(111, 'KZ0006-2', 1011, 'CANCELLED', 40011),
(112, 'KZ0007-1', 1012, 'CANCELLED',40012),
(113, 'RU0006-2', 1013, 'SHIIPED', 40013),
(114, 'KZ0008-1', 1014, 'SHIIPED', 40014);


-- Выберем данные за 5 месяц
SELECT
   SUBSTRING("Order number", 1, 2 ) AS Country
FROM
   "Order"
where EXTRACT(MONTH FROM "Created dttm")= 5;


-- Задача 1: С помощью SQL-запроса найти, сколько в среднем товаров находится в одном заказе в
-- разрезе стран (RU, KZ) для заказов, созданных в мае 2020 года

-- Сделаем общуюю таблиц
select 
*
from "Order position" op
join "Order" o on  o."id" = op."Order ID"
WHERE EXTRACT(MONTH FROM o."Created dttm")= 5;

-- подсчитаем среднее
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

-- Сделаем общуюю таблиц
select 
*
from "Order position" op
join "Order" o on  o."id" = op."Order ID";




SELECT 
	last_value ("Product id") OVER (PARTITION BY "Created dttm" ORDER BY 1 DESC) AS "Product ID",
	last_value ("Order number") OVER (PARTITION BY "Created dttm" ORDER BY 1 DESC) AS "Order number",
	EXTRACT(MONTH FROM o."Created dttm") AS "Month"
FROM "Order position" op
JOIN "Order" o ON  o."id" = op."Order ID"
WHERE op."Product id" = 1006;



-- Задача 3: С помощью SQL-запроса найти процент отмененных (CANCELLED) позиций заказов, 
-- созданных с начала 2020 года по месяцам

-- Сделаем общуюю таблиц
SELECT 
*
from "Order position" op
join "Order" o on  o."id" = op."Order ID";

-- найдем процент отмененых позиций по месяцам
SELECT 
		EXTRACT(MONTH FROM o."Created dttm") AS "Month",
		count(CASE "State" WHEN 'CANCELLED' THEN 1 ELSE NULL END) * 1.00 / COUNT("State") AS "%, cancelled"
FROM "Order position" op
JOIN "Order" o ON  o."id" = op."Order ID"
GROUP BY EXTRACT(MONTH FROM o."Created dttm")
ORDER BY 1;


