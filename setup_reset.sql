-- Academic Records Database in Oracle SQL
-- setup_reset.sql
-- Drops views and tables for a clean rebuild of the academic records system

   SET DEFINE OFF;

------------------------------------------------------------
-- DROP VIEWS
------------------------------------------------------------

begin
   execute immediate 'DROP VIEW ActiveStudentAdvisor';
exception
    -- Ignore errors if the view does not exist
   when others then
      null;
end;
/

------------------------------------------------------------
-- DROP TABLES IN REVERSE DEPENDENCY ORDER
------------------------------------------------------------

begin
   execute immediate 'DROP TABLE ThesisCommitteeMember CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE GraduateThesis CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Enrollment CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Section CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE StudentStatusHistory CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Course CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Student CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Department CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Faculty CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE CourseStatus CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE StudentStatus CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE Term CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/

begin
   execute immediate 'DROP TABLE CourseMode CASCADE CONSTRAINTS';
exception
   when others then
      null;
end;
/