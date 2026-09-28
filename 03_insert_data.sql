USE [ECommerceDB];
GO

SET IDENTITY_INSERT dbo.Categories ON;
INSERT INTO dbo.Categories (CategoryID, CategoryName) VALUES
    (1, 'Electronics'),
    (2, 'Clothing'),
    (3, 'Books'),
    (4, 'Home');
SET IDENTITY_INSERT dbo.Categories OFF;
GO

SET IDENTITY_INSERT dbo.Suppliers ON;
INSERT INTO dbo.Suppliers (SupplierID, SupplierName, Email) VALUES
    (1, 'Tech Supply Ltd.', 'contact@techsupply.com'),
    (2, 'Fashion Wholesale', 'info@fashionwholesale.com'),
    (3, 'Book World', 'sales@bookworld.com'),
    (4, 'Home Goods Inc.', 'contact@homegoods.com');
SET IDENTITY_INSERT dbo.Suppliers OFF;
GO

SET IDENTITY_INSERT dbo.Customers ON;
INSERT INTO dbo.Customers
    (CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
    (1, 'Ana', 'Horvat', 'ana.horvat@email.com', '2026-09-01'),
    (2, 'Marko', 'Kovac', 'marko.kovac@email.com', '2026-09-05'),
    (3, 'Ivana', 'Maric', 'ivana.maric@email.com', '2026-09-10'),
    (4, 'Leo', 'Bereta', 'leo.bereta@email.com', '2026-07-10'),
    (5, 'Mario', 'Lukic', 'mario.lukic@email.com', '2026-05-11');
SET IDENTITY_INSERT dbo.Customers OFF;
GO

SET IDENTITY_INSERT dbo.Products ON;
INSERT INTO dbo.Products
    (ProductID, ProductName, CategoryID, SupplierID, Price, StockQuantity)
VALUES
    (1, 'Laptop Lenovo ThinkPad', 1, 1, 899.99, 15),
    (2, 'Wireless Mouse', 1, 1, 29.99, 50),
    (3, 'Mechanical Keyboard', 1, 1, 79.99, 30),
    (4, 'Cotton T-Shirt', 2, 2, 19.99, 100),
    (5, 'SQL Fundamentals Book', 3, 3, 39.99, 25),
    (6, 'Coffee Maker', 4, 4, 89.99, 20);
SET IDENTITY_INSERT dbo.Products OFF;
GO

SET IDENTITY_INSERT dbo.Orders ON;
INSERT INTO dbo.Orders
    (OrderID, CustomerID, OrderDate, Status)
VALUES
    (1, 1, '2026-09-20', 'Completed'),
    (2, 2, '2026-09-21', 'Completed'),
    (3, 3, '2026-09-22', 'Pending'),
    (4, 4, '2026-09-23', 'Completed'),
    (5, 5, '2026-09-23', 'Pending'),
    (6, 1, '2026-09-24', 'Completed'),
    (7, 3, '2026-09-24', 'Completed');
SET IDENTITY_INSERT dbo.Orders OFF;
GO

SET IDENTITY_INSERT dbo.OrderItems ON;
INSERT INTO dbo.OrderItems
    (OrderItemID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 1, 1, 1, 899.99),
    (2, 1, 2, 2, 29.99),
    (3, 2, 4, 3, 19.99),
    (4, 2, 5, 1, 39.99),
    (5, 3, 6, 1, 89.99),
    (6, 4, 3, 1, 79.99),
    (7, 4, 2, 1, 29.99),
    (8, 5, 5, 2, 39.99),
    (9, 6, 1, 1, 899.99),
    (10, 6, 3, 1, 79.99),
    (11, 7, 2, 3, 29.99),
    (12, 7, 4, 2, 19.99);
SET IDENTITY_INSERT dbo.OrderItems OFF;
GO

SET IDENTITY_INSERT dbo.Payments ON;
INSERT INTO dbo.Payments
    (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
    (1, 1, '2026-09-20', 959.97, 'Card'),
    (2, 2, '2026-09-21', 99.96, 'PayPal'),
    (3, 4, '2026-09-23', 109.98, 'Card'),
    (4, 6, '2026-09-24', 979.98, 'Card'),
    (5, 7, '2026-09-24', 129.95, 'PayPal');
SET IDENTITY_INSERT dbo.Payments OFF;
GO
