# library-management-system
Building a Basic library management system with sql server and analytics

📚 Library Management System
A SQL-based Library Management System that manages books, members, loans, and reservations. This project demonstrates how to design relational databases, write SQL queries, and perform operations like borrowing, returning, and reserving books.

🗂️ Project Structure
DDL.sql → Contains CREATE TABLE scripts with foreign keys & constraints.
DML.sql → Contains INSERT scripts for sample data (Books, Members, Loans, Reservations).
Queries.sql → Example queries to fetch useful information (loaned books, overdue books, reservations, etc.).

🏗️ Database Schema
The system consists of the following tables:
Books → Stores book details (title, author, publication year, genre).
Authors → Stores author information.
Members → Stores library member information.
Loans → Records issued books with loan & return dates.
Reservations → Tracks books reserved by members.

⚡ Features
✅ Add new books, members, loans, and reservations
✅ Track which books are loaned and due for return
✅ Manage book reservations
✅ Avoid duplicate records when re-running insert scripts (old data is cleared before inserting new data)
