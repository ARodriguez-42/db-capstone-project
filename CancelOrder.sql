DELIMITER $$ CREATE PROCEDURE CancelOrder(IN orderid INT) 
BEGIN 
DELETE FROM Orders WHERE OrderID = orderid; SELECT CONCAT("Order ", orderid, " is cancelled") AS "Confirmation"; 
END$$ 
DELIMITER ; 