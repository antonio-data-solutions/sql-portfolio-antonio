-- Project 01: Small Business Sales Database
-- Table creation script

CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,
    city VARCHAR(80) NOT NULL,
    signup_date DATE NOT NULL,

    CONSTRAINT customers_pkey PRIMARY KEY (customer_id),
    CONSTRAINT customers_email_key UNIQUE (email)
);

CREATE TABLE products (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY,
    product_name VARCHAR(120) NOT NULL,
    category VARCHAR(80) NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL,

    CONSTRAINT products_pkey PRIMARY KEY (product_id),
    CONSTRAINT products_name_key UNIQUE (product_name),
    CONSTRAINT products_price_check CHECK (unit_price > 0),
    CONSTRAINT products_stock_check CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT orders_customer_id_fkey
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT orders_status_check
        CHECK (status IN ('Pending', 'Shipped', 'Completed', 'Cancelled'))
);

CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,

    CONSTRAINT order_items_pkey
        PRIMARY KEY (order_id, product_id),

    CONSTRAINT order_items_order_id_fkey
        FOREIGN KEY (order_id)
        REFERENCES orders (order_id),

    CONSTRAINT order_items_product_id_fkey
        FOREIGN KEY (product_id)
        REFERENCES products (product_id),

    CONSTRAINT order_items_quantity_check
        CHECK (quantity > 0),

    CONSTRAINT order_items_unit_price_check
        CHECK (unit_price > 0)
);