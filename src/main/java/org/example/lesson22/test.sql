SELECT count(*)
FROM company;

SELECT c.name , count(e.id)
FROM company c
         LEFT JOIN employee e
             ON c.id = e.company_id --AND c.name = 'Apple'
GROUP BY c.id
HAVING count(e.id) > 0