USE ECommerceDB;
GO

/*
Performance Optimization Demo

Goal:
Compare query execution before and after creating a
covering index on CustomerID.
*/

-- Create test table
IF OBJECT_ID('dbo.PerformanceTestOrders', 'U') IS NOT NULL
    DROP TABLE dbo.PerformanceTestOrders;
GO

CREATE TABLE dbo.PerformanceTestOrders (
    TestOrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL
);
GO

-- Generate 100,000 test rows
INSERT INTO dbo.PerformanceTestOrders (CustomerID, OrderDate)
SELECT TOP (100000)
    ((ROW_NUMBER() OVER (ORDER BY a.object_id, b.object_id) - 1) % 1000) + 1,
    DATEADD(
        DAY,
        -((ROW_NUMBER() OVER (ORDER BY a.object_id, b.object_id) - 1) % 365),
        CAST(GETDATE() AS DATE)
    )
FROM sys.all_objects AS a
CROSS JOIN sys.all_objects AS b;
GO

-- Baseline query
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM dbo.PerformanceTestOrders
WHERE CustomerID = 500;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- Initial index
CREATE INDEX IX_PerformanceTestOrders_CustomerID
ON dbo.PerformanceTestOrders(CustomerID);
GO

-- Test again and inspect the execution plan.
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM dbo.PerformanceTestOrders
WHERE CustomerID = 500;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- Replace the index with a covering index.
DROP INDEX IX_PerformanceTestOrders_CustomerID
ON dbo.PerformanceTestOrders;
GO

CREATE INDEX IX_PerformanceTestOrders_CustomerID
ON dbo.PerformanceTestOrders(CustomerID)
INCLUDE (OrderDate);
GO

-- Final test.
-- Expected plan: Index Seek without Key Lookup.
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM dbo.PerformanceTestOrders
WHERE CustomerID = 500;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
