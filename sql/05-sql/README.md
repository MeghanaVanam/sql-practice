# SELECT, WHERE, ORDER BY, LIMIT, DISTINCT

## What I learned
- **SELECT / WHERE** — retrieving rows and filtering them by condition (already used extensively in earlier topics).
- **ORDER BY** — sorts result rows. `ASC` (default) for ascending, `DESC` for descending. Can sort by multiple columns, applied in order left to right.
- **LIMIT** — restricts the number of rows returned. Commonly paired with `ORDER BY` for "Top N" queries.
- **DISTINCT** — removes duplicate values from the result set.

## Common real-world pattern: "Top N" queries
`ORDER BY` + `LIMIT` together answer questions like "top 5 highest-paid employees" or "3 most recent orders" — one of the most frequently used query patterns in both interviews and real jobs.

```sql
SELECT * FROM products ORDER BY price DESC LIMIT 3;
```

## What the queries in `queries.sql` demonstrate
- Sorting all products by price, descending
- Finding the 3 cheapest products using `ORDER BY` + `LIMIT`
- Getting distinct category values with `DISTINCT`
- Multi-column sorting: category alphabetically, then price descending within each category
- Combining `WHERE` + `ORDER BY` + `LIMIT` to find the most expensive in-stock product

## Gotchas I ran into
- Sorting text is **case-sensitive** by default in most databases, and uppercase letters sort before lowercase in ASCII order. So `'Books'`, `'Drink'`, `'Food'`, `'Travel'` sorted before `'clothes'`, even though a human would expect "clothes" alphabetically between "Books" and "Drink." Mixed-case data is a common real-world trap when sorting.