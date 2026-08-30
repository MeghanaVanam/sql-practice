CREATE TABLE products(
    id INT,
    name VARCHAR(50),
    price DECIMAL(10,2),
    category VARCHAR(255),
    in_stock INTEGER
);
INSERT INTO products(id, name, price, category, in_stock)
VALUES
    (1, 'Meghana', 200.0, 'Food', 1),
    (2, 'Sanemi', 350.0, 'Drink', 1),
    (3, 'Gyutaro', 1500.0, 'Movie', 0),
    (4, 'Mitsuri', 2500.0, 'Travel', 0);
SELECT * FROM products WHERE price BETWEEN 100 AND 500;
SELECT name FROM products WHERE name LIKE 'S%';
SELECT * FROM products WHERE category IN ('Food', 'Drink', 'Movie', 'Travel');
SELECT * FROM products WHERE in_stock IS NOT NULL AND price != 0;
ALTER TABLE products ADD COLUMN discount_percent DECIMAL(5,2);
ALTER TABLE products RENAME COLUMN category TO product_category;
ALTER TABLE products ALTER COLUMN discount_percent TYPE DECIMAL(6,2);
ALTER TABLE products DROP COLUMN discount_percent;
CREATE TABLE products_backup AS SELECT * FROM products;
TRUNCATE TABLE products_backup;
-- The data is gone while the table structure remains, because TRUNCATE only clears rows, not the table definition.