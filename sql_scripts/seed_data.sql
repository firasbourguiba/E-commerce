-- Users
INSERT INTO User (name, email, password) VALUES ('Alice Martin', 'alice@example.com', 'hashed_password1');
INSERT INTO User (name, email, password) VALUES ('Bob Dupont', 'bob@example.com', 'hashed_password2');
INSERT INTO User (name, email, password) VALUES ('Charlie Durand', 'charlie@example.com', 'hashed_password3');

-- Addresses
INSERT INTO Address (user_id, street, city, zip_code) VALUES (1, '123 Main St', 'Paris', '75001');
INSERT INTO Address (user_id, street, city, zip_code) VALUES (1, '456 Side St', 'Paris', '75002');
INSERT INTO Address (user_id, street, city, zip_code) VALUES (2, '789 Broad St', 'Lyon', '69001');
INSERT INTO Address (user_id, street, city, zip_code) VALUES (3, '321 Market Ave', 'Marseille', '13001');

-- Products
INSERT INTO Product (name, description, price) VALUES ('Laptop', 'High performance laptop', 1200.00);
INSERT INTO Product (name, description, price) VALUES ('Smartphone', 'Latest model smartphone', 800.00);
INSERT INTO Product (name, description, price) VALUES ('Tablet', 'Portable tablet with high resolution', 300.00);
INSERT INTO Product (name, description, price) VALUES ('Headphones', 'Noise-cancelling headphones', 150.00);

-- Commands
INSERT INTO Command (user_id, status) VALUES (1, 'pending');
INSERT INTO Command (user_id, status) VALUES (2, 'completed');
INSERT INTO Command (user_id, status) VALUES (3, 'shipped');

-- Command_Product (Liaison entre Command et Product)
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (1, 1, 1);
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (1, 3, 2);
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (2, 2, 1);
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (3, 4, 1);
INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (3, 1, 1);

-- Invoices
INSERT INTO Invoice (command_id, total_amount) VALUES (1, 1800.00);
INSERT INTO Invoice (command_id, total_amount) VALUES (2, 800.00);
INSERT INTO Invoice (command_id, total_amount) VALUES (3, 1350.00);
