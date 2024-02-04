SELECT id
FROM ticket
WHERE id = 29
  AND passenger_no = 'DSA581';

CREATE INDEX ticket_flight_id_seat_no_key ON ticket (flight_id, seat_no);

CREATE INDEX ticket_cost_idx ON ticket (cost);

CREATE UNIQUE INDEX ticket_cost_idx ON ticket (cost);


SELECT count(DISTINCT flight_id)
FROM ticket;
--СЕЛИКТИВНОСТЬ ticket 9/55 что есть плохо . 55 записей . и 9 только
--а если по flight_id И seat_no то 55/55 = 1
--айдшки тоже 55/55 = 1 селиктивность там отлично подходит
