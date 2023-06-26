use LittleLemon;

DELIMITER $$ 
CREATE PROCEDURE CancelBooking(IN Booking_ID INT) 
BEGIN 
DELETE FROM Bookings WHERE BookingID = Booking_ID; 
SELECT CONCAT("Booking ", Booking_ID, " cancelled") AS "Confirmation"; 
END$$ 
DELIMITER ; 
