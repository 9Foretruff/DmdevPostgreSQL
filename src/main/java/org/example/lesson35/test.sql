BEGIN;
-- Lost update тоже нету
--Dirty read нету в постгресе

SELECT * FROM aircraft FOR UPDATE;
--row level lock