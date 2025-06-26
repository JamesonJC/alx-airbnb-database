# Airbnb Database Normalization (to 3NF)

Ensures that all tables in the Airbnb schema follow proper normalization, especially Third Normal Form (3NF), to avoid redundancy and maintain data integrity.

---

## Step 1: First Normal Form (1NF)

**Rule:**  
- Atomic fields only (no repeating groups or arrays).
- Unique rows with a primary key.

**All tables already follow 1NF.**  
**Example:** `User.phone_number` is atomic (1 value per row), not a list.

---

## Step 2: Second Normal Form (2NF)

**Rule:**  
- Must already be in 1NF.
- Remove partial dependencies (all non-key columns must depend on the *whole* primary key).

**All tables use single-column primary keys (`UUID`)**, so no partial dependencies exist.

---

## Step 3: Third Normal Form (3NF)

**Rule:**  
- Must be in 2NF.
- No transitive dependencies (non-key attributes depend *only* on the primary key, not other non-key columns).

---

### Table-by-Table Normalization Review

---

### 1. `User`

| Attribute        | Depends on `user_id`? | Issue? |
|------------------|------------------------|--------|
| first_name       | yes                     | No     |
| last_name        | yes                     | No     |
| email            | yes (also unique)       | No     |
| password_hash    | yes                     | No     |
| phone_number     | yes                     | No     |
| role             | yes but ENUM            | 🔄 Normalize ENUM |
| created_at       | yes                     | No     |

#### Action:
- Convert `role` ENUM into a separate table for full 3NF:

```sql
CREATE TABLE UserRole (
  role_id UUID PRIMARY KEY,
  role_name VARCHAR UNIQUE NOT NULL
);

-- Example roles
-- guest, host, admin

ALTER TABLE User
  ADD COLUMN role_id UUID,
  DROP COLUMN role,
  ADD FOREIGN KEY (role_id) REFERENCES UserRole(role_id);
