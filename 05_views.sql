USE [ECommerceDB];
GO

CREATE OR ALTER VIEW dbo.vw_OrderSummary
AS
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM dbo.Orders AS o
JOIN dbo.Customers AS c
    ON o.CustomerID = c.CustomerID
JOIN dbo.OrderItems AS oi
    ON o.OrderID = oi.OrderID
GROUP BY
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status;
GO

CREATE OR ALTER VIEW dbo.vw_ProductSales
AS
SELECT
    p.ProductID,
    p.ProductName,
    SUM(oi.Quantity) AS TotalQuantitySold,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM dbo.Products AS p
JOIN dbo.OrderItems AS oi
    ON p.ProductID = oi.ProductID
GROUP BY
    p.ProductID,
    p.ProductName;
GO

CREATE OR ALTER VIEW dbo.vw_CustomerSpending
AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(DISTINCT o.OrderID) AS OrderCount,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpent
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
    ON c.CustomerID = o.CustomerID
JOIN dbo.OrderItems AS oi
    ON o.OrderID = oi.OrderID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName;
GO

-- Examples
SELECT * FROM dbo.vw_OrderSummary ORDER BY OrderID;
SELECT * FROM dbo.vw_ProductSales ORDER BY TotalRevenue DESC;
SELECT * FROM dbo.vw_CustomerSpending ORDER BY TotalSpent DESC;
GO
