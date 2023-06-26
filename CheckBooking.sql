use LittleLemon;
CREATE PROCEDURE CheckBooking(IN Booking_Date DATE, IN Table_Number INT)
SELECT Booking_Date, Table_Number
WHERE exists (SELECT * from Bookings where Booking_Date = BookingDate and TableNumber = Table_Number)