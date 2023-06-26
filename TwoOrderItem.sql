use LittleLemon;
SELECT CourseName FROM MenuItems WHERE MenuID=ANY (SELECT MenuID FROM Orders WHERE Quantity > 2) 