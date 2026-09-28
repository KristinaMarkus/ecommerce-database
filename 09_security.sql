USE [ECommerceDB];
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_principals
    WHERE name = 'EcommerceReadOnly'
      AND type = 'R'
)
BEGIN
    CREATE ROLE EcommerceReadOnly;
END;
GO

GRANT SELECT ON SCHEMA::dbo
TO EcommerceReadOnly;
GO

-- Review the role permissions
SELECT
    dp.name AS RoleName,
    dp.type_desc,
    perm.permission_name,
    perm.state_desc
FROM sys.database_principals AS dp
JOIN sys.database_permissions AS perm
    ON dp.principal_id = perm.grantee_principal_id
WHERE dp.name = 'EcommerceReadOnly';
GO
