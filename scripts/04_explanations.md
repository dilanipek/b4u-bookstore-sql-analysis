# 04_explanations.md

## 🧠 SQL Concepts & Functions Explained

This document explains key SQL statements and functions used in the analytical queries in `03_select_queries.sql`. These are essential for Business Analysts to understand data relationships, aggregations, and performance metrics.

---

### ✅ SELECT
Retrieves data from tables.

```sql
SELECT name, revenue FROM authors;
```

Extracts specific columns for reporting or analysis.

✅ JOIN Types

🔹 INNER JOIN
Returns rows where there is a match in both tables based on a specified condition.


```sql
SELECT b.title, a.name  
FROM books b  
INNER JOIN authors a ON b.author_id = a.id;

```
Used when you only want data that exists in both related tables.
Example use case: Listing all books with their respective authors.

🔹 LEFT JOIN
Returns all rows from the left table, and matched rows from the right table. Unmatched rows show NULLs.

```sql
SELECT b.title, r.return_date  
FROM books b  
LEFT JOIN returns r ON b.id = r.book_id;

```

Ensures no data is lost from the main table, even if there’s no match.
Example use case: Identifying books that have never been returned.

🔢 COUNT(), SUM(), AVG()
Aggregation functions to perform calculations over a set of rows.


```sql
SELECT COUNT(*) FROM orders;  
SELECT SUM(price) FROM books;  
SELECT AVG(price) FROM books;

```
Used to generate KPIs such as total orders, total revenue, or average book price.

🎯 GROUP BY
Groups rows sharing a common value so that aggregation functions can be applied.

```sql

SELECT category, SUM(price) AS total_sales  
FROM books  
GROUP BY category;

```

Example use case: Analyzing revenue by book category.

🧱 HAVING
Filters groups after aggregation (similar to WHERE, but used with GROUP BY).

```sql

SELECT category, SUM(price) AS total_sales  
FROM books  
GROUP BY category  
HAVING SUM(price) > 1000;

```


Example use case: Showing only top-performing categories.

🧼 COALESCE()
Replaces NULL values with a specified default.

```sql

SELECT title, COALESCE(SUM(oi.quantity), 0) AS units_sold  
FROM books b  
LEFT JOIN order_items oi ON b.id = oi.book_id  
GROUP BY b.title;

```
Use case: Prevents NULL results when calculating sales for books with zero purchases.


🪜 RANK() OVER (PARTITION BY ... ORDER BY ...)

Window function to assign rankings within a group of rows.


```sql

SELECT customer_id, order_date,  
       RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank  
FROM orders;
```

Example use case: Identifying each customer’s first purchase.

🧩 CASE
Performs conditional logic in SQL, similar to IF/THEN in other languages.

```sql

SELECT title,  
       CASE  
         WHEN stock = 0 THEN 'Out of Stock'  
         WHEN stock < 5 THEN 'Low Stock'  
         ELSE 'In Stock'  
       END AS stock_status  
FROM books;

```

Use case: Categorizing stock levels to support inventory decisions.

📉 LIMIT
Restricts the number of rows returned by a query.

```sql

SELECT title, price  
FROM books  
ORDER BY price DESC  
LIMIT 5;
```
Use case: Displaying the top 5 most expensive books.

🔍 DISTINCT
Removes duplicate values from the result set.

```sql

SELECT DISTINCT category  
FROM books;
```
Use case: Getting a unique list of book categories for filters or dropdowns.

🗓️ DATE_TRUNC()
Truncates a timestamp or date to a specific part (e.g., month, year).

```sql

SELECT DATE_TRUNC('month', order_date) AS order_month,  
       COUNT(*) AS order_count  
FROM orders  
GROUP BY DATE_TRUNC('month', order_date);


```
Use case: Monthly sales reporting by grouping orders by calendar month.


