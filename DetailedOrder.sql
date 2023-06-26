use LittleLemon;
CREATE VIEW DetailedOrderView AS
SELECT Customers.CustomersID, Customers.FullName, Orders.OrderID, Orders.TotalCost, Menu.MenuName, MenuItems.CourseName
FROM (((Customers INNER JOIN Orders ON Customers.CustomersID = Orders.CustomersID)
INNER JOIN Menu ON Orders.MenuID = Menu.MenuID)
INNER JOIN MenuItems ON Menu.MenuID = MenuItems.MenuID)
WHERE Orders.TotalCost > 150