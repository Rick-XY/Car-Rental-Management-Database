CREATE TRIGGER start_odo
         AFTER INSERT
            ON rental
          WHEN new.odo_out IS NULL
BEGIN
    UPDATE rental
       SET odo_out = (
               SELECT Vehicle.odometer
                 FROM Vehicle
                WHERE Vehicle.VIN = new.VIN
           )
     WHERE odo_out IS NULL;
END;



CREATE TRIGGER end_odo
         AFTER UPDATE
            ON rental
          WHEN new.odo_back IS NOT NULL
BEGIN
    UPDATE Vehicle
       SET odometer = new.odo_back
     WHERE Vehicle.VIN = new.VIN;
END;
