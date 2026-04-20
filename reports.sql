-- Academic Records Database in Oracle SQL
-- reports.sql
-- Contains reporting queries for enrollment, prerequisites,
-- student status, and thesis oversight

------------------------------------------------------------
-- COURSE ENROLLMENT BY TERM
------------------------------------------------------------

   SET DEFINE ON
DEFINE p_term = 'Fall 2025'

select c.coursenumber,
       sec.sectionnumber,
       c.fulltitle as coursename,
       f.lastname
       || ', '
       || f.firstname as professor,
       s.lastname
       || ', '
       || s.firstname as student
  from enrollment e
  join student s
on e.student_id = s.student_id
  join section sec
on e.section_id = sec.section_id
  join faculty f
on sec.faculty_id = f.faculty_id
  join course c
on sec.coursenumber = c.coursenumber
  join term t
on sec.term_id = t.term_id
 where t.termname = '&p_term'
 order by c.coursenumber,
          sec.sectionnumber,
          student;

------------------------------------------------------------
-- COURSE PREREQUISITES
------------------------------------------------------------

select c.coursenumber,
       c.fulltitle as coursename,
       p.coursenumber as prerequisitenumber,
       p.fulltitle as prerequisitename
  from course c
  left join course p
on c.prerequisitecoursenumber = p.coursenumber
 order by c.coursenumber;

------------------------------------------------------------
-- ACTIVE STUDENTS: YEARS ENROLLED AND ADVISOR
------------------------------------------------------------

with currentstatus as (
   select h.student_id,
          h.studentstatus_id,
          row_number()
          over(partition by h.student_id
               order by h.statuschangedate desc,
                        h.history_id desc
          ) as rn
     from studentstatushistory h
),activestudents as (
    -- Filters to each student's most recent status and keeps only active records
   select cs.student_id
     from currentstatus cs
     join studentstatus ss
   on cs.studentstatus_id = ss.studentstatus_id
    where cs.rn = 1
      and ss.statusname in ( 'Full-time',
                             'Part-time' )
)
select s.lastname
       || ', '
       || s.firstname as studentname,
       trunc(months_between(
          sysdate,
          s.matriculationdate
       ) / 12) as yearsenrolled,
       f.lastname
       || ', '
       || f.firstname as advisor
  from student s
  join activestudents a
on s.student_id = a.student_id
  join faculty f
on s.faculty_id = f.faculty_id
 order by yearsenrolled,
          studentname;

------------------------------------------------------------
-- THESIS COMMITTEE MEMBERS
------------------------------------------------------------

select s.lastname
       || ', '
       || s.firstname as studentname,
       adv.lastname
       || ', '
       || adv.firstname as thesisadvisor,
       f.lastname
       || ', '
       || f.firstname as committeemembername,
       case
          when tcm.ischair = 'Y' then
             'Yes'
          else
             'No'
       end as chairindicator
  from thesiscommitteemember tcm
  join student s
on tcm.student_id = s.student_id
  join graduatethesis gt
on s.student_id = gt.student_id
  join faculty f
on tcm.faculty_id = f.faculty_id
  join faculty adv
on gt.thesisadvisorfaculty_id = adv.faculty_id
 order by s.lastname,
          f.lastname;

------------------------------------------------------------
-- STUDENTS WITH MULTIPLE LEAVE PERIODS
------------------------------------------------------------

select s.lastname
       || ', '
       || s.firstname as studentname,
       count(*) as leavecount
  from studentstatushistory h
  join studentstatus ss
on ss.studentstatus_id = h.studentstatus_id
  join student s
on s.student_id = h.student_id
 where ss.statusname = 'On Leave'
 group by s.lastname,
          s.firstname
having count(*) > 1
 order by studentname;