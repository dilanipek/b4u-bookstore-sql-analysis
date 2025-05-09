-- 1. Top-Selling Book Categories by Revenue
SELECT c.name AS category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM b4u.order_items oi
JOIN b4u.books b ON oi.book_id = b.book_id
JOIN b4u.categories c ON b.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC;


-- 2. Authors by Total Revenue
SELECT a.name AS author_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM b4u.order_items oi
JOIN b4u.books b ON oi.book_id = b.book_id
JOIN b4u.authors a ON b.author_id = a.author_id
GROUP BY a.name
ORDER BY total_revenue DESC;


-- 3. Overstocked Books that Don't Sell Well
SELECT b.title AS book_title, b.stock AS stock_level, COALESCE(SUM(oi.quantity), 0) AS total_sales
FROM b4u.books b
LEFT JOIN b4u.order_items oi ON b.book_id = oi.book_id
GROUP BY b.title, b.stock
HAVING b.stock > COALESCE(SUM(oi.quantity), 0)
ORDER BY b.stock DESC;

-- 4. Promotion Effectiveness (Example based on a 'promotion' field)
SELECT o.order_date, COUNT(o.order_id) AS total_orders, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM b4u.orders o
JOIN b4u.order_items oi ON o.order_id = oi.order_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-03-31'  -- Example of recent period
GROUP BY o.order_date
ORDER BY o.order_date DESC;

-- 5. Customer Order History
SELECT c.full_name, o.order_date, oi.book_id, b.title, oi.quantity, oi.unit_price, oi.quantity * oi.unit_price AS total
FROM b4u.customers c
JOIN b4u.orders o ON c.customer_id = o.customer_id
JOIN b4u.order_items oi ON o.order_id = oi.order_id
JOIN b4u.books b ON oi.book_id = b.book_id
WHERE c.customer_id = 1 -- Example for a specific customer
ORDER BY o.order_date DESC;
