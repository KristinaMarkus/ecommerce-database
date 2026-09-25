# E-Commerce Database – SQL Server DBA Portfolio Project

## Project Overview

This project is a relational e-commerce database developed in
Microsoft SQL Server as a practical DBA portfolio project.

The project demonstrates database design, data integrity,
SQL querying, views, stored procedures, indexing,
backup and restore, and database security.

## Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- GitHub

## Database Structure

The database contains the following tables:

- Customers
- Categories
- Suppliers
- Products
- Orders
- OrderItems
- Payments

## Main Features

- Relational database design
- Primary and foreign keys
- Data integrity constraints
- JOIN and aggregation queries
- SQL Views
- Stored Procedures
- Non-clustered indexes
- Execution plan analysis
- Backup and restore
- Database roles and permissions
- ER database diagram

## DBA Topics Demonstrated

### Data Integrity
CHECK constraints are used to prevent invalid values such as
negative prices, quantities and payment amounts.

### Performance
Indexes were created on frequently used foreign key columns
and execution plans were used to examine query performance.

### Backup and Recovery
A full database backup was created and restored into a separate
test database to validate the recovery process.

### Security
A custom `EcommerceReadOnly` database role demonstrates the
principle of least privilege.

## Database Diagram

The ER diagram can be found in:

`diagrams/er-diagram.png`

## Author

SQL Server / Database Administrator Portfolio Project
