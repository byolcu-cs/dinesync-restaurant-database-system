# DineSync Restaurant Database System

SQL database design project for restaurant and bar operations, including ER modeling, normalization, relational schema design, and query implementation.

## Overview
DineSync is a restaurant and bar management database designed to support core operational workflows such as customer management, staff administration, menu tracking, order processing, order item detail, and payment handling. The system was structured to reflect realistic restaurant operations while maintaining data integrity and scalability.

## Project Objective
The goal of this project was to design and implement a normalized relational database that:
- models real-world restaurant and bar workflows
- enforces referential integrity
- reduces redundancy through normalization
- supports operational SQL queries across multiple business functions
- demonstrates realistic end-to-end database interactions through a working demo

## System Scope
The database supports workflows involving:
- customer registration
- staff role management
- dine-in and takeout order creation
- order item updates and deletions
- payment processing
- customer order history lookup
- payment summary reporting

## Database Design
The ER model includes seven core entities:
- Customer
- Staff
- Food
- Drink
- Order
- Order_Item
- Payment

The design includes:
- one-to-many relationships between customers and orders
- one-to-many relationships between staff and orders
- one-to-many relationships between orders and order items
- one-to-one relationship between orders and payments
- a polymorphic item structure in `Order_Item` to support both food and drink records

## Normalization and Schema
All tables were normalized through Third Normal Form (3NF) to improve consistency and reduce redundancy. The final schema enforces primary key and foreign key relationships to preserve referential integrity across the system.

## SQL Functionality Demonstrated
The project includes SQL workflows covering:
- insert operations
- update operations
- delete operations
- join queries
- aggregate reporting queries

Examples include:
- customer registration
- staff role updates
- order creation
- order item deletion
- payment entry
- revenue totals grouped by payment method
- customer order history retrieval

## Testing and Demo
The project includes a structured MySQL demo flow showing:
1. menu table review
2. customer insertion
3. order creation
4. order item insertion
5. payment insertion
6. join query execution
7. aggregate query execution

Realistic sample data was created to simulate restaurant operations, including menu items, staff roles, customers, payment methods, and both dine-in and takeout order scenarios.

## Repository Contents
- `reports/dinesync-final-report.pdf` — final project report
- `sql/dinesync-schema-and-data.sql` — schema creation and sample data
- `sql/dinesync-demo-queries.sql` — example SQL operations and demo queries
- `diagrams/dinesync-er-diagram.png` — ER diagram
- `model/dinesync-mysql-workbench-model.mwb` — MySQL Workbench model
- `demo/demo-link.txt` — link to walkthrough demo video

## Skills Demonstrated
- SQL
- relational database design
- ER modeling
- normalization to 3NF
- schema design
- foreign key / referential integrity design
- join and aggregate queries
- business workflow modeling
- database testing and demonstration

## Notes
This repository presents a database systems project in portfolio format, emphasizing schema design, normalization, SQL implementation, and practical business workflow support.
