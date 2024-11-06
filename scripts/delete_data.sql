-- Start a transaction to ensure atomic operations
START TRANSACTION;

-- Specific Deletions (deleting specific records with known IDs)
-- Delete a specific user
DELETE FROM User WHERE user_id = 1;

-- Delete a specific product
DELETE FROM Product WHERE product_id = 2;

-- Delete a specific address
DELETE FROM Address WHERE address_id = 1;

-- Delete all commands with a 'completed' status
DELETE FROM Command WHERE status = 'completed';

-- Conditional Deletions (deleting records based on certain conditions)
-- Check if the user exists before deleting
DELETE FROM User WHERE user_id = 3 AND EXISTS (SELECT * FROM User WHERE user_id = 3);

-- Delete users who have not logged in for over a year
DELETE FROM User WHERE last_login < NOW() - INTERVAL 1 YEAR;

-- Delete all discontinued products
DELETE FROM Product WHERE discontinued = 1;

-- Delete all users with a null email (invalid record)
DELETE FROM User WHERE email IS NULL;

-- Delete all commands older than 2 years
DELETE FROM Command WHERE order_date < NOW() - INTERVAL 2 YEAR;

-- Batch Deletions (to avoid high load on the database)
-- Delete only 10 old completed commands at a time
DELETE FROM Command WHERE status = 'completed' ORDER BY order_date ASC LIMIT 10;

-- Deleting Associated Records (maintaining data integrity by removing linked records)
-- Delete associated addresses before deleting a user
DELETE FROM Address WHERE user_id = 4;
DELETE FROM User WHERE user_id = 4;

-- Logging Deletions (log deletion actions for tracking purposes)
-- Log deletion of a user before actually deleting
INSERT INTO deletion_log (table_name, record_id, deleted_at)
SELECT 'User', user_id, NOW() FROM User WHERE user_id = 5;

-- Now delete the user
DELETE FROM User WHERE user_id = 5;

-- Commit the transaction if everything is successful
COMMIT;

-- Rollback in case of an error (optional if you're executing each line manually)
ROLLBACK;
