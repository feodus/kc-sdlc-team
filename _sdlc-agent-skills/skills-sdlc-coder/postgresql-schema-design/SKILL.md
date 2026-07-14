---
name: postgresql-schema-design
description: PostgreSQL schema design: data types, table relationships, constraints, normalization, and ERD implementation. Use this skill when designing database schemas and defining data integrity rules.
---

# PostgreSQL Schema Design

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** postgresql-development

## Purpose

This subskill covers PostgreSQL schema design: data types, table relationships (1:1, 1:N, M:N), constraints (NOT NULL, CHECK, FOREIGN KEY, UNIQUE), and normalization principles. Use it when creating or reviewing database schemas.

## When to Use

Use this skill:
- When designing new database tables and relationships
- For defining data types and constraints
- When implementing foreign keys and cascading rules
- For creating junction tables for many-to-many relationships
- During data model review and optimization

## Data Types

```sql
-- Main types
CREATE TABLE users (
    id SERIAL PRIMARY KEY,           -- Auto increment
    uuid UUID DEFAULT gen_random_uuid(), -- UUID
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT,                         -- Text without limit
    age INTEGER,                      -- Integer
    price DECIMAL(10, 2),             -- Exact numbers
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    metadata JSONB,                   -- JSON (optimized)
    tags TEXT[]                       -- Array
);

-- JSONB examples
INSERT INTO users (username, metadata) VALUES 
    ('john', '{"age": 30, "city": "NYC"}'::jsonb);

SELECT metadata->>'age' as age FROM users;
SELECT metadata->'address'->>'city' FROM users WHERE metadata ? 'address';

-- Arrays
ALTER TABLE users ADD COLUMN skills TEXT[];
UPDATE users SET skills = ARRAY['Python', 'Django'] WHERE id = 1;
SELECT * FROM users WHERE skills && ARRAY['Python'];
```

## Table Relationships

```sql
-- One-to-One
CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    bio TEXT,
    avatar_url VARCHAR(500)
);

-- One-to-Many (Categories -> Products)
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INTEGER REFERENCES categories(id)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Many-to-Many (Products <-> Orders)
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Junction table for many-to-many
CREATE TABLE product_tags (
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (product_id, tag_id)
);
```

## Constraints

```sql
-- Check constraints
CREATE TABLE products (
    price DECIMAL(10, 2) CHECK (price > 0),
    discount DECIMAL(10, 2) CHECK (discount >= 0 AND discount <= 100)
);

-- Partial unique index
CREATE UNIQUE INDEX active_emails 
ON users(email) WHERE is_active = true;

-- Exclusion constraints (prevent overlapping dates)
CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    room_id INTEGER REFERENCES rooms(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    EXCLUDE USING gist (
        room_id WITH =,
        tstzrange(start_date, end_date) WITH &&
    )
);
```

## Related Skills

- `postgresql-query-optimization` — indexes and query performance
- `postgresql-advanced-features` — full-text search, replication, backup
- `data-modeling` — ERD design and normalization
