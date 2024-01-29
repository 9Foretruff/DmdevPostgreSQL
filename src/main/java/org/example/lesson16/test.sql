CREATE DATABASE book_repository;

CREATE TABLE author
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL
);

CREATE TABLE book
(
    id        BIGSERIAL PRIMARY KEY,
    name      VARCHAR(128) NOT NULL,
    year      SMALLINT     NOT NULL,
    pages     SMALLINT     NOT NULL,
    author_id INT REFERENCES author (id)
);


INSERT INTO author (first_name, last_name)
VALUES ('Кей', 'Хорстманн'),
       ('Стивен', 'Кови'),
       ('Тони', 'Роббинс'),
       ('Наполеон', 'Хилл'),
       ('Роберт', 'Кийосаки'),
       ('Дейл', 'Карнеги');

select *
from author;

insert into book (name, year, pages, author_id)
values ('Java. Библиотеку профессионала. Том 1', 2010, 1102, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java. Библиотеку профессионала. Том 2', 2012, 954, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java SE 8. Вводный курс', 2015, 203, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('7 навыков высокоэффективных людей', 1989, 396, (SELECT id FROM author WHERE last_name = 'Кови')),
       ('Разбуди в себе исполина', 1991, 576, (SELECT id FROM author WHERE last_name = 'Роббинс')),
       ('Думай и богатей', 1937, 336, (SELECT id FROM author WHERE last_name = 'Хилл')),
       ('Богатый папа, бедный папа', 1997, 352, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Квадрант денежного потока', 1998, 368, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Как перестать беспокоиться и начать жить', 1948, 368, (SELECT id FROM author WHERE last_name = 'Карнеги')),
       ('Как завоевывать друзей и оказывать влияние на людей', 1936, 352,
        (SELECT id FROM author WHERE last_name = 'Карнеги'));

-- 4.	Написать запрос, выбирающий: название книги, год и имя автора,
-- отсортированные по году издания книги в возрастающем порядке.
--       Написать тот же запрос, но для убывающего порядка.

SELECT name, year, (SELECT author.first_name FROM author WHERE author.id = book.author_id)
FROM book
ORDER BY year ASC;

SELECT name, year, (SELECT author.first_name FROM author WHERE author.id = book.author_id)
FROM book
ORDER BY year DESC;

-- 5.	Написать запрос, выбирающий количество книг у заданного автора.

SELECT count(*)
FROM book
WHERE author_id IN (SELECT id FROM author WHERE first_name LIKE 'Кей');

-- 6.	Написать запрос, выбирающий книги,
-- у которых количество страниц больше среднего количества страниц по всем книгам

SELECT id, name, year, pages, author_id
FROM book
WHERE pages > (SELECT avg(pages) FROM book);

-- 7.	Написать запрос, выбирающий 5 самых старых книг
-- Дополнить запрос и посчитать суммарное количество страниц среди этих книг

SELECT id, name, year, pages, author_id
FROM book
ORDER BY year
LIMIT 5;

SELECT sum(books.pages)
FROM (SELECT id, name, year, pages, author_id
      FROM book
      ORDER BY year
      LIMIT 5) as books;

-- 8.	Написать запрос, изменяющий количество страниц у одной из книг


UPDATE book
SET pages = pages + 5
WHERE id = 5
RETURNING *;

-- 9.	Написать запрос, удаляющий автора, который написал самую большую книгу

SELECT author_id
FROM book
WHERE pages = (SELECT max(pages)
               FROM book);

SELECT max(pages)
FROM book;

DELETE
FROM author
WHERE id = (SELECT author_id
            FROM book
            WHERE pages = (SELECT max(pages)
                           FROM book));

DELETE
FROM book
WHERE author_id = (SELECT author_id
                   FROM book
                   WHERE pages = (SELECT max(pages)
                                  FROM book));

DELETE
FROM author
WHERE id = 1;

