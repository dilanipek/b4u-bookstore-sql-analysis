# B4U Bookstore SQL Analysis

**Real-world SQL queries and data insights for business analysts using a fictional b4u online bookstore platform.**

This repository contains the database schema, sample data, and analysis queries for a fictional online bookstore scenario named **b4u**. The project is designed to help Business Analysts understand how to use SQL effectively in real-world contexts.

## 📘 Scenario

You are working as a Business Analyst for **b4u**, an online book sales platform. Your job is to answer key business questions such as:

- Which categories generate the most revenue?
- Which authors perform best?
- Are we overstocking certain books?
- How effective are recent promotions?

## 🗃️ Database Tables

The schema includes the following tables:

- `authors`: Information about authors
- `categories`: Book categories (e.g., Fiction, Non-fiction, Fantasy)
- `books`: Book details such as title, price, category, stock, author_id
- `customers`: Customer profiles
- `orders`: Each purchase made
- `order_items`: Individual books per order
- `returns`: Returned orders
- `shipments`: Shipping details

## 🧩 ERD Diagram

![b4u_bookstore_erd](assets/b4u_erd.png)

*(Make sure to place your ERD diagram as `assets/b4u_erd.png` or update the path accordingly.)*

## 📂 Files

| File | Description |
|------|-------------|
| [`01_create_schema.sql`](scripts/01_create_schema.sql) | SQL script to create all tables |
| [`02_insert_data.sql`](scripts/02_insert_data.sql) | Sample data to populate the database |
| [`03_select_queries.sql`](scripts/03_select_queries.sql) | Analytical SQL queries for business questions |
| [`04_explanations.md`](scripts/04_explanations.md) | Explanation of query logic and business value *(optional)* |

---

You can clone this repository and run the SQL scripts in **PostgreSQL** using **pgAdmin** or any other SQL client.
