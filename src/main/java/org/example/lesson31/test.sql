EXPLAIN
SELECT *
FROM ticket
WHERE id = 25;

CREATE TABLE test1
(
    id      SERIAL PRIMARY KEY,
    number1 INT         NOT NULL,
    number2 INT         NOT NULL,
    value   VARCHAR(32) NOT NULL
);

INSERT INTO test1(number1, number2, value)
SELECT random() * generate_series,
       random() * generate_series,
       generate_series
FROM generate_series(1, 100000);

CREATE INDEX test1_number1_idx ON test1 (number1);
CREATE INDEX test1_number2_idx ON test1 (number2);

SELECT relname,
       reltuples,
       relkind,
       relpages
FROM pg_class
WHERE relname like 'test1%';

ANALYSE  test1;

EXPLAIN ANALYSE
SELECT *
FROM test1
WHERE value = '99999';

EXPLAIN ANALYSE
SELECT *
FROM test1
WHERE number1 = 82722; -- index scan

EXPLAIN ANALYSE
SELECT number1
FROM test1
WHERE number1 = 82722; -- index only

EXPLAIN ANALYSE
SELECT *
FROM test1
WHERE number1 < 1000 AND number1 > 90000; -- index only
