INSERT INTO employee (first_name, last_name, salary)
VALUES ('Ivan', 'Ivanov', 500),
       ('Petr', 'Petrov', 900),
       ('Petr', 'Sidorov', 1900),
       ('Sveta', 'Svetikova', 1000);


SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp;

SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp
ORDER BY first_name , salary DESC
-- LIMIT 2
-- OFFSET 2;