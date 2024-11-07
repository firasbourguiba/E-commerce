USE ecommerce_;
-- Reset the entire database

--1. Drop the existing database if it exists
SOURCE drop_database.sql;

--2. Create the database
SOURCE create_database.sql;

--3.Create all necessary tables
SOURCE create_tables.sql;

--4 Establish realationships between tables 
SOURCE relationships.sql;

--5. populate the tables with initial data
SOURCE seed_data.sql;