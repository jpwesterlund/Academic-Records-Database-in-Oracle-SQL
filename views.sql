-- Academic Records Database in Oracle SQL
-- views.sql
-- Defines reusable views for the academic records system

------------------------------------------------------------
-- ACTIVE STUDENTS AND THEIR ADVISORS
------------------------------------------------------------

create or replace view activestudentadvisor as
   with currentstatus as (
      select h.student_id,
             h.studentstatus_id,
             row_number()
             over(partition by h.student_id
                  order by h.statuschangedate desc,
                           h.history_id desc
             ) as rn
        from studentstatushistory h
   )
   select s.student_id,
          s.lastname as studentlastname,
          s.firstname as studentfirstname,
          f.lastname as advisorlastname,
          f.firstname as advisorfirstname
     from student s
     join faculty f
   on s.faculty_id = f.faculty_id
     join currentstatus cs
    -- Keeps only the most recent status row per student
   on cs.student_id = s.student_id
      and cs.rn = 1
     join studentstatus ss
   on ss.studentstatus_id = cs.studentstatus_id
    where ss.statusname in ( 'Full-time',
                             'Part-time' );