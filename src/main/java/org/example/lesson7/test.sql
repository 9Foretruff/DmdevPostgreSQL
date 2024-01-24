CREATE TABLE employee
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    salary     INT,
    UNIQUE (first_name, last_name)
);

-- DROP TABLE employee;

INSERT INTO employee (first_name, last_name, salary)
VALUES ('Ivan', 'Ivanov', 500),
       ('Petr', 'Petrov', 900),
       ('Sveta', 'Svetikova', 1000);

