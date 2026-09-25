-- Project 01: Small Business Sales Database
-- Initial data insertion script

INSERT INTO customers (
    first_name,
    last_name,
    email,
    city,
    signup_date
)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', 'New York', '2025-01-15'),
    ('Brian', 'Smith', 'brian.smith@example.com', 'Chicago', '2025-02-03'),
    ('Carla', 'Mendes', 'carla.mendes@example.com', 'Miami', '2025-02-20'),
    ('Daniel', 'Brown', 'daniel.brown@example.com', 'Austin', '2025-03-10'),
    ('Emma', 'Davis', 'emma.davis@example.com', 'Seattle', '2025-03-25'),
    ('Frank', 'Wilson', 'frank.wilson@example.com', 'Boston', '2025-04-08'),
    ('Grace', 'Taylor', 'grace.taylor@example.com', 'Denver', '2025-04-19'),
    ('Henry', 'Moore', 'henry.moore@example.com', 'Portland', '2025-05-02');

INSERT INTO products (
    product_name,
    category,
    unit_price,
    stock_quantity
)
VALUES
    ('Wireless Mouse', 'Computer Accessories', 24.90, 35),
    ('Mechanical Keyboard', 'Computer Accessories', 89.90, 20),
    ('USB-C Hub', 'Computer Accessories', 39.90, 50),
    ('Laptop Stand', 'Office Equipment', 45.00, 15),
    ('Webcam 1080p', 'Computer Accessories', 59.90, 25),
    ('Desk Lamp', 'Office Equipment', 32.50, 30),
    ('Notebook', 'Office Supplies', 8.90, 100),
    ('Office Chair', 'Office Equipment', 199.00, 10),
    ('External SSD 1TB', 'Storage', 109.90, 12),
    ('Noise-Cancelling Headphones', 'Audio', 149.90, 18);