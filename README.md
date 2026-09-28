# E-Commerce Database — SQL Server DBA Portfolio Project

A practical relational e-commerce database built with Microsoft SQL Server and SSMS.

## What this project demonstrates

- Relational database design
- Primary and foreign keys
- UNIQUE and CHECK constraints
- JOINs and aggregate queries
- SQL Views
- Stored Procedures
- Nonclustered indexes
- Execution-plan / performance analysis
- Full database backup and restore validation
- Database roles and least-privilege permissions
- ER database diagram

## Database

The project contains:

- `Customers`
- `Categories`
- `Suppliers`
- `Products`
- `Orders`
- `OrderItems`
- `Payments`

Current sample dataset:

- 5 customers
- 4 categories
- 4 suppliers
- 6 products
- 7 orders
- 12 order items
- 5 payments

## Project structure

```text
ecommerce-database/
├── 01_create_database.sql
├── 02_create_tables.sql
├── 03_insert_data.sql
├── 04_queries.sql
├── 05_views.sql
├── 06_stored_procedures.sql
├── 07_indexes.sql
├── 08_backup_restore.sql
├── 09_security.sql
├── diagrams/
│   └── er-diagram.png
└── archive/
    └── ECommerceDB_FullScript.sql
```

## Execution order

For a fresh SQL Server instance/database:

1. `01_create_database.sql`
2. `02_create_tables.sql`
3. `03_insert_data.sql`
4. `04_queries.sql`
5. `05_views.sql`
6. `06_stored_procedures.sql`
7. `07_indexes.sql`
8. `08_backup_restore.sql`
9. `09_security.sql`

`03_insert_data.sql` is intended for a fresh database because it preserves the sample identity values.

## DBA highlights

### Data integrity

The schema uses:

- Primary keys
- Foreign keys
- UNIQUE constraints
- CHECK constraints for prices, quantities, stock and payment amounts

### Performance

Indexes were added to frequently used relationship/filter columns:

- `Orders.CustomerID`
- `OrderItems.OrderID`
- `OrderItems.ProductID`

`07_indexes.sql` also contains a small `STATISTICS IO/TIME` performance test.

### Backup and recovery

`08_backup_restore.sql` contains:

- Full database backup
- `RESTORE VERIFYONLY`
- Backup metadata inspection
- `RESTORE FILELISTONLY`
- Restore into a separate test database
- Post-restore row-count validation

### Security

`09_security.sql` creates the `EcommerceReadOnly` role and grants it `SELECT` access to the `dbo` schema, demonstrating least-privilege access.

## ER Diagram

Add the SSMS Database Diagram screenshot as:

```text
diagrams/er-diagram.png
```

## Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- GitHub

## Portfolio goal

This project is designed as a practical demonstration of SQL Server database development and core DBA tasks rather than as a production e-commerce application.
