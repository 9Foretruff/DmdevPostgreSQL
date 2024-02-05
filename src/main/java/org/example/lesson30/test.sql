EXPLAIN
SELECT *
FROM ticket
WHERE id = 5;

EXPLAIN
SELECT *
FROM ticket
WHERE passenger_name LIKE 'Иван%';

-- Seq Scan — читается вся таблица.
-- Index Scan — используется индекс для условий WHERE, читает таблицу при отборе строк.
-- Bitmap Index Scan — сначала Index Scan, затем контроль выборки по таблице. Эффективно для большого количества строк.
-- Index Only Scan — самый быстрый. Читается только индекс.

-- синтаксический ( rule based ) оптимизатор
-- стоимостной ( cost based )

-- page_cost (input-output) = 1.0
-- cpu_cost 0.01

-- 55 * 0.01 = 0.55 (cpu cost)
-- 1 * 1.0 = 1.0 (page_cost)
-- 1.55

-- 8 + 6 + 28 + 8 + 2 + 8 = 60

SELECT avg(bit_length(passenger_no) / 8),
       avg(bit_length(passenger_name) / 8),
       avg(bit_length(seat_no) / 8)
FROM ticket;

SELECT reltuples,
       relkind,
       relpages
FROM pg_class
WHERE relname = 'ticket';

EXPLAIN
SELECT flight_id , count(*)
FROM ticket
GROUP BY flight_id
