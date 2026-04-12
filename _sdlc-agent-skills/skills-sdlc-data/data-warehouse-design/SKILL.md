---
name: data-warehouse-design
description: Data warehouse design, data modeling, star schema, dimensional modeling. Use to create analytical data warehouses.
---

# Data Warehouse Design

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for designing analytical data warehouses. Includes dimensional modeling, star/snowflake schemas, fact/dimension tables, and warehouse architecture.

## When to Use

Use this skill:
- When designing data warehouses
- For analytical systems
- When creating BI solutions
- For reporting preparation
- For dimensional modeling
- For ETL source definition

## Dimensional Modeling

### Fact Tables

```sql
-- Fact table example: sales
CREATE TABLE fact_sales (
    sale_id BIGINT PRIMARY KEY,
    date_key INT NOT NULL,
    product_key INT NOT NULL,
    customer_key INT NOT NULL,
    store_key INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0,
    total_amount DECIMAL(12,2) NOT NULL,
    
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);
```

### Dimension Tables

```sql
-- Dimension: Product
CREATE TABLE dim_product (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    supplier_key INT,
    is_active BOOLEAN DEFAULT TRUE,
    valid_from DATE,
    valid_to DATE,
    
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key)
);
```

## Star Schema

```
dim_date ------> fact_sales <----- dim_product
    |                      |
dim_customer             dim_store
```

## Slowly Changing Dimensions

### Type 1 (Overwrite)

```sql
-- Simply update the record
UPDATE dim_product 
SET product_name = 'New Name' 
WHERE product_id = 123;
```

### Type 2 (Add new row)

```sql
-- Add new row with version
UPDATE dim_product 
SET valid_to = CURRENT_DATE 
WHERE product_id = 123 AND valid_to IS NULL;

INSERT INTO dim_product 
VALUES (123, 'New Name', ..., NULL, CURRENT_DATE, '9999-12-31');
```

### Type 3 (Add column)

```sql
ALTER TABLE dim_product 
ADD COLUMN previous_name VARCHAR(255);

UPDATE dim_product 
SET previous_name = product_name 
WHERE product_id = 123;
```

## Data Warehouse Architecture

### Layers

| Layer | Description |
|-------|-----------|
| Staging | Raw data before transformation |
| Integration | Cleaned and transformed data |
| Presentation | BI-ready data for queries |

## Aggregation Tables

```sql
-- Daily summary
CREATE TABLE agg_sales_daily AS
SELECT 
    date_key,
    product_key,
    SUM(total_amount) as daily_sales,
    SUM(quantity) as daily_quantity,
    COUNT(*) as transaction_count
FROM fact_sales
GROUP BY date_key, product_key;
```

## Analytics Queries

```sql
-- Monthly sales by category
SELECT 
    d.month_name,
    p.category,
    SUM(f.total_amount) as total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
WHERE d.fiscal_year = 2024
GROUP BY d.month_name, p.category
ORDER BY d.month_number, total_sales DESC;
```

## Quality Criteria

- [ ] Dimensional model documented
- [ ] Fact tables properly defined
- [ ] Dimension tables have surrogate keys
- [ ] SCD implemented
- [ ] Aggregation tables created
- [ ] Query performance optimized