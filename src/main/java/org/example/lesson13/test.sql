SELECT *
FROM employee
ORDER BY salary
LIMIT 2;

SELECT avg(emp1.salary)
FROM (SELECT *
      FROM employee
      ORDER BY salary DESC
      LIMIT 2) AS emp1;

SELECT *,
       (SELECT avg(salary) FROM employee)          avg,
       (SELECT max(salary) FROM employee)          max,
       (SELECT max(salary) FROM employee) - salary diff
FROM employee;

SELECT *
FROM employee
WHERE company_id IN (SELECT id FROM company WHERE name LIKE 'Google');

SELECT *
FROM (SELECT *
      FROM (VALUES ('Ivan', 'Ivanov', 500, 1),
                   ('Petr', 'Petrov', 900, 2),
                   ('Petr', 'Sidorov', 1900, 3),
                   ('Sveta', 'Svetikova', 3000, 2),
                   ('Oleg', 'Olegov', 2500, 3),
                   ('Maksim', 'Rokitko', 15000, 1)) ) AS table1;