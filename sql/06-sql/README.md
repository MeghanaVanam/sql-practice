# GROUP BY, HAVING

## What I learned
- **GROUP BY** — splits rows into groups based on a column's value. Aggregate functions (`COUNT`, `SUM`, `AVG`, etc.) then operate *per group* instead of across the whole table.
- **HAVING** — filters *groups* after aggregation has happened, unlike `WHERE` which filters individual rows *before* grouping.

## Key interview distinction: WHERE vs HAVING
| | Filters | When it runs | Can use aggregate functions? |
|---|---|---|---|
| `WHERE` | Individual rows | Before grouping | ❌ No |
| `HAVING` | Groups | After aggregation | ✅ Yes |

```sql
-- WHERE filters rows first, then GROUP BY groups what's left, then HAVING filters the groups
SELECT product_category, SUM(price)
FROM products
WHERE in_stock = 1
GROUP BY product_category
HAVING SUM(price) > 200;
```

## What the queries in `queries.sql` demonstrate
- Counting products per category (`GROUP BY` + `COUNT`)
- Summing price per category (`GROUP BY` + `SUM`)
- Filtering to categories with an average price above a threshold (`GROUP BY` + `HAVING AVG(...)`)
- Filtering to categories with more than 1 product (`HAVING COUNT(*) > 1`)
- Combining `WHERE` (row-level filter) with `GROUP BY` + `HAVING` (group-level filter) together

## Gotchas I ran into
- Using an aggregate function like `AVG()` without a `GROUP BY` computes it across the *entire* table, not per group — easy mistake if you forget to add `GROUP BY` when you meant to compare categories.
- An empty result from `HAVING` isn't always a bug — sometimes the data genuinely doesn't have any group matching the condition (e.g. no category had more than 1 product in my dataset). Worth checking the data before assuming the query is wrong.