---
name: data-modeling-normalization
description: Data normalization and denormalization: 1NF-3NF, BCNF, trade-offs between normalization and performance. Use this skill when optimizing data models for integrity and performance.
---

# Data Modeling — Normalization

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** data-modeling

## Purpose

This subskill covers normalization forms (1NF-3NF, BCNF) and denormalization strategies. Use it when designing data models that balance data integrity, redundancy, and performance.

## When to Use

Use this skill:
- When normalizing existing tables to eliminate redundancy
- For applying 1NF, 2NF, 3NF, and BCNF rules
- When deciding whether to denormalize for performance
- For documenting normalization and denormalization decisions
- During data model optimization reviews

## Normalization

### 1NF (First Normal Form)

Requirements:
- All attributes must contain atomic (indivisible) values
- Each column must contain values of the same type
- Each record must be unique

```sql
-- Before 1NF (incorrect)
CREATE TABLE orders_bad (
    id INT,
    customer_name VARCHAR(100),
    products VARCHAR(200)  -- contains "Product1, Product2, Product3"
);

-- After 1NF (correct)
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE order_products (
    id INT PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_name VARCHAR(100)
);
```

### 2NF (Second Normal Form)

Requirements:
- Table must be in 1NF
- All non-key attributes must fully depend on the primary key
- No partial dependencies

```sql
-- Before 2NF (partial dependency)
CREATE TABLE order_items_bad (
    order_id INT,
    product_id INT,
    product_name VARCHAR(100),  -- depends only on product_id
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- After 2NF
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```

### 3NF (Third Normal Form)

Requirements:
- Table must be in 2NF
- No transitive dependencies (non-key attribute depends on another non-key attribute)

```sql
-- Before 3NF (transitive dependency)
CREATE TABLE employees_bad (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100)  -- transitively depends on department_id
);

-- After 3NF
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT REFERENCES departments(id)
);
```

### BCNF (Boyce-Codd Normal Form)

Requirements:
- Table must be in 3NF
- For each functional dependency X → Y, X must be a superkey

## Denormalization

Denormalization is intentional addition of redundancy for performance improvement:

### When to Denormalize

| Situation | Example |
|----------|--------|
| Frequent read operations | Reports, dashboards |
| Complex JOINs | Aggregated data |
| Latency requirements | Real-time systems |
| Data caching | Popular queries |

```sql
-- Denormalization: storing order total
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL,  -- denormalized field
    item_count INT         -- denormalized field
);

CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT,
    quantity INT,
    price DECIMAL,
    item_total DECIMAL    -- quantity * price
);
```

## Trade-offs

| Advantages | Disadvantages |
|-------------|-------------|
| Fewer JOINs | Data redundancy |
| Improved read performance | Maintenance complexity |
| Simpler queries | Anomaly risks |
| Reduced DB load | Synchronization necessity |

## When to Apply

- Apply normalization first (start with 3NF)
- Denormalize only with proven necessity
- Document denormalization decisions
- Test performance before and after

## Related Skills

- `data-modeling-erd` — entities and relationships
- `data-modeling-indexing` — index strategy
- `database-optimization` — performance tuning
