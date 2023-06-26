DELIMITER $$

CREATE FUNCTION Validate(RecordsFound INTEGER, message VARCHAR(255)) RETURNS INTEGER DETERMINISTIC
BEGIN
    IF RecordsFound IS NOT NULL OR RecordsFound > 0 THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = message;
    END IF;
    RETURN RecordsFound;
END$$

CREATE PROCEDURE AddValidBooking(IN Booking_Date DATE, IN Table_Number INT)
	BEGIN
		DECLARE `_rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
		START TRANSACTION;
        
        SELECT Validate(COUNT(*), CONCAT("Table ", Table_Number, " is already booked"))
        FROM Bookings
        WHERE date = BookingDate AND TableNumber = Table_Number;
        
		INSERT INTO Bookings (BookingDate, TableNumber)
		VALUES (Booking_Date, Table_Number);
		
		IF `_rollback` THEN
			SELECT CONCAT("Table ", Table_Number, " is already booked") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END$$
    
DELIMITER ;
