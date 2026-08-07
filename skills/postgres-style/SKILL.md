---
name: postgres-style
description: My Postgres database schema conventions — table/column naming, key strategy, and timestamp columns. Use whenever designing or editing database schemas, migrations, or tables.
---

# Postgres Style

- Singular table names rather than plural (e.g. `user`, not `users`)
- `snake_case` for column names
- Prefer UUID over auto-increment integer for primary keys
- Add `created_at` and `updated_at` timestamp columns to tables unless otherwise specified

## Migration safety

- Make copies or dumps of any databases prior to running any migrations
- Check with the user before running any database migrations
