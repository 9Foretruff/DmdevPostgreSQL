-- before

INSERT INTO aircraft(model)
VALUES ('new aircraft');

-- after

--Truncate почистить таблицу

CREATE TABLE audit
(
    id         INT,
    table_name TEXT,
    data       TIMESTAMP
);

CREATE OR REPLACE FUNCTION audit_function() RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
begin
    insert into audit(id, table_name, data)
    VALUES (new.id, tg_table_name, now());
    RETURN NULL;
end;
$$;

CREATE TRIGGER audit_aircraft_trigger
    AFTER UPDATE OR INSERT OR DELETE
    ON aircraft
    FOR EACH ROW
EXECUTE FUNCTION audit_function();

INSERT INTO aircraft(model)
VALUES ('new one');

