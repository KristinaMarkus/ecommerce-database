USE [ECommerceDB];
GO

-- 1. Orders with customer information
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status
FROM dbo.Orders AS o
JOIN dbo.Customers AS c
    ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate;
GO

-- 2. Order details with line totals
SELECT
    o.OrderID,
    o.OrderDate,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    oi.Quantity * oi.UnitPrice AS LineTotal
FROM dbo.Orders AS o
JOIN dbo.OrderItems AS oi
    ON o.OrderID = oi.OrderID
JOIN dbo.Products AS p
    ON oi.ProductID = p.ProductID
ORDER BY o.OrderID;
GO

-- 3. Total value of each order
SELECT
    o.OrderID,
    o.OrderDate,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM dbo.Orders AS o
JOIN dbo.OrderItems AS oi
    ON o.OrderID = oi.OrderID
GROUP BY
    o.OrderID,
    o.OrderDate
ORDER BY o.OrderID;
GO

-- 4. Total customer spending
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpent
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
    ON c.CustomerID = o.CustomerID
JOIN dbo.OrderItems AS oi
    ON o.OrderID = oi.OrderID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalSpent DESC;
GO

-- 5. Best-selling products by quantity
SELECT
    p.ProductID,
    p.ProductName,
    SUM(oi.Quantity) AS TotalQuantitySold
FROM dbo.Products AS p
JOIN dbo.OrderItems AS oi
    ON p.ProductID = oi.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalQuantitySold DESC;
GO
