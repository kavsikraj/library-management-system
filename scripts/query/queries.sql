/********************************************************************************************
* 📚 Library Management System - Query Script
* ------------------------------------------------------------------------------------------
* Description :
*   This script contains sample SQL queries to explore and analyze data 
*   in the Library Management System (LMS).
*
* Sections :
*   1. Basic Queries       → Simple SELECT queries
*   2. Intermediate Queries → Aggregations, joins, and filtering
*
* Usage :
*   Run these queries after schema creation and data population.
********************************************************************************************/

-- ==========================================================================================
-- 1. BASIC QUERIES
-- ==========================================================================================

-- List all the books in the library
SELECT 
    title,
    author,
    genre
FROM books;


-- Find all the members from Chennai
SELECT
    member_id,
    member_name
FROM members
WHERE address LIKE '%Chennai%';


-- Show all loan records
SELECT
    *
FROM loans;

-- ==========================================================================================
-- 2. INTERMEDIATE QUERIES
-- ==========================================================================================

-- Find which books are currently loaned (not yet returned)
-- Assumption: If return_date IS NULL → Book is still loaned
SELECT
    l.loan_id,
    m.member_name,
    b.title,
    b.book_id,
    l.loan_date,
    l.return_date
FROM loans l
JOIN members m ON m.member_id = l.member_id
JOIN books b   ON l.book_id   = b.book_id
WHERE l.return_date IS NULL;


-- List members who have reserved more than 1 book
SELECT
    m.member_name,
    COUNT(r.reservation_id) AS total_books
FROM reservations r 
LEFT JOIN members m ON m.member_id = r.member_id
GROUP BY m.member_name
HAVING COUNT(r.reservation_id) > 1
ORDER BY total_books DESC;


-- Find the most borrowed books
SELECT 
    title,
    total_books_borrowed
FROM
(
    SELECT
        b.title,
        COUNT(l.loan_id) AS total_books_borrowed
    FROM books b
    LEFT JOIN loans l ON l.book_id = b.book_id
    GROUP BY b.title
) t
WHERE total_books_borrowed > 1 
ORDER BY total_books_borrowed DESC;

