# PostgreSQL Development Checklists

## Schema Design Checklist

- [ ] Primary keys defined for all tables
- [ ] Foreign keys indexed
- [ ] NOT NULL constraints applied where needed
- [ ] CHECK constraints for business rules
- [ ] Appropriate data types chosen
- [ ] Normalization level documented (3NF/BCNF)
- [ ] ERD created and reviewed
- [ ] Naming conventions followed

## Query Optimization Checklist

- [ ] `EXPLAIN ANALYZE` run on slow queries
- [ ] Sequential scans eliminated for large tables
- [ ] Indexes on frequently queried columns
- [ ] JOINs use indexed columns
- [ ] Subqueries optimized or replaced with JOINs
- [ ] `LIMIT` used for pagination
- [ ] Connection pooling configured
- [ ] Query plans cached when appropriate

## Security Checklist

- [ ] Superuser privileges restricted
- [ ] Application user has minimal privileges
- [ ] Row Level Security (RLS) enabled where needed
- [ ] Sensitive data encrypted
- [ ] Audit logging enabled
- [ ] Connection restricted to trusted hosts
- [ ] SSL/TLS enforced for connections
- [ ] Passwords stored with strong hashing (bcrypt, Argon2)

## Backup & Recovery Checklist

- [ ] Regular `pg_dump` scheduled
- [ ] Base backups configured
- [ ] WAL archiving enabled
- [ ] Point-in-time recovery tested
- [ ] Backup restoration procedure documented
- [ ] Replication configured for HA
- [ ] Failover tested in staging

## Performance Monitoring Checklist

- [ ] `pg_stat_statements` enabled
- [ ] Slow query log configured
- [ ] Table bloat monitored
- [ ] Index usage tracked
- [ ] Connection count monitored
- [ ] Vacuum/analyze scheduled
- [ ] Alerting configured for thresholds
