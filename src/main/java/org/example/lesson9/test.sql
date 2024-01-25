SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp
WHERE salary >= 1000
ORDER BY first_name, salary DESC;
-- <> == !=

SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp
WHERE last_name LIKE '%ov%'
ORDER BY first_name, salary DESC;

-- ILIKE - dont care about register

SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp
WHERE salary BETWEEN 500 AND 2500
ORDER BY first_name, salary DESC;

-- NOT BETWEEN

SELECT DISTINCT id,
                first_name AS f_name,
                last_name  AS l_name,
                salary
FROM employee AS emp
WHERE salary IN (500, 1000, 1500)
   OR first_name LIKE '%e%'
ORDER BY salary