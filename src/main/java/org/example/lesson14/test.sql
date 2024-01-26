DELETE
FROM employee
WHERE salary IS NULL;

SELECT *
FROM employee;

DELETE
FROM company
WHERE id = 2;

DELETE
FROM employee
WHERE company_id = 1;

DELETE
FROM employee
WHERE salary = (SELECT max(salary) FROM employee);

CREATE TABLE employee
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    salary     INT,
    company_id INT REFERENCES company (id) ON DELETE CASCADE,
    UNIQUE (first_name, last_name)
--     FOREIGN KEY (company_id) REFERENCES company
);

DROP TABLE employee;

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ivan', 'Ivanov', 500 , 1),
       ('Petr', 'Petrov', 900 ,  2),
       ('Petr', 'Sidorov', 1900,3),
       ('Sveta', 'Svetikova', 3000,2),
       ('Oleg', 'Olegov', 2500,3),
       ('Maksim', 'Rokitko', 15000,1);