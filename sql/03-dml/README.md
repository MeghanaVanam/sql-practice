# DML — INSERT, UPDATE, DELETE

## What I learned
- **INSERT** — adds new rows into a table.
- **UPDATE** — modifies existing rows. Always needs a `WHERE` clause, otherwise it updates *every* row in the table.
- **DELETE** — removes rows. Also needs a `WHERE` clause, otherwise it wipes the entire table. Unlike `TRUNCATE`, `DELETE` supports `WHERE` and can be rolled back.

## Key habit: preview before you delete/update
Before running an `UPDATE` or `DELETE`, run a `SELECT` with the exact same `WHERE` clause first. This shows you precisely which rows will be affected before you commit to changing or removing them — a small habit that prevents costly mistakes on real data.

```sql
-- Preview first
SELECT * FROM products WHERE id = 3;

-- Then act
DELETE FROM products WHERE id = 3;
```

## What the queries in `queries.sql` demonstrate
- Inserting new rows into an existing table
- Updating a single row's value by `id` (price increase)
- Updating multiple rows at once using a condition (`price > 1000`)
- Previewing a row with `SELECT` before deleting it
- Deleting a specific row by `id`

## Gotchas I ran into
- Forgetting `WHERE` in `UPDATE` or `DELETE` silently affects the whole table — no warning, no confirmation. Always double-check the `WHERE` clause before running these on real data.
- `DELETE` and `TRUNCATE` look similar but behave differently: `DELETE` respects `WHERE` and can be rolled back; `TRUNCATE` clears everything and usually can't be undone.S