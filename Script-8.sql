CREATE TABLE IF NOT EXISTS oc_address (
  address_id int NOT NULL,
  customer_id int NOT NULL,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  company varchar(40) NOT NULL,
  address_1 varchar(128) NOT NULL,
  address_2 varchar(128) NOT NULL,
  city varchar(128) NOT NULL,
  postcode varchar(20) NOT NULL,
  country_id int NOT NULL DEFAULT '0',
  zone_id int NOT NULL DEFAULT '0',
  custom_field text NOT NULL
)



-- 1. Необходимо выгрузить фамилию и возраст, используя JOIN, из следующих таблиц:
CREATE TABLE "A" 
(
"ID" INT PRIMARY KEY, 
	"LastName" VARCHAR(50)
);     
CREATE TABLE "B" 
(
FOREIGN KEY ("ID") REFERENCES "A" ("ID"),
	"ID" INT,
	"Age" VARCHAR(50)
);  

INSERT INTO "A"  ("ID", "LastName")
VALUES
(1, 'Иванов'), (2, 'Петров'), (3, 'Сидоров');

INSERT INTO "B"  ("ID", "Age")
VALUES
(1, '45'), (2, '27'), (3, '32');

SELECT a."LastName" as "Фамилия", b."Age" as "Возраст"
FROM "A" a
JOIN "B" b ON b."ID" = a."ID"
ORDER BY 2


-- 2. В получившейся таблице из задания 1, выберите самого молодого сотрудника:
SELECT a."LastName" as "Фамилия", b."Age" as "Возраст"
FROM "A" a
JOIN "B" b ON b."ID" = a."ID"
WHERE "Age" = (SELECT min("Age") FROM "B")
-- или без WHERE, можно:
-- ORDER BY 2 LIMIT 1



-- 3. Из нижеследующей таблицы выберите данные, где отсутствуют платежи:
CREATE TABLE "C" 
(
"ID" INT PRIMARY KEY, 
	"Payments" VARCHAR(50)
); 
INSERT INTO "C"  ("ID", "Payments")
VALUES
(1, '3000'), (2, null), (3, '1000'), (4, null);

SELECT "ID", "Payments"
FROM "C"
WHERE "Payments" is NULL;


-- 4. Выгрузите название клиента и сумму всех платежей для каждого клиента:
CREATE TABLE "A" 
(
"ID" INT PRIMARY KEY, 
	"Client" VARCHAR(50)
);     
CREATE TABLE "B" 
(
FOREIGN KEY ("ID") REFERENCES "A" ("ID"),
	"ID" INT,
	"Payments" INT
);  

INSERT INTO "A"  ("ID", "Client")
VALUES
(1, 'Bank 1'), (2, 'Bank 2'), (3, 'Bank 3'), (4, 'Bank 4'), (5, 'Bank 5'), (6, 'Bank 6');


INSERT INTO "B"  ("ID", "Payments")
VALUES
(1, 3000), (1, 1000), (2, 5000), (3, 2500), (2, 2000), (5, 1500);


SELECT a."Client" as "Клиент", SUM(b."Payments")
FROM "A" a
JOIN "B" b ON b."ID" = a."ID"
GROUP BY a."Client" 
ORDER BY 1




-- 5. Нарисуйте для каждого из запросов получившуюся таблицу в результате выполнения этих запросов:
CREATE TABLE "A" 
(
"ID" INT PRIMARY KEY, 
	"Client" VARCHAR(50)
);     
CREATE TABLE "B" 
(
	"ID" INT,
	"Payments" INT
);  

INSERT INTO "A"  ("ID", "Client")
VALUES
(1, 'Bank 1'), (2, 'Bank 2'), (4, 'Bank 4'),(6, 'Bank 6');


INSERT INTO "B"  ("ID", "Payments")
VALUES
(1, 3000), (2, 1000), (3, 2000), (4, 4000), (5, 5000);


SELECT "A"."Client", "B"."Payments" FROM "A" LEFT JOIN "B" ON "A"."ID"="B"."ID";
SELECT "A"."Client", "B"."Payments" FROM "A" RIGHT  JOIN "B" ON "A"."ID"="B"."ID";
SELECT "A"."Client", "B"."Payments" FROM "A" INNER  JOIN "B" ON "A"."ID"="B"."ID";
SELECT "A"."Client", "B"."Payments" FROM "A" FULL  JOIN "B" ON "A"."ID"="B"."ID";











