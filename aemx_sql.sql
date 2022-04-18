CREATE TABLE table_main
(	
	id SERIAL PRIMARY KEY ,
	aggregate_level int,
	is_leaf_code int,
	trade_flow_code int,
	reporter_code int,
	partner_code int,
	commodity_code VARCHAR(40),
	netweight DECIMAL(20, 2),
	trade_value DECIMAL(20, 2),
	year_n int,
	month_n int
);


CREATE TABLE table_trade_flow (trade_flow_code INT, trade_flow VARCHAR(100));
CREATE TABLE table_reporter(reporter_code INT, reporter VARCHAR(100));
CREATE TABLE table_partner(partner_code INT, partner VARCHAR(100));
CREATE TABLE table_commodity(commodity_code VARCHAR(30), commodity VARCHAR(350));


SELECT * FROM table_main tm; 
SELECT * FROM table_trade_flow;
SELECT * FROM table_reporter;
SELECT * FROM table_partner;


-- Выведем суммарную стоимость мяса птицы (не живой) в долларах США импортированной Ангологой в 2019:
SELECT SUM(trade_value) as "Суммарная стоимость мяса птицы"
FROM table_main tm 
WHERE commodity_code like '0207%' AND reporter_code = '24' AND trade_flow_code = '1';


-- Cтрана, поставившая в Анголу наибольший объем мяса птицы в стоимостном выражении в марте 2019 года
-- df_bird_angola[df_bird_angola['period'].dt.month == 3].pivot_table(values='trade_value', index='partner', aggfunc='sum').sort_values(by='trade_value', ascending=False).reset_index().head()


SELECT tp.partner AS "Поставщик", SUM(trade_value) AS "Суммарная стоимость"
FROM table_main tm 
JOIN table_partner tp ON tp.partner_code = tm.partner_code
WHERE tm.commodity_code LIKE '0207%' AND tm.reporter_code = '24' AND tm.trade_flow_code = '1' AND tm.month_n = 3
GROUP BY tp.partner
ORDER BY 2 DESC;





-- Структуру импорта (в процентах) мяса птицы Анголой по странам поставщикам по весу

SELECT 
	tp.partner AS "Поставщик", 
	SUM(trade_value) AS "Суммарная стоимость",
	ROUND(SUM(trade_value) / SUM(SUM(trade_value)) OVER () * 100, 2) AS "Доля"
FROM table_main tm 
JOIN table_partner tp ON tp.partner_code = tm.partner_code
WHERE tm.commodity_code LIKE '0207%' AND tm.reporter_code = '24' AND tm.trade_flow_code = '1' AND tm.month_n = 3
GROUP BY tp.partner
ORDER BY 2 DESC;