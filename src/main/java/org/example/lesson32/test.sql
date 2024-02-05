EXPLAIN ANALYSE
SELECT *
FROM test1
WHERE number1 < 10000;

CREATE TABLE test2
(
    id      SERIAL PRIMARY KEY,
    test_id INT REFERENCES test1 (id) NOT NULL,
    number1 INT                       NOT NULL,
    number2 INT                       NOT NULL,
    value   VARCHAR(32)               NOT NULL
);

INSERT INTO test2(test_id, number1, number2, value)
SELECT id,
       random() * number1,
       random() * number2,
       value
FROM test1;

CREATE INDEX test2_number1_idx ON test2 (number1);
CREATE INDEX test2_number2_idx ON test2 (number2);
CREATE INDEX test2_test_id_idx ON test2 (test_id);

EXPLAIN ANALYSE
SELECT *
FROM test1
         JOIN test2 t
              ON test1.id = t.test_id;

-- NESTED LOOP
-- HASH JOIN
-- MERGE JOIN

EXPLAIN ANALYSE
SELECT *
FROM test1
         JOIN test2 t
              ON test1.id = t.test_id;

ANALYSE test2;
