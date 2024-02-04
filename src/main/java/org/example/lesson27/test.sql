SELECT *
FROM (VALUES (1, 2, 3, 4, 5))
UNION ALL
SELECT *
FROM (VALUES (1, 2, 3, 4, 5));

SELECT *
FROM (VALUES (1, 2, 3, 4, 5))
UNION
SELECT *
FROM (VALUES (1, 2, 3, 4, 5));

SELECT *
FROM (VALUES (1, 2, 3, 4, 5))
INTERSECT
SELECT *
FROM (VALUES (1, 2, 3, 4, 5));


VALUES (1,2),(3,4),(5,6),(7,8)
UNION ALL -- ПРОСТО ОБЕДЕНИТЬ
VALUES (1,2),(3,4),(5,6),(7,8);

VALUES (1,2),(3,4),(5,6),(7,8)
UNION -- ВСЕ С ПЕРВОЙ ТАБЛИЦИ + УНИКАЛЬНЫЕ СО ВТОРОЙ
VALUES (1,2),(3,4),(5,6),(7,8);

VALUES (2,2),(3,4),(5,6),(2,8)
INTERSECT --  ПЕРЕСИЧЕНИЕ
VALUES (1,2),(3,4),(5,6),(7,8);

VALUES (2,2),(3,4),(5,6),(2,8)
EXCEPT -- КРОМЕ
VALUES (1,2),(3,4),(5,6),(7,8)