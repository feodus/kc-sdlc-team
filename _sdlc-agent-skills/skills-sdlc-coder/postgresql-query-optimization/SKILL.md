---
name: postgresql-query-optimization
description: PostgreSQL query optimization: indexes, EXPLAIN ANALYZE, query tuning, VACUUM, and performance best practices. Use this skill when improving database query performance.
---

# PostgreSQL Query Optimization

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** postgresql-development

## Purpose

This subskill focuses on PostgreSQL performance optimization: index strategies, query analysis with EXPLAIN ANALYZE, query rewriting, and maintenance operations like VACUUM and ANALYZE. Use it when diagnosing slow queries or tuning database performance.

## When to Use

Use this skill:
- When analyzing slow or inefficient queries
- For designing optimal index strategies
- When rewriting queries for better performance
- For configuring autovacuum and statistics updates
- During database performance tuning

## Indexes

### Index Types

```sql
-- B-Tree (default)
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_price ON products(price DESC);
CREATE INDEX idx_users_email ON users(email) UNIQUE;

-- GIN (for JSON, arrays, full-text search)
CREATE INDEX idx_products_metadata ON products USING GIN(metadata);
CREATE INDEX idx_users_skills ON users USING GIN(skills);

-- GiST (for geometric data, text)
CREATE INDEX idx_locations_coords ON locations USING GIST(coordinates);

-- BRIN (for large tables with sequential data)
CREATE INDEX idx_logs_created ON logs USING BRIN(created_at);

-- Composite indexes
CREATE INDEX idx_products_category_price 
ON products(category_id, price DESC);

-- Partial indexes
CREATE INDEX idx_active_products ON products(name) 
WHERE is_available = true;

-- Expression indexes
CREATE INDEX idx_users_lower_email ON users(LOWER(email));
CREATE INDEX idx_products_name_search ON products 
USING GIN(to_tsvector('russian', name));
```

## EXPLAIN ANALYZE

```sql
-- Query analysis
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT * FROM products 
WHERE category_id = 1 
ORDER BY price DESC;

-- Plan analysis
-- Seq Scan on products  (cost=0.00..25.88 rows=5 width=40) (actual time=0.015..0.025 rows=5 loops=1)
--   Filter: (category_id = 1)
--   Buffers: shared hit=2
-- Planning Time: 0.123 ms
-- Execution Time: 0.045 ms
```

## Query Optimization

```sql
-- Create proper indexes
CREATE INDEX idx_products_category_price 
ON products(category_id, price DESC);

-- Use covering indexes
CREATE INDEX idx_products_cover 
ON products(category_id) INCLUDE (name, price);

-- Rewrite queries
-- Instead of:
SELECT * FROM products WHERE price > 100 AND price < 500;
-- Use:
SELECT * FROM products WHERE price BETWEEN 100 AND 500;

-- Instead of subqueries - JOIN
-- Instead of:
SELECT * FROM users WHERE id IN (SELECT user_id FROM orders);
-- Use:
SELECT DISTINCT u.* FROM users u
JOIN orders o ON u.id = o.user_id;

-- Pagination with cursor
-- Instead of OFFSET (slow for large pages):
SELECT * FROM products ORDER BY id LIMIT 10 OFFSET 10000;
-- Use cursor:
SELECT * FROM products WHERE id > 10000 ORDER BY id LIMIT 10;
```

## VACUUM and ANALYZE

```sql
-- VACUUM (free space)
VACUUM products;
VACUUM FULL products;  -- Requires exclusive lock

-- ANALYZE (update statistics)
ANALYZE products;

-- Automatic vacuum
ALTER TABLE products SET (
    autovacuum_vacuum_threshold = 1000,
    autovacuum_analyze_threshold = 500
);
```

## Related Skills

- `postgresql-schema-design` — schema and constraint design
- `postgresql-advanced-features` — advanced PostgreSQL features
- `data-modeling` — data model design
