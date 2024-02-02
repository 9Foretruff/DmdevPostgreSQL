SELECT c.name,
       e.first_name
FROM company c
         LEFT JOIN employee e
                   ON c.id = e.company_id;

INSERT INTO company(id, name, date)
VALUES (4, 'Amazon', '2020-01-01');

SELECT c.name,
       e.first_name
FROM employee e
         LEFT JOIN company c
                   ON e.company_id = c.id;

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('IvanOOO', 'IvanovAA', 5001, NULL);

SELECT c.name,
       e.first_name
FROM employee e
         RIGHT JOIN company c
                    ON e.company_id = c.id
                        AND c.date > '2001-01-01';

--FULL JOIN

SELECT c.name,
       e.first_name
FROM employee e
         FULL JOIN company c
             ON e.company_id = c.id;
