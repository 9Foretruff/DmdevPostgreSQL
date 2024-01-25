SELECT
    first_name
FROM employee
WHERE company_id IS NOT NULL
UNION
SELECT
    employee.first_name
FROM employee
WHERE salary IS NOT NULL;