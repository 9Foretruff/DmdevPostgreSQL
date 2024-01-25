DROP TABLE company_storage.company;

CREATE TABLE company_storage.company
(
    id   INT ,
    name VARCHAR(128) UNIQUE NOT NULL,
    date DATE                NOT NULL CHECK (date > '1995-01-01' AND date < '2025-01-01'),
    PRIMARY KEY (id),
    UNIQUE (name , date)
--NOT NULL
--UNIQUE
--CHECK
--PRIMARY KEY == UNIQUE NOT NULL
--FOREIGN KEY
);

INSERT INTO company (id, name, date)
VALUES (1, 'Google', '2001-01-01'),
       (2, 'Apple', '2002-02-18'),
       (3, 'Facebook', '1993-09-13');

