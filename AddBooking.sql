use LittleLemon;

DELIMITER $$ 
CREATE PROCEDURE AddBooking(IN Booking_ID INT, IN Customer_ID INT, IN Table_Number INT, IN Booking_Date DATE)
BEGIN 
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, BookingDate) VALUES (Booking_ID, Table_Number, Booking_Date, Customer_ID); 
SELECT "New booking added" AS "Confirmation";
END$$ DELIMITER ; 
