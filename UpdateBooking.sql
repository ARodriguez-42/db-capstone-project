use LittleLemon;

DELIMITER $$ 
CREATE PROCEDURE UpdateBooking(IN Booking_ID INT, IN Booking_Date DATE) 
BEGIN
UPDATE Bookings SET BookingDate = Booking_Date WHERE BookingID = Booking_ID; 
SELECT CONCAT("Booking ", BookingID, " updated") AS "Confirmation"; 
END$$ 
DELIMITER ; 