USE [ECommerceDB];
GO

CREATE OR ALTER PROCEDURE dbo.sp_GetOrderDetails
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderID,
        o.OrderDate,
        o.Status,
        c.FirstName,
        c.LastName,
        p.ProductName,
        oi.Quantity,
        oi.UnitPrice,
        oi.Quantity * oi.UnitPrice AS LineTotal
    FROM dbo.Orders AS o
    JOIN dbo.Customers AS c
        ON o.CustomerID = c.CustomerID
    JOIN dbo.OrderItems AS oi
        ON o.OrderID = oi.OrderID
    JOIN dbo.Products AS p
        ON oi.ProductID = p.ProductID
    WHERE o.OrderID = @OrderID;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderID,
        o.OrderDate,
        o.Status,
        SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
    FROM dbo.Orders AS o
    JOIN dbo.OrderItems AS oi
        ON o.OrderID = oi.OrderID
    WHERE o.CustomerID = @CustomerID
    GROUP BY
        o.OrderID,
        o.OrderDate,
        o.Status
    ORDER BY o.OrderDate DESC;
END;
GO

-- Examples
EXEC dbo.sp_GetOrderDetails @OrderID = 1;
EXEC dbo.sp_GetCustomerOrders @CustomerID = 1;
GO
