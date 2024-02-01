SELECT company.name,
       employee.first_name || employee.last_name fio
FROM employee,
     company
WHERE employee.company_id = company.id;

-- так щас не делают
--декартовое произвидение

SELECT *
FROM company;


--JOIN
--CROSS JOIN
--LEFT JOIN
--RIGHT JOIN
--FULL JOIN

SELECT c.name,
       employee.first_name || ' ' || employee.last_name fio
FROM employee
         JOIN company c
              ON c.id = employee.company_id
ORDER BY company_id;

CREATE TABLE contact
(
    id     BIGSERIAL PRIMARY KEY,
    number VARCHAR(128) NOT NULL,
    type   VARCHAR(128)
);

create table employee_contact
(
    employee_id BIGINT REFERENCES employee (id),
    contact_id  BIGINT REFERENCES contact (id),
    PRIMARY KEY (employee_id, contact_id)
);

insert into contact (number, type)
values ('234-56-78', 'домашний'),
       ('987-65-43', 'рабочий'),
       ('565-25-91', 'мобильный'),
       ('332-55-67', NULL),
       ('465-11-22', NULL);

insert into employee_contact (employee_id, contact_id)
values (1, 1),
       (1, 2),
       (2, 2),
       (2, 3),
       (3, 4),
       (4, 5);

SELECT c.name,
       employee.first_name || ' ' || employee.last_name fio,
       ec.contact_id,
       CONCAT(c2.number, ' ', c2.type)
FROM employee
         JOIN company c
              ON c.id = employee.company_id
         JOIN employee_contact ec
              ON employee.id = ec.employee_id
         JOIN contact c2
              ON c2.id = ec.contact_id
ORDER BY company_id;

SELECT *
FROM employee
         CROSS JOIN company c;