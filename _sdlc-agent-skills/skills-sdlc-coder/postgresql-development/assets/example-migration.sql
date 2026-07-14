-- Example: Reversible database migration pattern
-- Migration: Create users table with email verification

BEGIN;

-- Forward migration
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL UNIQUE,
    email_verified BOOLEAN DEFAULT false,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_email_verified ON users(email_verified) WHERE email_verified = true;

-- Audit trigger
CREATE TABLE users_audit (
    operation CHAR(1) NOT NULL,
    changed_at TIMESTAMP NOT NULL DEFAULT now(),
    user_id UUID NOT NULL,
    old_email VARCHAR(255),
    new_email VARCHAR(255)
);

CREATE OR REPLACE FUNCTION audit_users()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO users_audit (operation, user_id, old_email, new_email)
        VALUES ('U', OLD.id, OLD.email, NEW.email);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_audit_trigger
    AFTER UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION audit_users();

COMMIT;

-- ===== ROLLBACK (execute manually if needed) =====
/*
BEGIN;
DROP TRIGGER IF EXISTS users_audit_trigger ON users;
DROP TABLE IF EXISTS users_audit;
DROP INDEX IF EXISTS idx_users_email;
DROP INDEX IF EXISTS idx_users_email_verified;
DROP TABLE IF EXISTS users;
COMMIT;
*/
