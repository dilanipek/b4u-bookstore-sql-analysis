-- insert data into books table
 INSERT INTO b4u.books (title, author_id, price, stock, published_date, category_id) VALUES ('Animal Farm', 1, 12.50, 20, '1945-08-17', 2);
 INSERT INTO b4u.books (title, author_id, price, stock, published_date, category_id) VALUES ('Pride and Prejudice', 2, 10.00, 5, '1813-01-28', 3);
 INSERT INTO b4u.books (title, author_id, price, stock, published_date, category_id) VALUES ('Kafka on the Shore', 3, 18.75, 7, '2002-09-12', 4);
 INSERT INTO b4u.books (title, author_id, price, stock, published_date, category_id) VALUES ('Harry Potter and the Sorcerer''s Stone', 4, 25.00, 15, '1997-06-26', 5);
 INSERT INTO b4u.books (title, author_id, price, stock, published_date, category_id) VALUES ('1984', 1, 15.99, 10, '1949-06-08', 1);

--insert data into authors table 

-----------------------------------------
 INSERT INTO b4u.authors (name, bio) VALUES ('George Orwell', 'British writer known for 1984 and Animal Farm.');
 INSERT INTO b4u.authors (name, bio) VALUES ('Jane Austen', 'English novelist known for Pride and Prejudice.');
 INSERT INTO b4u.authors (name, bio) VALUES ('Haruki Murakami', 'Japanese author of surreal and contemporary fiction.');
 INSERT INTO b4u.authors (name, bio) VALUES ('J.K. Rowling', 'British author of the Harry Potter series.');


 -- insert data into categories table

 INSERT INTO b4u.categories (name) VALUES ('Science Fiction');
 INSERT INTO b4u.categories (name) VALUES ('Romance');
 INSERT INTO b4u.categories (name) VALUES ('Mystery');
 INSERT INTO b4u.categories (name) VALUES ('Biography');
 INSERT INTO b4u.categories (name) VALUES ('History');
 INSERT INTO b4u.categories (name) VALUES ('Self-help');
 INSERT INTO b4u.categories (name) VALUES ('Fantasy');
 INSERT INTO b4u.categories (name) VALUES ('Business');

-- insert data into customers table 

 INSERT INTO b4u.customers (full_name, email) VALUES ('Alice Smith', 'alice@example.com');
 INSERT INTO b4u.customers (full_name, email) VALUES ('Bob Johnson', 'bob@example.com');
 INSERT INTO b4u.customers (full_name, email) VALUES ('Charlie Brown', 'charlie@example.com');
 INSERT INTO b4u.customers (full_name, email) VALUES ('Diana Prince', 'diana@example.com');

 -- insert data into order_items table

  INSERT INTO b4u.order_items (order_id, book_id, quantity, unit_price) VALUES (7, 31, 1, 15.99);
 INSERT INTO b4u.order_items (order_id, book_id, quantity, unit_price) VALUES (7, 32, 2, 12.50);
 INSERT INTO b4u.order_items (order_id, book_id, quantity, unit_price) VALUES (8, 33, 1, 10.00);
 INSERT INTO b4u.order_items (order_id, book_id, quantity, unit_price) VALUES (9, 34, 1, 18.75);

 -- insert data into orders table

  INSERT INTO b4u.orders (customer_id, order_date, status) VALUES (1, '2025-05-01 10:30:00', 'completed');
 INSERT INTO b4u.orders (customer_id, order_date, status) VALUES (2, '2025-05-02 14:45:00', 'pending');
 INSERT INTO b4u.orders (customer_id, order_date, status) VALUES (3, '2025-05-03 09:15:00', 'completed');

 -- insert data into returns table
  INSERT INTO b4u.returns (order_item_id, return_date, reason) VALUES (55, '2025-05-09 11:00:59.544493', 'Damaged Book');

 -- insert data into shipments table
  INSERT INTO b4u.shipments (order_id, shipped_at, tracking_number, carrier) VALUES (7, '2025-05-05 15:00:00', 'TRACK12345', 'DHL');

 

  
 

 

 

 

 