-- Задания на знания SQL
-- Существуют 2 таблицы в базе данных.
-- Book – справочник книг
-- Sales – таблица с продажами книг

-- Таблица Book включает следующие поля:


CREATE TABLE "Book" (
  "BookID" BIGINT NOT NULL, 
  "Author" VARCHAR(100) NOT NULL, 
  "Seria" VARCHAR(255) NULL, 
  "Title" VARCHAR(255) NULL,
  PRIMARY KEY("BookID")
);

-- Таблица Sales включает следующие поля:

CREATE TABLE "Sales" (
	FOREIGN KEY ("BookID") REFERENCES "Book" ("BookID"),
	"BookID" BIGINT NOT NULL,
	"Date" TIMESTAMP NOT NULL,
	"Qt"  INT NULL,
	"Qm"  NUMERIC(9,2) NULL
);

-- Таблицы Book и Sales связываются по полю BookID.

-- Заполним "Book" 
INSERT INTO "Book" (
  "BookID", "Author", "Seria", "Title") 
VALUES 
  (1, 'Ivanov', 'Seria 1', 'Name 1'), 
  (2, 'Ivanov 1', 'Seria 2', 'Name 2'), 
  (3, 'Ivanov 3', 'Seria 3', 'Name 3'), 
  (4, 'Ivanov 4', 'Seria 4', 'Name 4'), 
  (5, 'Ivanov 5', 'Seria 5', 'Name 5'), 
  (6, 'Ivanov 6', 'Seria 6', 'Name 6'), 
  (7, 'Ivanov 7', NULL, 'Name 7'), 
  (8, 'Ivanov 8', 'Seria 11', 'Name 8'), 
  (9, 'Ivanov 9', 'Seria 10', 'Name 9'), 
  (10, 'Ivanov 10', 'Seria 11', NULL), 
  (11, 'Ivanov 11', 'Seria 11', 'Name 11'), 
  (12, 'Ivanov 12', 'Seria 12', 'Name 12'), 
  (13, 'Ivanov 13', 'Seria 14', 'Name 13'), 
  (14, 'Ivanov 14', 'Seria 15', 'Name 14'), 
  (15, 'Ivanov 15', 'Seria 16', 'Name 15'), 
  (16, 'Ivanov 16', NULL, 'Name 16'), 
  (17, 'Ivanov 17', 'Seria 18', 'Name 17'), 
  (18, 'Ivanov 18', 'Seria 19', 'Name 18'), 
  (19, 'Ivanov 19', 'Seria 20', 'Name 19'), 
  (20, 'Ivanov 20', 'Seria 21', 'Name 20'), 
  (21, 'Ivanov 21', 'Seria 22', 'Name 21'), 
  (22, 'Ivanov 1', 'Seria 23', 'Name 22'), 
  (23, 'Ivanov 2', 'Seria 24', 'Name 23'), 
  (24, 'Ivanov 3', 'Seria 25', 'Name 24'), 
  (25, 'Ivanov 4', 'Seria 26', 'Name 26'), 
  (26, 'Ivanov 5', 'Seria 27', 'Name 27'), 
  (27, 'Ivanov 6', 'Seria 28', 'Name 28'), 
  (28, 'Ivanov 7', 'Seria 29', 'Name 29'), 
  (29, 'Ivanov 8', 'Seria 30', 'Name 30'), 
  (30, 'Ivanov 9', 'Seria 31', 'Name 31'), 
  (31, 'Ivanov 10', 'Seria 32', 'Name 31'), 
  (32, 'Ivanov 11', 'Seria 33', 'Name 31');  

 
-- Заполним "Sales" 
 INSERT INTO "Sales" (
  "BookID", "Date", "Qt", "Qm") 
VALUES 
  (1, '2022-01-22 19:10:25', 110, 20),
  (2, '2022-01-22 19:10:25', 210, 200),
  (3, '2022-02-22 19:10:25', 710, 200),
  (4, '2022-02-22 19:10:25', 10, 20),
  (5, '2022-02-22 19:10:25', 10, 212),
  (6, '2022-03-22 19:10:25', 710, 22120),
  (7, '2022-04-22 19:10:25', 10, 24540),
  (8, '2022-06-22 19:10:25', 910, 2450),
  (9, '2022-01-22 19:10:25', 810, 270),
  (10, '2022-06-22 19:10:25', 410, 27870),
  (1, '2022-01-22 19:10:25', 510, 2450),
  (2, '2021-06-22 19:10:25', 710, 120),
  (21, '2021-01-22 19:10:25', 910, 12120),
  (22, '2021-01-22 19:10:25', 310, 45720),
  (23, '2021-01-22 19:10:25', 810, 7820),
  (24, '2021-06-22 19:10:25', 10, 9820),
  (2, '2021-01-22 19:10:25', 10, 78920),
  (5, '2021-01-22 19:10:25', 710, 220),
  (6, '2021-01-22 19:10:25', 10, 45620),
  (8, '2021-06-22 19:10:25', 610, 787920),
  (9, '2021-06-22 19:10:25', 610, 8720),
  (15, '2021-06-22 19:10:25', 410, 78920),
  (15, '2021-06-22 19:10:25', 710, 54620),
  (28, '2021-08-22 19:10:25', 510, 45620),
  (28, '2021-07-22 19:10:25', 510, 212320),
  (29, '2021-08-22 19:10:25', 810, 45620),
  (30, '2021-08-22 19:10:25', 410, 24560),
  (12, '2021-06-22 19:10:25', 140, 45620),
  (1, '2021-10-22 19:10:25', 810, 45620),
  (31, '2021-11-22 19:10:25', 150, 45620),
  (30, '2022-01-22 19:10:25', 110, 20),
  (29, '2022-01-22 19:10:25', 210, 200),
  (28, '2022-02-22 19:10:25', 710, 200),
  (27, '2022-02-22 19:10:25', 10, 20),
  (26, '2022-02-22 19:10:25', 10, 212),
  (25, '2022-03-22 19:10:25', 710, 22120),
  (24, '2022-04-22 19:10:25', 10, 24540),
  (23, '2022-06-22 19:10:25', 910, 2450),
  (22, '2022-01-22 19:10:25', 810, 270),
  (21, '2022-06-22 19:10:25', 410, 27870),
  (20, '2022-01-22 19:10:25', 510, 2450),
  (19, '2021-06-22 19:10:25', 710, 120),
  (18, '2021-01-22 19:10:25', 910, 12120),
  (17, '2021-01-22 19:10:25', 310, 45720),
  (16, '2021-01-22 19:10:25', 810, 7820),
  (15, '2021-06-22 19:10:25', 10, 9820),
  (14, '2021-01-22 19:10:25', 10, 78920),
  (13, '2021-01-22 19:10:25', 710, 220),
  (12, '2021-01-22 19:10:25', 10, 45620),
  (11, '2021-06-22 19:10:25', 610, 787920),
  (10, '2021-06-22 19:10:25', 610, 8720),
  (9, '2021-06-22 19:10:25', 410, 78920),
  (8, '2021-06-22 19:10:25', 710, 54620),
  (7, '2021-08-22 19:10:25', 510, 45620),
  (6, '2021-07-22 19:10:25', 510, 212320),
  (5, '2021-08-22 19:10:25', 810, 45620),
  (4, '2021-08-22 19:10:25', 410, 24560),
  (3, '2021-06-22 19:10:25', 140, 45620),
  (2, '2021-10-22 19:10:25', 810, 45620),
  (1, '2021-11-22 19:10:25', 150, 45620);
   
 
 
-- Заполним "Sales" для 3 ей задачи 
 INSERT INTO "Sales" (
  "BookID", "Date", "Qt", "Qm") 
VALUES 
  (1, '2022-02-22 19:10:25', 110, 200),
  (1, '2022-02-22 19:10:25', 210, 345),
  (1, '2022-03-22 19:10:25', 710, 642),
  (1, '2022-03-22 19:10:25', 680, 5422),
  (4, '2022-02-22 19:10:25', 110, 2020),
  (4, '2022-02-22 19:10:25', 210, 3435),
  (4, '2022-03-22 19:10:25', 710, 61422),
  (4, '2022-03-22 19:10:25', 680, 1542);
 
 INSERT INTO "Sales" (
  "BookID", "Date", "Qt", "Qm") 
VALUES 
  (10, '2022-02-22 19:10:25', 710, 642),
  (10, '2022-02-22 19:10:25', 680, 5422),
  (10, '2022-03-22 19:10:25', 710, 642),
  (10, '2022-03-22 19:10:25', 680, 5422);
 
 INSERT INTO "Sales" (
  "BookID", "Date", "Qt", "Qm") 
VALUES 
  (11, '2022-02-22 19:10:25', 7100, 6420),
  (11, '2022-02-22 19:10:25', 680, 5422),
  (11, '2022-03-22 19:10:25', 710, 642),
  (11, '2022-03-22 19:10:25', 680, 5422); 
 
 
 
-- DELETE FROM "Book"  WHERE "BookID"!=1;

-- 1. Вывести список ТОП-10 авторов по продажам в 2021 году
SELECT 
  b."Author", 
  SUM(s."Qm") as "Total, rub" 
FROM 
  "Sales" s 
  JOIN "Book" b ON s."BookID" = b."BookID" 
WHERE 
  date_part('year', s."Date") = '2021' 
GROUP BY 
  b."Author" 
ORDER BY 
  2 DESC
LIMIT 10;
 

-- 2.	Вывести общий объём продаж книг, которые начали продаваться во втором полугодии 2021 года.
SELECT 
  SUM(s."Qt") as "Volume, PCS" 
FROM 
  "Sales" s 
  JOIN "Book" b ON s."BookID" = b."BookID" 
WHERE 
  s."Date" BETWEEN '2021-06-01' 
  AND '2021-12-31';

 
-- 3. Вывести таблицу, в которой Посчитать количество книг (т.е. SKU), средняя цена которых упала / выросла в марте 2021 г. по сравнению с февралём
SELECT
	b."BookID",
   EXTRACT(MONTH FROM s."Date") as "Month", 
    EXTRACT(YEAR FROM s."Date") as "Year", 
    AVG(s."Qm"),
    FIRST_VALUE(AVG(s."Qm")) OVER (Partition BY b."BookID") as "first",
   LAST_VALUE(AVG(s."Qm")) OVER (Partition BY b."BookID") as "balance",
   FIRST_VALUE(AVG(s."Qm")) OVER (Partition BY b."BookID") - LAST_VALUE(AVG(s."Qm")) OVER (Partition BY b."BookID")
FROM 
    "Sales" s 
JOIN "Book" b ON s."BookID" =b."BookID"
WHERE EXTRACT(MONTH FROM s."Date") = 2 OR EXTRACT(MONTH FROM s."Date") = 3 AND EXTRACT(YEAR FROM s."Date") = 2022
GROUP BY 
    b."BookID", EXTRACT(MONTH FROM s."Date"), EXTRACT(YEAR FROM s."Date")
   HAVING COUNT(b."BookID") > 1;

  
  
/* Решеаем через join */
  
SELECT b."BookID", AVG(s."Qm") as "Feb"
FROM "Sales" s 
JOIN "Book" b ON s."BookID" =b."BookID" 
WHERE EXTRACT(MONTH FROM s."Date") = 2 AND EXTRACT(YEAR FROM s."Date") = 2022
GROUP BY b."BookID";

SELECT b."BookID", AVG(s."Qm") as "Mar"
FROM "Sales" s 
JOIN "Book" b ON s."BookID" =b."BookID" 
WHERE EXTRACT(MONTH FROM s."Date") = 3 AND EXTRACT(YEAR FROM s."Date") = 2022
GROUP BY b."BookID";

SELECT
	t1."BookID",
	t1."Feb",
	t2."Mar",
	t2."Mar" - t1."Feb",
	CASE WHEN t2."Mar" - t1."Feb" != 0 THEN 'сhange' END as "Case",
	COUNT(CASE WHEN t2."Mar" - t1."Feb" != 0 THEN 'сhange' END) OVER () AS COUNT
FROM 
	(
	SELECT 
		b."BookID", 
		AVG(s."Qm") as "Feb"
	FROM 
		"Sales" s 
		JOIN "Book" b ON s."BookID" =b."BookID" 
	WHERE
		EXTRACT(MONTH FROM s."Date") = 2 AND EXTRACT(YEAR FROM s."Date") = 2022
	GROUP BY
		b."BookID"
	) t1
	JOIN (
		SELECT 
			b."BookID",
			AVG(s."Qm") as "Mar"
		FROM 
			"Sales" s 
			JOIN "Book" b ON s."BookID" =b."BookID" 
		WHERE 
			EXTRACT(MONTH FROM s."Date") = 3 AND EXTRACT(YEAR FROM s."Date") = 2022
		GROUP BY
			b."BookID"
	) t2 ON t1."BookID" = t2."BookID"; 



/* Для задачи */
SELECT
	COUNT(CASE WHEN t2."Mar" - t1."Feb" != 0 THEN 'сhange' END) OVER () AS "Кол-во книг"
FROM
	-- таблица с книгами за февраль 2022
	(
	SELECT 
		b."BookID", 
		AVG(s."Qm") as "Feb"
	FROM 
		"Sales" s 
		JOIN "Book" b ON s."BookID" =b."BookID" 
	WHERE
		EXTRACT(MONTH FROM s."Date") = 2 AND EXTRACT(YEAR FROM s."Date") = 2022
	GROUP BY
		b."BookID"
	) t1
	-- соединим таблицу за ферваль с таблицой за март 2021
	JOIN (
		SELECT 
			b."BookID",
			AVG(s."Qm") as "Mar"
		FROM 
			"Sales" s 
			JOIN "Book" b ON s."BookID" =b."BookID" 
		WHERE 
			EXTRACT(MONTH FROM s."Date") = 3 AND EXTRACT(YEAR FROM s."Date") = 2022
		GROUP BY
			b."BookID"
	) t2 ON t1."BookID" = t2."BookID"
LIMIT 1; 




-- 4. Допустим, в таблице Sales 1 млрд строк. Как бы вы настроили индексы, чтобы такие запросы выполнялись быстро? Почему именно так?




