---
name: postgresql-advanced-features
description: PostgreSQL advanced features: full-text search, replication, backup/restore, functions, procedures, triggers, and JSONB operations. Use this skill when leveraging advanced PostgreSQL capabilities.
---

# PostgreSQL Advanced Features

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** postgresql-development

## Purpose

This subskill covers advanced PostgreSQL features: full-text search, replication, backup/restore, stored procedures, triggers, and JSONB operations. Use it when implementing complex server-side logic or enterprise-level PostgreSQL features.

## When to Use

Use this skill:
- When implementing full-text search capabilities
- For setting up logical replication and subscriptions
- When creating stored functions and procedures
- For implementing audit triggers
- During backup/restore operations
- When using advanced JSONB operators and functions

## Full-Text Search

```sql
-- Create text index
ALTER TABLE products ADD COLUMN name_tsv TSVECTOR;

UPDATE products SET name_tsv = to_tsvector('russian', name);

CREATE INDEX idx_products_name_search 
ON products USING GIN(name_tsv);

-- Search
SELECT * FROM products 
WHERE name_tsv @@ to_tsquery('russian', 'laptop & gaming');

-- With highlighting
SELECT 
    name,
    ts_headline('russian', name, to_tsquery('russian', 'laptop')) as highlighted
FROM products
WHERE name_tsv @@ to_tsquery('russian', 'laptop');
```

## Replication

```sql
-- Create replica (on master)
CREATE PUBLICATION mydb_pub FOR ALL TABLES;

-- On replica
CREATE SUBSCRIPTION mydb_sub 
CONNECTION 'host=master port=5432 dbname=mydb user=rep password=pass' 
PUBLICATION mydb_pub;
```

## Backup

```bash
# Backup
pg_dump -U user -Fc mydb > mydb.backup
pg_dump -U user -Fp mydb > mydb.sql

# Restore
pg_restore -U user -d mydb mydb.backup
psql -U user -d mydb < mydb.sql

# Backup with compression
pg_dump -U user -Fc mydb | gzip > mydb.sql.gz
```

## Functions and Procedures

### Functions

```sql
-- Simple function
CREATE OR REPLACE FUNCTION get_user_count()
RETURNS INTEGER AS $$
BEGIN
    RETURN COUNT(*)::INTEGER FROM users;
END;
$$ LANGUAGE plpgsql;

-- Function with parameters
CREATE OR REPLACE FUNCTION calculate_discount(
    price DECIMAL, 
    discount_percent INTEGER
)
RETURNS DECIMAL AS $$
BEGIN
    RETURN price * (100 - discount_percent) / 100;
END;
$$ LANGUAGE plpgsql;

-- Function returning table
CREATE OR REPLACE FUNCTION get_products_by_category(
    p_category_id INTEGER
)
RETURNS TABLE (
    id INTEGER,
    name VARCHAR(200),
    price DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.id, p.name, p.price
    FROM products p
    WHERE p.category_id = p_category_id;
END;
$$ LANGUAGE plpgsql;

-- Usage
SELECT get_user_count();
SELECT calculate_discount(100, 20);
SELECT * FROM get_products_by_category(1);
```

### Triggers

```sql
-- Trigger for updating timestamp
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_updated
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_timestamp();

-- Trigger for audit
CREATE TABLE audit_log (
    id SERIAL PRIMARY KEY,
    table_name VARCHAR(100),
    action VARCHAR(10),
    old_data JSONB,
    new_data JSONB,
    changed_by INTEGER,
    changed_at TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION audit_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log (table_name, action, new_data, changed_by)
        VALUES (TG_TABLE_NAME, 'INSERT', to_jsonb(NEW), current_user::integer);
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log (table_name, action, old_data, new_data, changed_by)
        VALUES (TG_TABLE_NAME, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW), current_user::integer);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log (table_name, action, old_data, changed_by)
        VALUES (TG_TABLE_NAME, 'DELETE', to_jsonb(OLD), current_user::integer);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

## Best Practices

1. **Normalize data** - avoid redundancy
2. **Use correct types** - each data type has its own type
3. **Create indexes** - for frequently filtered columns
4. **Analyze queries** - use EXPLAIN ANALYZE
5. **Partition** - for large tables
6. **Cache** - frequently requested data
7. **Monitor** - track slow queries
8. **Backup** - regularly create backups
9. **Use connection pooling** - pgBouncer, PgPool
10. **Configure parameters** - work_mem, shared_buffers

## Related Skills

- `postgresql-schema-design` — schema and constraint design
- `postgresql-query-optimization` — indexes and query tuning
- `data-modeling` — data model design
