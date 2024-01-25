--sum , avg , min  , max , count
-- upper , lower
SELECT upper(first_name),
       concat(first_name, ' ', last_name) AS full_name,
       first_name || ' ' || last_name     as full_name,
       now()
FROM employee AS emp;
-- WHERE salary IN (500, 1000, 1500)
--    OR first_name LIKE '%e%'
-- ORDER BY salary

-- > < >= <= = != <>
--BETWEEN
--LIKE (ILIKE)  %         AND - OR
--IN

SELECT now(), 1 * 2 + 3;