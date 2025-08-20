/********************************************************************************************
* 📚 Library Management System - Database Schema
* ------------------------------------------------------------------------------------------
* Description :
*   This script creates the database schema for a Library Management System (LMS).
*   It includes the following tables:
*       - Books         : Stores information about books available in the library
*       - Authors       : Stores information about book authors
*       - Members       : Stores information about library members
*       - Loans         : Stores loan (book issue/return) transactions
*       - Reservations  : Stores reservation details for books
*
* Notes :
*   - Existing tables with the same names are dropped before creating new ones.
*   - Foreign key constraints are used to maintain referential integrity.
*   - Designed for Microsoft SQL Server.
*
* Usage :
*   Run this script in SQL Server Management Studio (SSMS) to initialize the LMS database.
*
********************************************************************************************/

-- ================================================
-- Drop and Create BOOKS table
-- ================================================
IF OBJECT_ID('books', 'U') IS NOT NULL
    DROP TABLE books;

CREATE TABLE books
(
    book_id INT PRIMARY KEY,                  -- Unique identifier for each book
    title NVARCHAR(50),                       -- Book title
    author NVARCHAR(50),                      -- Author name (could be normalized to authors table)
    publication_year INT,                     -- Year of publication
    genre NVARCHAR(50)                        -- Genre (e.g., Computer Science, Mechanical, Civil)
);

-- ================================================
-- Drop and Create AUTHORS table
-- ================================================
IF OBJECT_ID('authors', 'U') IS NOT NULL
    DROP TABLE authors;

CREATE TABLE authors
(
    author_id INT PRIMARY KEY,                -- Unique identifier for each author
    author_name NVARCHAR(50)                  -- Author full name
);

-- ================================================
-- Drop and Create MEMBERS table
-- ================================================
IF OBJECT_ID('members', 'U') IS NOT NULL
    DROP TABLE members;

CREATE TABLE members
(
    member_id INT PRIMARY KEY,                -- Unique identifier for each member
    member_name NVARCHAR(50),                 -- Full name of the member
    address NVARCHAR(200),                    -- Member's address
    email NVARCHAR(200),                      -- Member's email address
    phone_number NVARCHAR(20)                 -- Member's phone number
);

-- ================================================
-- Drop and Create LOANS table
-- ================================================
IF OBJECT_ID('loans', 'U') IS NOT NULL
    DROP TABLE loans;

CREATE TABLE loans
(
    loan_id INT PRIMARY KEY,                  -- Unique identifier for each loan transaction
    member_id INT,                            -- Foreign key referencing members
    book_id INT,                              -- Foreign key referencing books
    loan_date DATE,                           -- Date when the book was issued
    return_date DATE,                         -- Date when the book was returned (NULL if not yet returned)

    -- Relationships
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- ================================================
-- Drop and Create RESERVATIONS table
-- ================================================
IF OBJECT_ID('reservations', 'U') IS NOT NULL
    DROP TABLE reservations;

CREATE TABLE reservations
(
    reservation_id INT PRIMARY KEY,           -- Unique identifier for each reservation
    member_id INT,                            -- Foreign key referencing members
    book_id INT,                              -- Foreign key referencing books
    reservation_date DATE,                    -- Date when the reservation was made

    -- Relationships
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

