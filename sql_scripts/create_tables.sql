USE ecommerce_;

-- Table User
CREATE TABLE `User` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- table Product
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

-- table Address
CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    street VARCHAR (100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- table Cart
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
-- Création de la table Command
CREATE TABLE Command (
    command_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    status ENUM('pending', 'paid', 'shipped', 'delivered') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Création de la table Invoice
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    command_id INT NOT NULL UNIQUE,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (command_id) REFERENCES Command(command_id) ON DELETE CASCADE
);


-- table Command_product
CREATE TABLE Command_Product (
    command_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (command_id, product_id), 
    FOREIGN KEY (command_id) REFERENCES Command(command_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);
