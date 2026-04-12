---
name: data-migration
description: Data migration between systems, databases, platforms. Use for safe data migration.
---

# Data Migration

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for migrating data between systems. Includes planning, execution, validation, and rollback during migration.

## When to Use

Use this skill:
- For database migrations
- For platform migration
- When consolidating data
- For cloud migration
- When upgrading database version
- For archive migrations

## Migration Strategy

### Phases

```
1. Assessment → 2. Planning → 3. Development → 4. Testing → 5. Execution → 6. Validation
```

### Migration Types

| Type | Description | Downtime |
|------|-------------|----------|
| Big Bang | All at once | High |
| Phased | Step by step | Medium |
| Trickle | Continuous | Low |

## Planning

### Data Analysis

```sql
-- Data volume analysis
SELECT 
    COUNT(*) as total_rows,
    COUNT(DISTINCT id) as unique_ids,
    MIN(created_at) as earliest,
    MAX(created_at) as latest
FROM source_table;
```

### Dependency Mapping

```sql
-- Finding dependencies
SELECT
    fk_table_name,
    fk_column_name,
    pk_table_name,
    pk_column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'public';
```

## Migration Scripts

### Basic Migration

```python
import psycopg2
from sqlalchemy import create_engine

def migrate_data(source_conn, target_conn, batch_size=10000):
    """Basic batch migration"""
    
    source = create_engine(source_conn)
    target = create_engine(target_conn)
    
    offset = 0
    while True:
        # Extract batch
        query = f"""
            SELECT * FROM source_table 
            ORDER BY id 
            LIMIT {batch_size} OFFSET {offset}
        """
        df = pd.read_sql(query, source)
        
        if df.empty:
            break
        
        # Transform (if needed)
        df['migrated_at'] = pd.Timestamp.now()
        
        # Load
        df.to_sql('target_table', target, if_exists='append', index=False)
        
        offset += batch_size
        print(f"Migrated {offset} rows...")
    
    return offset
```

### Type Mapping

```python
# Oracle to PostgreSQL mapping
TYPE_MAPPING = {
    'VARCHAR2': 'VARCHAR',
    'NUMBER': 'NUMERIC',
    'DATE': 'TIMESTAMP',
    'CLOB': 'TEXT',
    'BLOB': 'BYTEA'
}
```

## Data Validation

### Row Count Validation

```sql
-- Source and target counts
SELECT 
    (SELECT COUNT(*) FROM source) as source_count,
    (SELECT COUNT(*) FROM target) as target_count;
```

### Data Validation Queries

```sql
-- Key column validation
SELECT s.id, s.name, t.name
FROM source_table s
FULL OUTER JOIN target_table t ON s.id = t.id
WHERE s.name <> t.name OR s.id IS NULL OR t.id IS NULL;
```

## Rollback Strategy

```python
def rollback(target_conn):
    """Rollback to source state"""
    with target_conn.cursor() as cur:
        # Preserve data before migration
        cur.execute("""
            CREATE TABLE target_table_backup AS 
            SELECT * FROM target_table
        """)
```

## Zero-Downtime Migration

```python
def zero_downtime_migration():
    """Blue-green migration"""
    
    # 1. Create new table
    create_table('target_table_new')
    
    # 2. Migrate existing data
    migrate_data('source_table', 'target_table_new')
    
    # 3. Setup triggers for new data
    create_triggers('source_table', 'target_table_new')
    
    # 4. Switch read replicas
    # (Done via DNS switch)
    
    # 5. Clean up old table
    # drop_table('target_table_old')
```

## Performance

```python
# Parallel migration
from concurrent.futures import ThreadPoolExecutor

def parallel_migrate(partitions):
    with ThreadPoolExecutor(max_workers=4) as executor:
        futures = [executor.submit(migrate_partition, p) for p in partitions]
        results = [f.result() for f in futures]
```

## Logging

```python
import logging

def log_migration(operation, row_count, duration):
    logging.info(f"Migration {operation}: {row_count} rows in {duration}s")
```

## Quality Criteria

- [ ] Full audit trail
- [ ] Rollback plan
- [ ] Zero-downtime (if required)
- [ ] Data validation after each phase
- [ ] Performance testing
- [ ] Monitoring