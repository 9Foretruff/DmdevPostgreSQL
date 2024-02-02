SELECT company.name,
       e.last_name,
       count(e.id) OVER ()
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
ORDER BY company.name;

SELECT company.name,
       count(e.id)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
GROUP BY company.name
ORDER BY company.name;

SELECT count(e.id)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
GROUP BY company.name;

SELECT company.name,
       count(e.id),
       max(salary)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
GROUP BY company.name
ORDER BY company.name;

SELECT company.name,
       e.salary,
       count(e.id) OVER (),
       max(salary) OVER(PARTITION BY company.id),
       avg(salary) OVER (),
       row_number() over (),
       rank() OVER (ORDER BY salary DESC NULLS LAST ),
       dense_rank() OVER (PARTITION BY company.id ORDER BY salary DESC NULLS LAST ),
       lag(e.salary) OVER (ORDER BY e.salary)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
ORDER BY company.id;