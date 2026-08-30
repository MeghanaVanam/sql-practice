# DDL — CREATE, ALTER, DROP, TRUNCATE

## What I learned
- **CREATE** — defines a new table (or database/index) and its structure.
- **ALTER** — modifies an existing table's structure (add/drop/rename columns, change column data types).
- **DROP** — permanently deletes a table, including both its structure and data.
- **TRUNCATE** — deletes all rows from a table but keeps the table structure intact. Faster than `DELETE`, and (in most DBs) can't be rolled back.

## Key interview distinction: DROP vs TRUNCATE vs DELETE
| Command | Removes | Structure kept? | Can use WHERE? | Rollback? |
|---|---|---|---|---|
| `DROP` | Table + data | ❌ No | ❌ No | ❌ No |
| `TRUNCATE` | All rows | ✅ Yes | ❌ No | ❌ No (usually) |
| `DELETE` | Rows (DML, not DDL) | ✅ Yes | ✅ Yes | ✅ Yes |

## What the queries in `queries.sql` demonstrate
- Creating the `products` table and inserting sample data
- Adding a new column with `ALTER TABLE ... ADD COLUMN`
- Renaming a column with `ALTER TABLE ... RENAME COLUMN`
- Changing a column's data type with `ALTER TABLE ... ALTER COLUMN ... TYPE`
- Dropping a column with `ALTER TABLE ... DROP COLUMN`
- Creating a backup table with `CREATE TABLE ... AS SELECT`
- Using `TRUNCATE TABLE` to clear data while keeping the table structure

## Gotchas I ran into
- Every `ALTER` command must start with `ALTER TABLE table_name` — there's no standalone `ALTER COLUMN` clause.
- You can't `ALTER COLUMN ... TYPE` to an incompatible type — e.g. converting a `VARCHAR` column full of text like `'Food'` to `DECIMAL` fails, since the existing data isn't valid for the new type.