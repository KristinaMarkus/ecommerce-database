USE [ECommerceDB];
GO

-- Indexes added for common join/filter columns.
CREATE INDEX IX_Orders_CustomerID
    ON dbo.Orders(CustomerID);
GO

CREATE INDEX IX_OrderItems_OrderID
    ON dbo.OrderItems(OrderID);
GO

CREATE INDEX IX_OrderItems_ProductID
    ON dbo.OrderItems(ProductID);
GO

-- Performance test
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
    o.OrderID,
    o.OrderDate,
    o.Status
FROM dbo.Orders AS o
WHERE o.CustomerID = 1;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
