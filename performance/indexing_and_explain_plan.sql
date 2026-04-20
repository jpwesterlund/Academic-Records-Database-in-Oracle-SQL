-- Academic Records Database in Oracle SQL
-- performance/indexing_and_explain_plan.sql
-- Demonstrates query plan analysis and index creation
-- using the academic records database schema
--
-- Prerequisite:
--   Run schema.sql and seed_data.sql before this script
--
-- Notes:
--   - This script uses the existing Student and Faculty tables
--     from the main project schema
--   - Oracle Live SQL / FreeSQL may not allow AUTOTRACE due to
--     V$ view privilege restrictions
--   - Execution plans are displayed using EXPLAIN PLAN and
--     DBMS_XPLAN.DISPLAY

   SET DEFINE OFF;

------------------------------------------------------------
-- DROP PERFORMANCE INDEX IF IT ALREADY EXISTS
------------------------------------------------------------

begin
   execute immediate 'DROP INDEX idx_student_faculty';
exception
    -- Ignore errors if the index does not exist
   when others then
      null;
end;
/

------------------------------------------------------------
-- EXECUTION PLAN BEFORE INDEX CREATION
------------------------------------------------------------

pro   
pro    *** EXECUTION PLAN BEFORE INDEX CREATION ***
pro   

explain plan
   for
select s.student_id,
       s.firstname,
       s.lastname,
       f.firstname as advisorfirst,
       f.lastname as advisorlast
  from student s
  join faculty f
on s.faculty_id = f.faculty_id
 where f.faculty_id = 1;

select *
  from table ( dbms_xplan.display() );

------------------------------------------------------------
-- CREATE INDEX
------------------------------------------------------------

create index idx_student_faculty on
   student (
      faculty_id
   );

------------------------------------------------------------
-- EXECUTION PLAN AFTER INDEX CREATION
------------------------------------------------------------

pro   
pro    *** EXECUTION PLAN AFTER INDEX CREATION ***
pro   

explain plan
   for
select s.student_id,
       s.firstname,
       s.lastname,
       f.firstname as advisorfirst,
       f.lastname as advisorlast
  from student s
  join faculty f
on s.faculty_id = f.faculty_id
 where f.faculty_id = 1;

select *
  from table ( dbms_xplan.display() );