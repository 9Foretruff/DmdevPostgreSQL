ALTER TABLE employee
    ADD COLUMN gender INT;

ALTER TABLE employee
ALTER COLUMN gender SET NOT NULL;

ALTER TABLE employee
DROP COLUMN gender;

UPDATE employee
SET gender = 1
WHERE id <= 5;