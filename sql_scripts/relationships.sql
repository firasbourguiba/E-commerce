USE ecommerce_;

-- Relation between User and Address
ALTER TABLE Address 
ADD CONSTRAINT fk_user_address
FOREIGN KEY (user_id) REFERENCES User(user_id) 
ON DELETE CASCADE;

-- Relation between User and Cart
ALTER TABLE Cart 
ADD CONSTRAINT fk_user_cart
FOREIGN KEY (user_id) REFERENCES User(user_id)
ON DELETE CASCADE;

-- Relation between User and Command
ALTER TABLE Command
ADD CONSTRAINT fk_user_command
FOREIGN KEY (user_id) REFERENCES User(user_id)
ON DELETE CASCADE;

-- Relation between Command and Invoice
ALTER TABLE Invoice 
ADD CONSTRAINT fk_command_invoice
FOREIGN KEY (command_id) REFERENCES Command(command_id)
ON DELETE CASCADE;

-- Relation between Command and Product through Command_Product (many-to-many relationship)
ALTER TABLE Command_Product
ADD CONSTRAINT fk_command_product_command
FOREIGN KEY (command_id) REFERENCES Command(command_id)
ON DELETE CASCADE;

ALTER TABLE Command_Product
ADD CONSTRAINT fk_command_product_product
FOREIGN KEY (product_id) REFERENCES Product(product_id)
ON DELETE CASCADE;
