--- Cleanup all data in the correct ordre 

-- 1. Delte from the many-to-many relationship table first
DELETE FROM Command_Product;

-- 2. Delete from tables that depend on other tables 
DELETE FROM Invoice;
DELETE FROM Command;
DELETE FROM Cart;
DELETE FROM Address;

-- 3. delete from standalone tables or tables without dependencies
DELETE FROM Product;
DELETE FROM User;

-- Reset AUTO_INCREMENT values
ALTER TABLE Command_Product AUTO_INCREMENT = 1;
ALTER TABLE Invoice AUTO_INCREMENT = 1; 
ALTER TABLE Command AUTO_INCREMENT = 1;
ALTER TABLE Cart AUTO_INCREMENT = 1;
ALTER TABLE Address AUTO_INCREMENT = 1;
ALTER TABLE Product AUTO_INCREMENT = 1;
ALTER TABLE User AUTO_INCREMENT = 1;

-- End of file 
