---
name: database-conventions
description: My database naming and schema conventions — models, tables, columns, required audit fields, and transaction usage. Use whenever designing or editing database schemas, models, or migrations.
---

# Database Conventions

- **Model names:** singular PascalCase (e.g., `User`, `MakerShop`, `MachineType`)
- **Table names:** singular snake_case via `@@map("snake_case")` — existing tables from crafterkit keep their names
- **Column names:** snake_case in DB, camelCase in ORM via `@map("snake_case")`
- **Required on all tables:** `id` (UUID PK), `created_at`, `updated_at`
- If UUID is not supported by database type, use auto-incremented Integer as PK instead
- **Required on user-modifiable tables:** `created_by_user_id`, `updated_by_user_id`
- Always use database transactions for multi-step writes