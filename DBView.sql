CREATE VIEW CustomerSummary AS
SELECT customerId, date_out AS rental_date_out,
        date_back  AS rental_date_back,
        ((rental.odo_back - rental.odo_out) * car.kmCost + ( julianday(date_back) - julianday(date_out) + 1)*car.dailyCost) AS rental_cost
         
        
 FROM rental JOIN vehicle JOIN car
 WHERE  Vehicle.carMake = Car.carMake 
  AND Vehicle.carModel = Car.carModel 
  AND Vehicle.carYear = Car.carYear
  AND Vehicle.VIN = rental.VIN