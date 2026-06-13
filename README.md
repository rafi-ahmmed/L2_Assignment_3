# ⚽ Football Ticket Booking System - Database Design & SQL Queries

A PostgreSQL-based database project designed for managing football match ticket bookings. The system stores user information, football match details, and ticket booking records while maintaining data integrity through constraints, relationships, and SQL queries.

---

## 📖 Project Overview

This project demonstrates:

- Database schema design
- Table relationships (Primary Key & Foreign Key)
- Data integrity constraints
- Sample data insertion
- SQL querying techniques
- Joins, Subqueries, Aggregation, Filtering, Sorting, and NULL handling

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL (DDL & DML)
- Beekeeper Studio

---

## 🔗 Relationships

- One User can create many Bookings
- One Match can have many Bookings
- Each Booking belongs to one User and one Match

---

## 📊 ER Diagram

ER Diagram Link:

[[DB Design Link](https://drawsql.app/teams/rafi-ahmmed/diagrams/football-ticket-booking-system-database-design)]

Example:

## 🚀 Features Implemented

### Database Constraints

- Primary Key
- Foreign Key
- UNIQUE Constraint
- CHECK Constraint
- NOT NULL Constraint
- COALESCE for NULL handling

---

### SQL Concepts Demonstrated

- SELECT
- WHERE
- ORDER BY
- LIMIT & OFFSET
- INNER JOIN
- LEFT JOIN
- Subqueries
- Aggregate Functions (AVG)
- COALESCE
- ILIKE
- Filtering with Conditions

---

## 📝 Implemented Queries

### Query 1

Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

### Query 2

Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

### Query 3

Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.

### Query 4

Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.

### Query 5

Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.

### Query 6

Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings.

### Query 7

Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match.

---

## 📂 Sample Data

The database contains:

- 15 Users
- 10 Matches
- 15 Bookings

---

## 👨‍💻 Author

Rafi Ahmmed Siyam

Database Design & SQL Query Practice Project
