SELECT *
FROM employee;

UPDATE employee
SET company_id = 3,
    salary     = salary + 500
WHERE id = 6
RETURNING id , first_name || ' ' || last_name fio;