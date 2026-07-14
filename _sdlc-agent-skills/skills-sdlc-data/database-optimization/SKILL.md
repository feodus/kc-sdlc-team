---
name: database-optimization
description: Database performance optimization, indexes, queries, tuning. Use to improve database performance.
---

# Database Optimization

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for optimizing database performance. Includes creating indexes, query optimization, configuration tuning, and execution plan analysis.

## When to Use

Use this skill:
- For slow queries
- When creating indexes
- When tuning performance
- For analyzing execution plans
- When troubleshooting performance
- For memory tuning

## Index Strategy

### Index Types

| Type | Use Case |
|------|---------|
| B-Tree | Equality, range queries |
| Hash | Exact match |
| GiST | Full-text, GIS |
| BRIN | Time-series |

### Creating Indexes

```sql
-- Single column index
CREATE INDEX idx_users_email ON users(email);

-- Composite index
CREATE INDEX idx_orders_customer_date 
ON orders(customer_id, order_date);
```

## Query Optimization

### Bad Practices

```sql
-- SELECT *
SELECT * FROM orders WHERE id = 123;
```

### Good Practices

```sql
-- SELECT columns needed
SELECT id, name FROM orders WHERE id = 123;
```

## Execution Plans

```sql
-- PostgreSQL
EXPLAIN ANALYZE 
SELECT * FROM orders WHERE customer_id = 123;
```

### Reading Plans

```
Seq Scan on orders  (cost=0.00..100.00 rows=10 width=100)
  Filter: (customer_id = 123)
```

## Configuration

```sql
-- PostgreSQL tuning
ALTER SYSTEM SET shared_buffers = '4GB';
ALTER SYSTEM SET work_mem = '64MB';
```

## Monitoring

```sql
-- Top queries
SELECT 
    query, 
    calls, 
    mean_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
```

## Quality Criteria

- [ ] Indexes created for frequently used columns
- [ ] Queries optimized
- [ ] Execution plans analyzed
- [ ] Monitoring configured
- [ ] Slow queries identified