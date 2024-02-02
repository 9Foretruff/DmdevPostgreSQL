CREATE VIEW employee_view AS
SELECT company.name,
       e.salary,
       e.first_name,
       e.last_name,
       count(e.id) OVER (),
       max(salary) OVER (PARTITION BY company.id),
       avg(salary) OVER (),
       row_number() over (),
       rank() OVER (ORDER BY salary DESC NULLS LAST ),
       dense_rank() OVER (PARTITION BY company.id ORDER BY salary DESC NULLS LAST ),
       lag(e.salary) OVER (ORDER BY e.salary)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
ORDER BY company.id;

DROP VIEW employee_view;

SELECT *
FROM employee_view;
-- WHERE name = 'Google';

CREATE MATERIALIZED VIEW m_employee_view AS
SELECT company.name,
       e.salary,
       count(e.id) OVER (),
       max(salary) OVER (PARTITION BY company.id),
       avg(salary) OVER (),
       row_number() over (),
       rank() OVER (ORDER BY salary DESC NULLS LAST ),
       dense_rank() OVER (PARTITION BY company.id ORDER BY salary DESC NULLS LAST ),
       lag(e.salary) OVER (ORDER BY e.salary)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
ORDER BY company.id;

SELECT *
FROM m_employee_view;
-- WHERE max = 15000;

REFRESH MATERIALIZED VIEW m_employee_view;
