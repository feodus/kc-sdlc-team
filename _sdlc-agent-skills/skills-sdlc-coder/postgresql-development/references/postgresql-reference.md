# PostgreSQL Development Reference

> Source: PostgreSQL 12-16 documentation, best practices

## Data Types

| Category | Types | Use Case |
|----------|-------|----------|
| Integer | `smallint`, `integer`, `bigint` | Counters, IDs |
| Decimal | `numeric(p,s)`, `real`, `double precision` | Money, precise calculations |
| Text | `varchar(n)`, `text`, `char(n)` | Strings, descriptions |
| Binary | `bytea` | Binary data, files |
| Date/Time | `date`, `time`, `timestamp`, `interval` | Schedules, logs |
| Boolean | `boolean` | Flags, status |
| JSON | `json`, `jsonb` | Documents, configs |
| Arrays | `type[]` | Lists, tags |
| UUID | `uuid` | Distributed IDs |
| Network | `inet`, `cidr`, `macaddr` | IP addresses |

## Constraints

- **Primary Key:** Unique identifier, NOT NULL, creates index
- **Foreign Key:** Referential integrity between tables
- **Unique:** Ensures uniqueness across rows
- **Check:** Validates value against condition
- **Not Null:** Disallows NULL values
- **Default:** Provides fallback value

## Indexes

| Type | Use Case | Example |
|------|----------|---------|
| B-tree | Equality, range | `CREATE INDEX idx_name ON table(col)` |
| Hash | Equality only | `CREATE INDEX idx_hash ON table USING HASH (col)` |
| GIN | JSONB, arrays, full-text | `CREATE INDEX idx_gin ON table USING GIN (jsonb_col)` |
| GiST | Geometric, range types | `CREATE INDEX idx_gist ON table USING GIST (geom)` |

## JSONB Operations

```sql
-- Query nested JSONB
SELECT data FROM docs WHERE data->>'status' = 'published';

-- JSONB operators
->  Get JSON object by key
->> Get JSON value as text
#>> Get text[] path
@> Contains operator
?   Key exists
?|  Any key exists
```

## Performance Tuning

- Use `EXPLAIN ANALYZE` for query plans
- Index foreign keys
- Avoid `SELECT *` in production
- Use `LIMIT` for large result sets
- Connection pooling (PgBouncer)
- Partitioning for large tables
- VACUUM and ANALYZE regularly

## Backup Strategies

- `pg_dump` / `pg_dumpall`: Logical backups
- `pg_basebackup`: Physical backups
- WAL archiving: Point-in-time recovery
- Continuous archiving: Minimal data loss

## Replication

- Streaming replication (primary/standby)
- Logical replication (selective tables)
- Automatic failover (Patroni, repmgr)

## Security

- Role-based access control (RBAC)
- Row Level Security (RLS)
- Data encryption (transit: TLS, at rest: disk encryption)
- Audit logging (`pgaudit`)
- Connection restrictions (`pg_hba.conf`)
