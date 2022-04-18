-- Задача 3.
-- Переменная Сash_flow (денежный поток) = выручка - затраты за день.
--  Рассчитайте нарастающий итог денежного потока за каждый день.

CREATE TABLE transactions 
(
	"date" timestamp,
	"Cash_flow" INT
);


INSERT INTO transactions  ("date", "Cash_flow")
VALUES
('2020-01-01', -110), ('2020-01-02', -50), ('2020-01-03', 0), ('2020-01-04', 1000), ('2020-01-05', 1500), ('2020-01-06', 1700)

SELECT a."date" as "Дата", SUM(b."Cash_flow") as "Нарастающий итог"
FROM transactions a
JOIN transactions b ON a."date" >= b."date"
GROUP BY a."date"
ORDER BY 1








-- Задача 5. Переменная depname – название департамента, emp_id – идентификатор сотрудника, salary – суммарная зарплата.
-- Найдите сотрудника с самой большой зарплатой (учитывая случай одинаковых зарплат).


CREATE TABLE salaries 
(
	"depname" VARCHAR(10),
	"Emp_id" INT PRIMARY KEY, 
	"salary" INT
);

INSERT INTO salaries  ("depname", "Emp_id", "salary")
VALUES
('develop', 1, 100), ('develop', 2, 1000), ('develop', 3, 10450), ('sales', 4, 10), ('develop', 5, 1045450), ('sales', 6, 1045450), ('develop', 7, 10054);

select * from salaries;

SELECT "Emp_id", salary
FROM salaries
WHERE salary = (SELECT MAX(salary) FROM salaries);


-- Задача 6.
-- Используя предыдущую таблицу добавьте столбец, в котором будет указана средняя зарплата в департаменте.
SELECT depname, AVG(salary) as avg_salary
FROM salaries
GROUP BY depname
ORDER BY 2




-- Задача 7.
-- Переменная session_id – уникальный идентификатор сессии, length_sec – продолжительность сессии в секундах.
-- Найдите количество сеансов, которые попадают в промежутки по 5 секунд.


CREATE TABLE sessions 
(
	session_id INT PRIMARY KEY, 
	length_sec INT
);

INSERT INTO sessions  (session_id, length_sec)
VALUES
(1, 12), (2, 5), (3, 142), (4, 5), (5, 12), (6, 12), (7, 12), (8, 12), (9, 5), (10, 5);


SELECT session_id, length_sec
FROM sessions
WHERE length_sec = 5

SELECT COUNT(session_id) AS "Количество сеансов по 5 секунд"
FROM sessions
WHERE length_sec = 5



-- Задача 8.
-- Есть таблица covid вида

CREATE TABLE covid 
(
	region VARCHAR(15), 
	ttl INT
);

INSERT INTO covid (region, ttl)
VALUES
('Мск', 22212), ('Спб', 222), ('Нвс', 23212), ('Птз', 24212), ('Нвг', 27212), ('Иван', 28812), ('Катя', 21012), ('Вася', 20212)


select * from covid

SELECT a.region as "Первый регион", b.region "Второй регион"
FROM covid a
CROSS JOIN covid b
WHERE ABS(a.ttl - b.ttl) <= 1000 AND a.ttl < b.ttl


SELECT
    a.state as state_a, 
    b.state as state_b 
 FROM   
    state_streams a
 CROSS JOIN 
    state_streams b 
 WHERE 
    ABS(a.total_streams - b.total_streams) < 1000
    AND 
    a.state <> b.state 



