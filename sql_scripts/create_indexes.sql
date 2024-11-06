-- index l'email in user 
CREATE INDEX idx_user_email ON User(email);

-- index for the name of product in Product
CREATE INDEX idx_product_name ON Product(name);

--index statut of command in command
CREATE INDEX idx_command_status ON Command(status);

-- Index on user_id in address table for searches by user
CREATE INDEX idx_address_user_id ON Address(user_id);

-- Indes on linking columns in Command_Product table
CREATE INDEX idx_command_product_command_id ON Command_Product(command_id);
CREATE INDEX idx_command_product_product_id ON Command_Product(product_id);
