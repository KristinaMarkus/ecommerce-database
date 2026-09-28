-- Backup and restore examples for the ECommerceDB project.
-- Adjust the backup path if your SQL Server service account cannot access it.

BACKUP DATABASE ECommerceDB
TO DISK = 'C:\SQLBackups\ECommerceDB.bak'
WITH INIT,
     FORMAT,
     NAME = 'ECommerceDB Full Backup';
GO

RESTORE VERIFYONLY
FROM DISK = 'C:\SQLBackups\ECommerceDB.bak';
GO

RESTORE HEADERONLY
FROM DISK = 'C:\SQLBackups\ECommerceDB.bak';
GO

RESTORE FILELISTONLY
FROM DISK = 'C:\SQLBackups\ECommerceDB.bak';
GO

/*
Restore test into a separate database.

The logical file names for this project are:
- ECommerceDB
- ECommerceDB_log
*/

RESTORE DATABASE ECommerceDB_RestoreTest
FROM DISK = 'C:\SQLBackups\ECommerceDB.bak'
WITH
    MOVE 'ECommerceDB'
        TO 'C:\SQLBackups\ECommerceDB_RestoreTest.mdf',
    MOVE 'ECommerceDB_log'
        TO 'C:\SQLBackups\ECommerceDB_RestoreTest_log.ldf',
    RECOVERY,
    REPLACE;
GO

-- Validation after restore:
USE ECommerceDB_RestoreTest;
GO

SELECT COUNT(*) AS CustomerCount FROM dbo.Customers;
SELECT COUNT(*) AS ProductCount FROM dbo.Products;
SELECT COUNT(*) AS OrderCount FROM dbo.Orders;
SELECT COUNT(*) AS OrderItemCount FROM dbo.OrderItems;
SELECT COUNT(*) AS PaymentCount FROM dbo.Payments;
GO
