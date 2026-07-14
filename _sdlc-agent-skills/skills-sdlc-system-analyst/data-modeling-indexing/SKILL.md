---
name: data-modeling-indexing
description: Indexing strategy for data models: index types, composite indexes, partial indexes, and constraints. Use this skill when designing indexes and integrity rules for relational databases.
---

# Data Modeling — Indexing

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** data-modeling

## Purpose

This subskill focuses on indexing strategies for relational data models: index types, composite indexes, partial indexes, constraints, and their performance implications. Use it when designing data models optimized for query performance.

## When to Use

Use this skill:
- When defining index strategy for new tables
- For choosing between index types (B-Tree, GIN, GiST, BRIN)
- When designing composite and covering indexes
- For applying data integrity constraints
- During data model performance reviews

## Index Types

| Index Type | Description | Example |
|-------------|----------|--------|
| **Primary Index** | Automatically created for PK | CLUSTERED |
| **Unique Index** | Ensures uniqueness | UNIQUE |
| **Composite Index** | On multiple columns | (last_name, first_name) |
| **Partial Index** | Part of table | WHERE status = 'active' |
| **Bitmap Index** | For low-cardinality fields | gender, status |
| **Full-text Index** | For text search | title, description |

## Index Creation Rules

1. **Index:**
   - Columns in WHERE
   - Columns in JOIN (FK)
   - Columns in ORDER BY
   - Columns with high selectivity

2. **Don't index:**
   - Low selectivity columns (boolean, gender)
   - Frequently updated columns
   - Small tables
   - Columns with NULL in most rows

## Example Indexing Strategy

```sql
-- Primary Key
ALTER TABLE users ADD PRIMARY KEY (id);

-- Unique index for email
CREATE UNIQUE INDEX idx_users_email ON users(email);

-- Composite index for frequently used query
CREATE INDEX idx_orders_user_date ON orders(user_id, order_date DESC);

-- Partial index for active records
CREATE INDEX idx_products_active ON products(product_id) 
WHERE status = 'active';

-- Composite index for covering query
CREATE INDEX idx_order_items_composite 
ON order_items(order_id, product_id, quantity, price);

-- Expression index
CREATE INDEX idx_users_lower_email ON users(LOWER(email));
```

## Constraints

Data integrity constraints:

| Constraint | Description | Example |
|-----------|----------|--------|
| **NOT NULL** | Mandatory value | `name VARCHAR(100) NOT NULL` |
| **UNIQUE** | Unique value | `email VARCHAR(255) UNIQUE` |
| **PRIMARY KEY** | Unique identifier | `id INT PRIMARY KEY` |
| **FOREIGN KEY** | Reference to another table | `user_id INT REFERENCES users(id)` |
| **CHECK** | Condition | `age INT CHECK (age >= 0)` |
| **DEFAULT** | Default value | `status VARCHAR(20) DEFAULT 'active'` |

```sql
-- Cascading operations
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CHECK constraint
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    quantity INT CHECK (quantity >= 0),
    discount DECIMAL(3,2) CHECK (discount BETWEEN 0 AND 1)
);

-- Composite unique constraint
CREATE TABLE user_roles (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id)
);
```

## Performance Impact

| Operation | Without Index | With Index |
|----------|-------------|------------|
| SELECT | Full table scan | Index scan |
| INSERT | O(1) | O(log n) + index write |
| UPDATE | O(1) | O(log n) + index write |
| DELETE | O(1) | O(log n) + index write |

## Usage Recommendations

1. Always use NOT NULL for required fields
2. Apply FOREIGN KEY for referential integrity
3. Use CHECK for business rules
4. Avoid excessive constraints affecting performance
5. Regularly analyze index usage

## Related Skills

- `data-modeling-erd` — entities and relationships
- `data-modeling-normalization` — normalization and denormalization
- `database-optimization` — query performance tuning
