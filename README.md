# Relational Sales Database

A PostgreSQL database project designed to analyze sales performance, product performance, customer spending, and category-level results for a small business.

## Project Overview

This project demonstrates how to build and analyze a relational database using PostgreSQL.

The database includes customer, product, order, and order-item data. SQL queries and reusable views are used to generate business insights from sales data.

## Business Questions

This project analyzes the following questions:

- What is the total revenue generated?
- How many orders and units were sold?
- Which products generated the most revenue?
- Which customers spent the most?
- Which categories generated the most revenue?
- Which categories sold the highest number of units?

## Database Structure

The database contains the following tables:

- `customers`
- `products`
- `orders`
- `order_items`

## Analysis Views

The project includes the following reusable PostgreSQL views:

- `sales_summary`
- `product_performance`
- `customer_spending`
- `category_performance`

PostgreSQL views store reusable query definitions that can be queried similarly to regular tables. The underlying query is executed when the view is referenced.

[PostgreSQL CREATE VIEW documentation](https://www.postgresql.org/docs/current/sql-createview.html)

## Key Results

- Total orders: 15
- Different products sold: 10
- Total units sold: 51
- Total revenue: 2,326.80
- Highest single-item total: 199.00
- Lowest single-item total: 24.90
- Top customer by total spending: Carla Mendes, with 612.90
- Top product by total revenue: Noise Cancelling Headphone, with 449.70
- Top category by total revenue: Computer Accessories, with 798.50
- Top category by units sold: Office Supplies, with 22 units

## Category Performance

| Category | Orders with Category | Total Units Sold | Total Revenue |
|---|---:|---:|---:|
| Computer Accessories | 8 | 15 | 798.50 |
| Office Equipment | 6 | 9 | 663.00 |
| Audio | 3 | 3 | 449.70 |
| Storage | 2 | 2 | 219.80 |
| Office Supplies | 4 | 22 | 195.80 |

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

## Skills Demonstrated

- Relational database design
- PostgreSQL table and view creation
- SQL joins and aggregations
- Revenue and sales performance analysis
- Customer spending analysis
- Category-level analysis
- Data validation and quality checks
- Business insight generation

## Project Files

The SQL folder contains scripts for:

- Creating the database tables
- Inserting product and customer data
- Inserting order data
- Summarizing orders by status
- Running basic queries
- Validating data quality
- Running aggregation queries
- Creating analysis views
- Creating the sales summary view

## How to Use

1. Create or open the `small_business_sales` database in PostgreSQL.
2. Run the table creation script.
3. Run the data insertion scripts.
4. Run the analysis and validation queries.
5. Create the reusable analysis views.
6. Query the views to review the results.

## Example Queries

```sql
SELECT *
FROM sales_summary;

SELECT *
FROM product_performance
ORDER BY total_revenue DESC;

SELECT *
FROM customer_spending
ORDER BY total_spent DESC;

SELECT *
FROM category_performance
ORDER BY total_revenue DESC;
```

## Business Insights

Computer Accessories generated the highest revenue, while Office Supplies sold the highest number of units.

This suggests that Computer Accessories may contain higher-priced products, while Office Supplies may have higher sales volume but lower average prices.

## Project Status

Completed as part of a SQL and Data Analytics portfolio.

## Author

Antonio Souza

## Copyright

© 2026 Antonio Souza. This project is provided for portfolio and educational purposes.