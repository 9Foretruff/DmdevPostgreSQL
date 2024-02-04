CREATE DATABASE flight_repository;

CREATE TABLE airport
(
    code    CHAR(3) PRIMARY KEY,
    country VARCHAR(256) NOT NULL,
    city    VARCHAR(128) NOT NULL
);

-- ALTER TABLE airport RENAME COLUMN county TO country;

CREATE TABLE aircraft
(
    id    SERIAL PRIMARY KEY,
    model VARCHAR(128) NOT NULL
);

CREATE TABLE seat
(
    aircraft_id INT REFERENCES aircraft (id),
    seat_no     VARCHAR(4) NOT NULL,
    PRIMARY KEY (aircraft_id, seat_no)
);

CREATE TABLE flight
(
    id                     BIGSERIAL PRIMARY KEY,
    flight_no              VARCHAR(16)                       NOT NULL,
    departure_date         TIMESTAMP                         NOT NULL,
    departure_airport_code CHAR(3) REFERENCES airport (code) NOT NULL,
    arrival_date           TIMESTAMP                         NOT NULL,
    arrival_airport_code   CHAR(3) REFERENCES airport (code) NOT NULL,
    aircraft_id            INT REFERENCES aircraft (id)      NOT NULL,
    status                 VARCHAR(32)                       NOT NULL
);

CREATE TABLE ticket
(
    id             BIGSERIAL PRIMARY KEY,
    passenger_no   VARCHAR(32)                   NOT NULL,
    passenger_name VARCHAR(128)                  NOT NULL,
    flight_id      BIGINT REFERENCES flight (id) NOT NULL,
    seat_no        CHAR(4)                       NOT NULL,
    cost           NUMERIC(8, 2)                 NOT NULL,
    UNIQUE (flight_id, seat_no)
);

insert into airport (code, country, city)
values ('MNK', 'Беларусь', 'Минск'),
       ('LDN', 'Англия', 'Лондон'),
       ('MSK', 'Россия', 'Москва'),
       ('BSL', 'Испания', 'Барселона');

insert into aircraft (model)
values ('Боинг 777-300'),
       ('Боинг 737-300'),
       ('Аэробус A320-200'),
       ('Суперджет-100');

insert into seat (aircraft_id, seat_no)
select id, s.column1
from aircraft
         cross join (values ('A1'), ('A2'), ('B1'), ('B2'), ('C1'), ('C2'), ('D1'), ('D2') order by 1) s;

insert into flight (flight_no, departure_date, departure_airport_code, arrival_date, arrival_airport_code, aircraft_id,
                    status)
values ('MN3002', '2020-06-14T14:30', 'MNK', '2020-06-14T18:07', 'LDN', 1, 'ARRIVED'),
       ('MN3002', '2020-06-16T09:15', 'LDN', '2020-06-16T13:00', 'MNK', 1, 'ARRIVED'),
       ('BC2801', '2020-07-28T23:25', 'MNK', '2020-07-29T02:43', 'LDN', 2, 'ARRIVED'),
       ('BC2801', '2020-08-01T11:00', 'LDN', '2020-08-01T14:15', 'MNK', 2, 'DEPARTED'),
       ('TR3103', '2020-05-03T13:10', 'MSK', '2020-05-03T18:38', 'BSL', 3, 'ARRIVED'),
       ('TR3103', '2020-05-10T07:15', 'BSL', '2020-05-10T012:44', 'MSK', 3, 'CANCELLED'),
       ('CV9827', '2020-09-09T18:00', 'MNK', '2020-09-09T19:15', 'MSK', 4, 'SCHEDULED'),
       ('CV9827', '2020-09-19T08:55', 'MSK', '2020-09-19T10:05', 'MNK', 4, 'SCHEDULED'),
       ('QS8712', '2020-12-18T03:35', 'MNK', '2020-12-18T06:46', 'LDN', 2, 'ARRIVED');

insert into ticket (passenger_no, passenger_name, flight_id, seat_no, cost)
values ('112233', 'Иван Иванов', 1, 'A1', 200),
       ('23234A', 'Петр Петров', 1, 'B1', 180),
       ('SS988D', 'Светлана Светикова', 1, 'B2', 175),
       ('QYASDE', 'Андрей Андреев', 1, 'C2', 175),
       ('POQ234', 'Иван Кожемякин', 1, 'D1', 160),
       ('898123', 'Олег Рубцов', 1, 'A2', 198),
       ('555321', 'Екатерина Петренко', 2, 'A1', 250),
       ('QO23OO', 'Иван Розмаринов', 2, 'B2', 225),
       ('9883IO', 'Иван Кожемякин', 2, 'C1', 217),
       ('123UI2', 'Андрей Буйнов', 2, 'C2', 227),
       ('SS988D', 'Светлана Светикова', 2, 'D2', 277),
       ('EE2344', 'Дмитрий Трусцов', 3, 'А1', 300),
       ('AS23PP', 'Максим Комсомольцев', 3, 'А2', 285),
       ('322349', 'Эдуард Щеглов', 3, 'B1', 99),
       ('DL123S', 'Игорь Беркутов', 3, 'B2', 199),
       ('MVM111', 'Алексей Щербин', 3, 'C1', 299),
       ('ZZZ111', 'Денис Колобков', 3, 'C2', 230),
       ('234444', 'Иван Старовойтов', 3, 'D1', 180),
       ('LLLL12', 'Людмила Старовойтова', 3, 'D2', 224),
       ('RT34TR', 'Степан Дор', 4, 'A1', 129),
       ('999666', 'Анастасия Шепелева', 4, 'A2', 152),
       ('234444', 'Иван Старовойтов', 4, 'B1', 140),
       ('LLLL12', 'Людмила Старовойтова', 4, 'B2', 140),
       ('LLLL12', 'Роман Дронов', 4, 'D2', 109),
       ('112233', 'Иван Иванов', 5, 'С2', 170),
       ('NMNBV2', 'Лариса Тельникова', 5, 'С1', 185),
       ('DSA586', 'Лариса Привольная', 5, 'A1', 204),
       ('DSA583', 'Артур Мирный', 5, 'B1', 189),
       ('DSA581', 'Евгений Кудрявцев', 6, 'A1', 204),
       ('EE2344', 'Дмитрий Трусцов', 6, 'A2', 214),
       ('AS23PP', 'Максим Комсомольцев', 6, 'B2', 176),
       ('112233', 'Иван Иванов', 6, 'B1', 135),
       ('309623', 'Татьяна Крот', 6, 'С1', 155),
       ('319623', 'Юрий Дувинков', 6, 'D1', 125),
       ('322349', 'Эдуард Щеглов', 7, 'A1', 69),
       ('DIOPSL', 'Евгений Безфамильная', 7, 'A2', 58),
       ('DIOPS1', 'Константин Швец', 7, 'D1', 65),
       ('DIOPS2', 'Юлия Швец', 7, 'D2', 65),
       ('1IOPS2', 'Ник Говриленко', 7, 'C2', 73),
       ('999666', 'Анастасия Шепелева', 7, 'B1', 66),
       ('23234A', 'Петр Петров', 7, 'C1', 80),
       ('QYASDE', 'Андрей Андреев', 8, 'A1', 100),
       ('1QAZD2', 'Лариса Потемнкина', 8, 'A2', 89),
       ('5QAZD2', 'Карл Хмелев', 8, 'B2', 79),
       ('2QAZD2', 'Жанна Хмелева', 8, 'С2', 77),
       ('BMXND1', 'Светлана Хмурая', 8, 'В2', 94),
       ('BMXND2', 'Кирилл Сарычев', 8, 'D1', 81),
       ('SS988D', 'Светлана Светикова', 9, 'A2', 222),
       ('SS978D', 'Андрей Желудь', 9, 'A1', 198),
       ('SS968D', 'Дмитрий Воснецов', 9, 'B1', 243),
       ('SS958D', 'Максим Гребцов', 9, 'С1', 251),
       ('112233', 'Иван Иванов', 9, 'С2', 135),
       ('NMNBV2', 'Лариса Тельникова', 9, 'B2', 217),
       ('23234A', 'Петр Петров', 9, 'D1', 189),
       ('123951', 'Полина Зверева', 9, 'D2', 234);

-- Кто летел позавчера рейсом Минск (MNK) - Лондон (LDN) на месте B1?

SELECT *
FROM ticket
         JOIN flight f on f.id = ticket.flight_id
WHERE seat_no = 'B1'
  AND f.departure_airport_code = 'MNK'
  AND f.arrival_airport_code = 'LDN'
  AND f.departure_date::DATE = (select now() - INTERVAL '3 YEARS 7 MONTHS 19 DAYS')::DATE;

SELECT INTERVAL '2 YEARS 2 DAYS';
SELECT (now() - INTERVAL '2 DAYS')::DATE;
--CAST()
--EXTRACT -- извлечение данные из даты
SELECT extract(DAY FROM now());


-- Сколько мест осталось незанятыми 2020-06-14 на рейсе MN3002?

SELECT t.flight_id,
       count(*) OVER (PARTITION BY flight_id)
FROM ticket t
         JOIN flight f on t.flight_id = f.id
WHERE flight_no = 'MN3002'
  AND departure_date::DATE = '2020-06-14';

SELECT t.flight_id,
       f.aircraft_id,
       count(*)
FROM ticket t
         JOIN flight f on t.flight_id = f.id
WHERE flight_no = 'MN3002'
  AND departure_date::DATE = '2020-06-14'
GROUP BY t.flight_id, f.aircraft_id;

SELECT aircraft_id, count(*)
FROM seat
GROUP BY aircraft_id;

SELECT t2.seats - t.seats
FROM (SELECT t.flight_id,
             f.aircraft_id,
             count(*) as seats
      FROM ticket t
               JOIN flight f on t.flight_id = f.id
      WHERE flight_no = 'MN3002'
        AND departure_date::DATE = '2020-06-14'
      GROUP BY t.flight_id, f.aircraft_id) t
         JOIN (SELECT aircraft_id, count(*) as seats
               FROM seat
               GROUP BY aircraft_id) t2 ON t.aircraft_id = t2.aircraft_id;

SELECT EXISTS(SELECT 1 FROM ticket where id = 2);

-- 2 VARIANT

SELECT s.seat_no
FROM seat s
WHERE aircraft_id = 1
  AND NOT EXISTS(SELECT t.seat_no
                 FROM ticket t
                          JOIN flight f on t.flight_id = f.id
                 WHERE flight_no = 'MN3002'
                   AND departure_date::DATE = '2020-06-14'
                   AND s.seat_no = t.seat_no);

--Какие 2 перелета были самые длительные за все время?

SELECT f.id,
       f.arrival_date,
       f.departure_date,
       f.arrival_date - f.departure_date
FROM flight f
ORDER BY (f.arrival_date - f.departure_date) DESC
LIMIT 2;

--Какая максимальная и минимальная продолжительность перелетов между Минском и Лондоном
-- и сколько было всего таких перелетов?

SELECT max(f.arrival_date - f.departure_date),
       min(f.arrival_date - f.departure_date),
       count(*)
FROM flight f
WHERE departure_airport_code = 'MNK'
  AND arrival_airport_code = 'LDN';

--2 VARIANT

SELECT f.id,
       f.arrival_date - f.departure_date as                                                                   time,
       first_value(f.arrival_date - f.departure_date) over (order by f.arrival_date - f.departure_date DESC ) max_value,
       first_value(f.arrival_date - f.departure_date) over (order by f.arrival_date - f.departure_date)       min_value,
       count(*) OVER ()
FROM flight f
         JOIN airport a
              ON a.code = f.arrival_airport_code
         JOIN airport d
              ON d.code = f.departure_airport_code
WHERE a.city = 'Лондон'
  AND d.city = 'Минск'
LIMIT 1;

-- Какие имена встречаются чаще всего и какую долю от числа всех пассажиров они составляют?

SELECT t.passenger_name,
       count(*),
       round(100.0 * count(*) / (SELECT count(*) FROM ticket), 3)
FROM ticket t
GROUP BY t.passenger_name
ORDER BY 2 DESC;

--Вывести имена пассажиров, сколько всего каждый
-- с таким именем купил билетов, а также на сколько
-- это количество меньше от того имени пассажира,
-- кто купил билетов больше всего

SELECT t1.*,
       max(t1.cnt) over () - t1.cnt
FROM (SELECT t.passenger_no,
             t.passenger_name,
             count(*) cnt,
             max(count(*)) OVER () - count(*)
      FROM ticket t
      GROUP BY t.passenger_no, passenger_name
      ORDER BY 3 DESC) t1;

-- 9.	Вывести стоимость всех маршрутов по убыванию.
-- Отобразить разницу в стоимости между
-- текущим и ближайшими в отсортированном списке маршрутами
SELECT t2.*,
       COALESCE(lead(t2.sum_cost) over (ORDER BY t2.sum_cost), t2.sum_cost) - t2.sum_cost
FROM (SELECT t.flight_id,
             sum(t.cost) sum_cost
      FROM ticket t
      GROUP BY t.flight_id
      ORDER BY sum_cost DESC) t2


