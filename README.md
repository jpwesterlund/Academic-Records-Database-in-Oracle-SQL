# Academic Records Database in Oracle SQL

This project is an Oracle SQL database for a college academic records system. It models students, faculty, departments, courses, sections, enrollments, student status history, and graduate thesis workflows. It also includes reusable reporting queries, a schema inspection utility, and a simple indexing and execution plan example.

I originally built this as a database modeling assignment, then reworked it into a cleaner portfolio project focused on schema design, relational integrity, reporting, and SQL based analysis.

## Features

- Normalized relational schema for academic records
- Faculty advising and supervision relationships
- Course catalog, term based sections, section numbers, and delivery modes
- Enrollment tracking with course level statuses
- Student status history over time
- Graduate thesis and thesis committee tracking
- Reusable view for active students and their advisors
- Reporting queries for common academic questions
- Utility script for describing table structure from Oracle metadata
- Execution plan and indexing example for query optimization

## Entity Overview

The database is organized around a few main areas:

- **People:** `Student`, `Faculty`, `Department`
- **Academic structure:** `Course`, `Section`, `Term`, `CourseMode`
- **Academic activity:** `Enrollment`, `CourseStatus`
- **Student progression:** `StudentStatus`, `StudentStatusHistory`
- **Graduate work:** `GraduateThesis`, `ThesisCommitteeMember`

Some of the main design choices include:

- a self referencing relationship in `Faculty` to model supervision
- a self referencing relationship in `Course` to model prerequisites
- a separate history table for student status changes over time
- a one to zero or one relationship between `Student` and `GraduateThesis`
- a section level design that distinguishes course offerings by term and section number

## Project Structure

```text
academic-records-database/
├── README.md
├── schema.sql
├── seed_data.sql
├── views.sql
├── reports.sql
├── setup_reset.sql
├── admin/
│   └── describe_table.sql
├── performance/
│   └── indexing_and_explain_plan.sql
└── docs/
    └── erd.png
```

## File Notes

- **schema.sql**
  Creates the database tables and relational constraints

- **seed_data.sql**
  Inserts sample data for the academic records system

- **views.sql**
  Creates reusable views, including a view for active students and their advisors

- **reports.sql**
  Contains reporting queries for enrollment, prerequisites, student status, and thesis oversight

- **setup_reset.sql**
  Drops views and tables so the schema can be rebuilt cleanly

- **admin/describe_table.sql**
  Utility script that recreates Oracle `DESCRIBE`style output using data dictionary views and column comments. When prompted, enter the schema owner and target table name. For tables in your own schema, the owner is usually the result of `SELECT USER FROM dual;`

- **performance/indexing_and_explain_plan.sql**
  Demonstrates query plan analysis and index creation using the main project schema

- **docs/erd.drawio.png**
  Entity relationship diagram for the final schema

## How to Run

Run the scripts in this order:

1. `setup_reset.sql` *(optional, for a clean rebuild)*
2. `schema.sql`
3. `seed_data.sql`
4. `views.sql`
5. `reports.sql`

Optional supporting scripts:

- `admin/describe_table.sql`
- `performance/indexing_and_explain_plan.sql`

## Example Reporting Queries

The reporting layer includes queries for:

- course enrollment by term and section
- course prerequisites
- active students and their advisors
- thesis committee membership
- students with multiple leave periods

## Utilities and Performance

This repository also includes two supporting SQL scripts beyond the main schema and reporting files:

- **`describe_table.sql`**
  A read only utility that pulls column metadata and comments from Oracle system views

- **`indexing_and_explain_plan.sql`**
  A simple before and after indexing example using `EXPLAIN PLAN` and `DBMS_XPLAN.DISPLAY()` to show how query execution can be analyzed and improved.

## ER Diagram

The final ERD for the project is included in:

- `docs/erd.drawio.png`

The diagram was rebuilt to match the final schema used in this repository

## Design Highlights

A few parts of the schema are especially worth pointing out:

- **Student status history** is separated from the main student table so status changes can be tracked over time instead of storing only the current value
- **Faculty supervision** is modeled with a self referencing foreign key
- **Course prerequisites** are also modeled with a self referencing foreign key
- **Section** includes a section number so the same course can be offered in multiple sections within the same term
- **GraduateThesis** uses `Student_ID` as both a primary key and foreign key to represent that a student may have at most one thesis record
- **ThesisCommitteeMember** allows thesis committees to be represented as multiple faculty member rows tied to a single student

## Future Improvements

The next additions would likely include:

- stored procedures for common workflows
- triggers for additional business rules
- more indexing based on reporting and query patterns
- stronger enforcement around thesis committee chair rules
- role-based access and audit logging

## What This Project Demonstrates

- relational schema design
- primary and foreign key modeling
- check and unique constraints
- self referencing relationships
- seed data design
- SQL views
- reporting queries
- Oracle metadata queries
- basic query optimization with indexing and execution plans
