# RDBMS Basics, Data Types & Operators

## What I practiced
- Creating a table with appropriate data types (`INT`, `VARCHAR`, `DECIMAL`, `INTEGER`)
- Inserting sample rows
- Filtering data using:
  - `BETWEEN` for range queries
  - `LIKE` for pattern matching
  - `IN` for matching against a list of values
  - `IS NOT NULL` combined with `!=` for exclusion logic

## Key learning
- `DECIMAL(p, s)` — `p` is total digits, `s` is digits after the decimal.
  Initially used `DECIMAL(3,2)` (max value 9.99) which overflowed with 
  prices like 200 or 1500. Fixed by using `DECIMAL(10,2)`.

## File
See [`queries.sql`](./queries.sql) for the full code.