-- Insert sample users
INSERT INTO User (name, email, password) VALUES ('John Doe', 'john.doe@example.com', 'hashed_password1');
INSERT INTO User (name, email, password) VALUES ('Jane Smith', 'jane.smith@example.com', 'hashed_password2');
INSERT INTO User (name, email, password) VALUES ('Alice Brown', 'alice.brown@example.com', 'hashed_password3');

-- Insert sample products
INSERT INTO Product (name, description, price) VALUES ('Laptop', 'High performance laptop', 1200.00);
INSERT INTO Product (name, description, price) VALUES ('Smartphone', 'Latest model smartphone', 800.00);
INSERT INTO Product (name, description, price) VALUES ('Tablet', 'Portable tablet with high resolution', 300.00);
INSERT INTO Product (name, description, price) VALUES ('Headphones', 'Noise-cancelling headphones', 150.00);

-- Insert addresses for users
INSERT INTO Address (user_id, street, city, zip_code) VALUES (1, '123 Main St', 'Paris', '75001');
INSERT INTO Address (user_id, street, city, zip_code) VALUES (2, '456 Side St', 'Lyon', '69001');
INSERT INTO Address (user_id, street, city, zip_code) VALUES (3, '789 Broad St', 'Marseille', '13001');

-- Insert orders for users
INSERT INTO Command (user_id, status) VALUES (1, 'pending');
INSERT INTO Command (user_id, status) VALUES (2, 'completed');
INSERT INTO Command (user_id, status) VALUES (3, 'shipped');

-- Link products to orders in the Command_Product table
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (1, 1, 1); -- 1 Laptop in order 1
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (1, 3, 2); -- 2 Tablets in order 1
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (2, 2, 1); -- 1 Smartphone in order 2
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (3, 4, 1); -- 1 Headphones in order 3

-- Insert invoices for orders
INSERT INTO Invoice (command_id, total_amount) VALUES (1, 1800.00); -- Total for order 1
INSERT INTO Invoice (command_id, total_amount) VALUES (2, 800.00);  -- Total for order 2
INSERT INTO Invoice (command_id, total_amount) VALUES (3, 150.00);  -- Total for order 3
