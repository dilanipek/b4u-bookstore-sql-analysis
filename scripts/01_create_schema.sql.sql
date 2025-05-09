
-- Create schema

CREATE SCHEMA IF NOT EXISTS b4u
    AUTHORIZATION dilan;

--- create authors table 
CREATE TABLE IF NOT EXISTS b4u.authors
(
    author_id integer NOT NULL DEFAULT nextval('b4u.authors_author_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    bio text COLLATE pg_catalog."default",
    CONSTRAINT authors_pkey PRIMARY KEY (author_id)
);

-- create books table 


CREATE TABLE IF NOT EXISTS b4u.books
(
    book_id integer NOT NULL DEFAULT nextval('b4u.books_book_id_seq'::regclass),
    title character varying(200) COLLATE pg_catalog."default" NOT NULL,
    author_id integer,
    price numeric(10,2) NOT NULL,
    stock integer DEFAULT 0,
    published_date date,
    category_id integer,
    CONSTRAINT books_pkey PRIMARY KEY (book_id),
    CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id)
        REFERENCES b4u.authors (author_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT books_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES b4u.categories (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

--create categories table
CREATE TABLE IF NOT EXISTS b4u.categories
(
    category_id integer NOT NULL DEFAULT nextval('b4u.categories_category_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (category_id)
)

-- create customers table


CREATE TABLE IF NOT EXISTS b4u.customers
(
    customer_id integer NOT NULL DEFAULT nextval('b4u.customers_customer_id_seq'::regclass),
    full_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id),
    CONSTRAINT customers_email_key UNIQUE (email)
);


--- create  order_items table

CREATE TABLE IF NOT EXISTS b4u.order_items
(
    order_item_id integer NOT NULL DEFAULT nextval('b4u.order_items_order_item_id_seq'::regclass),
    order_id integer,
    book_id integer,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id),
    CONSTRAINT order_items_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES b4u.books (book_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES b4u.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT order_items_quantity_check CHECK (quantity > 0)
);

-- create  orders table 

CREATE TABLE IF NOT EXISTS b4u.orders
(
    order_id integer NOT NULL DEFAULT nextval('b4u.orders_order_id_seq'::regclass),
    customer_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) COLLATE pg_catalog."default" DEFAULT 'pending'::character varying,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES b4u.customers (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- create returns table 

CREATE TABLE IF NOT EXISTS b4u.returns
(
    return_id integer NOT NULL DEFAULT nextval('b4u.returns_return_id_seq'::regclass),
    order_item_id integer,
    return_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reason text COLLATE pg_catalog."default",
    CONSTRAINT returns_pkey PRIMARY KEY (return_id),
    CONSTRAINT returns_order_item_id_fkey FOREIGN KEY (order_item_id)
        REFERENCES b4u.order_items (order_item_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);

-- create shipments table

CREATE TABLE IF NOT EXISTS b4u.shipments
(
    shipment_id integer NOT NULL DEFAULT nextval('b4u.shipments_shipment_id_seq'::regclass),
    order_id integer,
    shipped_at timestamp without time zone,
    tracking_number character varying(50) COLLATE pg_catalog."default",
    carrier character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT shipments_pkey PRIMARY KEY (shipment_id),
    CONSTRAINT shipments_order_id_key UNIQUE (order_id),
    CONSTRAINT shipments_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES b4u.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);







