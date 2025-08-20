/********************************************************************************************
* 📚 Library Management System - Data Population Script
* ------------------------------------------------------------------------------------------
* Description :
*   This script clears existing data and inserts fresh sample data into the LMS database.
*   Data includes Authors, Books, Members, Loans, and Reservations.
*
* Notes :
*   - Existing records are deleted before inserting new ones.
*   - Books and members are manually inserted for demonstration.
*   - Authors table is populated using BULK INSERT from a CSV file.
*   - Designed for Microsoft SQL Server.
*
* Usage :
*   Run this script after creating the LMS schema to populate tables with demo data.
*
********************************************************************************************/


-- ==========================================================================================
-- STEP 1: Clear old data before inserting new records
-- ==========================================================================================
DELETE FROM reservations;
DELETE FROM loans;
DELETE FROM members;
DELETE FROM books;
DELETE FROM authors;


-- ==========================================================================================
-- STEP 2: Load Authors (BULK INSERT from CSV file)
-- ==========================================================================================
BULK INSERT authors
FROM 'D:\Data Analytics\SQL\Project\Library Management System\Dataset\authors.csv'
WITH
(
    FIRSTROW = 2,               -- Skip header row in CSV
    FIELDTERMINATOR = ',',      -- CSV delimiter
    TABLOCK
);


-- ==========================================================================================
-- STEP 3: Insert sample Books
-- ==========================================================================================
INSERT INTO books (book_id, title, author, publication_year, genre) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', 2009, 'Computer Science'),
(2, 'Electric Machinery Fundamentals', 'Stephen J. Chapman', 2018, 'Electrical'),
(3, 'The Art of Electronics', 'Paul Horowitz', 2015, 'Electronics'),
...
(30, 'Environmental Engineering', 'Howard S.Peavy', 2015, 'Civil');


-- ==========================================================================================
-- STEP 4: Insert sample Members
-- ==========================================================================================
INSERT INTO members (member_id, member_name, address, email, phone_number) VALUES
(1, 'Neha Sharma', '123 Main Street, Mumbai', 'neha.sharma@gmail.com', '+91 9876543210'),
(2, 'Rajesh Patel', '456 Park Avenue, Delhi', 'rajesh.patel@gmail.com', '+91 9876543211'),
...
(20, 'Rohit Patel', '456 Sunset Lane, Delhi', 'rohit.patel@gmail.com', '+91 9876543229');


-- ==========================================================================================
-- STEP 5: Insert Loan Transactions (Issued & Returned books)
-- ==========================================================================================
INSERT INTO loans (loan_id, member_id, book_id, loan_date, return_date) VALUES
(1, 5, 3, '2022-05-10', '2022-05-25'),
(2, 10, 7, '2022-05-12', '2022-05-28'),
...
(30, 14, 1, '2022-08-14', '2022-08-29');


-- ==========================================================================================
-- STEP 6: Insert Reservations
-- ==========================================================================================
INSERT INTO reservations (reservation_id, member_id, book_id, reservation_date) VALUES
(1, 5, 3, '2022-05-05'),
(2, 10, 7, '2022-05-10'),
...
(30, 14, 1, '2022-08-09');


-- ==========================================================================================
-- STEP 7: Verification Queries (Check if data is loaded correctly)
-- ==========================================================================================
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM loans;
SELECT * FROM reservations;

