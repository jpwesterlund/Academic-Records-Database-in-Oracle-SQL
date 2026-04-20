-- Academic Records Database in Oracle SQL
-- seed_data.sql
-- Inserts sample data for the academic records system

------------------------------------------------------------
-- LOOKUP TABLES
------------------------------------------------------------

insert into coursemode ( modename ) values ( 'Online' );
insert into coursemode ( modename ) values ( 'In Person' );
insert into coursemode ( modename ) values ( 'Residency' );
insert into coursemode ( modename ) values ( 'Independent Study' );
insert into coursemode ( modename ) values ( 'Hybrid' );

insert into term (
   termname,
   startdate,
   enddate
) values ( 'Fall 2025',
           date '2025-09-01',
           date '2025-12-15' );

insert into term (
   termname,
   startdate,
   enddate
) values ( 'Spring 2026',
           date '2026-01-15',
           date '2026-05-01' );

insert into term (
   termname,
   startdate,
   enddate
) values ( 'Summer 2026',
           date '2026-06-01',
           date '2026-08-15' );

insert into coursestatus ( statusname ) values ( 'In Progress' );
insert into coursestatus ( statusname ) values ( 'Incomplete' );
insert into coursestatus ( statusname ) values ( 'Administrative Withdrawal' );
insert into coursestatus ( statusname ) values ( 'A' );
insert into coursestatus ( statusname ) values ( 'B' );
insert into coursestatus ( statusname ) values ( 'C' );

insert into studentstatus ( statusname ) values ( 'Full Time' );
insert into studentstatus ( statusname ) values ( 'Part Time' );
insert into studentstatus ( statusname ) values ( 'On Leave' );
insert into studentstatus ( statusname ) values ( 'Withdrawn' );
insert into studentstatus ( statusname ) values ( 'Graduated' );

------------------------------------------------------------
-- FACULTY
------------------------------------------------------------

insert into faculty (
   firstname,
   lastname,
   title,
   officephonenumber,
   homephonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   officeaddressline1,
   officecity,
   officestate,
   officezip,
   supervisorfaculty_id
) values ( 'Todd',
           'Wolfe',
           'Dr.',
           '585-637-3111',
           '585-637-6855',
           '6660 4th Section Road',
           'Rochester',
           'NY',
           '14420',
           '745 Calkins Road',
           'Rochester',
           'NY',
           '14623',
           null );

insert into faculty (
   firstname,
   lastname,
   title,
   officephonenumber,
   homephonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   officeaddressline1,
   officecity,
   officestate,
   officezip,
   supervisorfaculty_id
) values ( 'Ronald',
           'Kovac',
           'Prof.',
           '585-334-4010',
           '585-359-2271',
           '1750 East Avenue',
           'Rochester',
           'NY',
           '14610',
           '1955 Empire Boulevard',
           'Rochester',
           'NY',
           '14580',
           1 );

insert into faculty (
   firstname,
   lastname,
   title,
   officephonenumber,
   homephonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   officeaddressline1,
   officecity,
   officestate,
   officezip,
   supervisorfaculty_id
) values ( 'John',
           'Taormina',
           'Dr.',
           '585-244-7950',
           '585-244-0220',
           '851 Fairport Road',
           'Rochester',
           'NY',
           '14445',
           '900 Holt Road',
           'Rochester',
           'NY',
           '14580',
           1 );

insert into faculty (
   firstname,
   lastname,
   title,
   officephonenumber,
   homephonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   officeaddressline1,
   officecity,
   officestate,
   officezip,
   supervisorfaculty_id
) values ( 'Annette',
           'Burden',
           'Dr.',
           '585-671-8290',
           '585-671-4070',
           '525 Titus Avenue',
           'Rochester',
           'NY',
           '14617',
           '3177 Latta Road',
           'Rochester',
           'NY',
           '14612',
           2 );

insert into faculty (
   firstname,
   lastname,
   title,
   officephonenumber,
   homephonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   officeaddressline1,
   officecity,
   officestate,
   officezip,
   supervisorfaculty_id
) values ( 'Ivan',
           'Ivanov',
           'Prof.',
           '585-586-8340',
           '585-586-7922',
           '2301 Lyell Avenue',
           'Rochester',
           'NY',
           '14606',
           '650 Hylan Drive',
           'Rochester',
           'NY',
           '14623',
           2 );

------------------------------------------------------------
-- DEPARTMENTS
------------------------------------------------------------

insert into department (
   departmentname,
   chairfaculty_id,
   associatechairfaculty_id
) values ( 'Computer Science',
           1,
           2 );

insert into department (
   departmentname,
   chairfaculty_id,
   associatechairfaculty_id
) values ( 'Information Systems',
           3,
           4 );

------------------------------------------------------------
-- STUDENTS
------------------------------------------------------------

insert into student (
   firstname,
   lastname,
   birthdate,
   email,
   pronouns,
   phonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   faculty_id,
   matriculationdate,
   graduationdate
) values ( 'Casey',
           'Wright',
           date '2004-02-14',
           'casie.wright@empire.edu',
           'they/them',
           '585-663-4120',
           '3701 Mt. Read Boulevard',
           'Rochester',
           'NY',
           '14616',
           1,
           date '2023-09-01',
           null );

insert into student (
   firstname,
   lastname,
   birthdate,
   email,
   pronouns,
   phonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   faculty_id,
   matriculationdate,
   graduationdate
) values ( 'Lizzie',
           'Stuart',
           date '2003-06-21',
           'lizzie.stuart@empire.edu',
           'she/her',
           '585-248-3200',
           '2157 Penfield Road',
           'Rochester',
           'NY',
           '14526',
           2,
           date '2022-09-01',
           date '2026-05-01' );

insert into student (
   firstname,
   lastname,
   birthdate,
   email,
   pronouns,
   phonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   faculty_id,
   matriculationdate,
   graduationdate
) values ( 'Elliott',
           'Domagola',
           date '2004-10-12',
           'elliott.domagola@empire.edu',
           'he/him',
           '585-223-4092',
           '6600 Pittsford-Palmyra Road',
           'Rochester',
           'NY',
           '14450',
           1,
           date '2024-09-01',
           null );

insert into student (
   firstname,
   lastname,
   birthdate,
   email,
   pronouns,
   phonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   faculty_id,
   matriculationdate,
   graduationdate
) values ( 'Nikki',
           'Triscuit',
           date '2003-11-04',
           'nikki.triscuit@empire.edu',
           'she/they',
           '585-586-6680',
           '3195',
           'Rochester',
           'NY',
           '14618',
           3,
           date '2022-09-01',
           date '2025-05-01' );

insert into student (
   firstname,
   lastname,
   birthdate,
   email,
   pronouns,
   phonenumber,
   mailingaddressline1,
   mailingcity,
   mailingstate,
   mailingzip,
   faculty_id,
   matriculationdate,
   graduationdate
) values ( 'CJ',
           'Smith',
           date '2005-03-09',
           'cj.smith@empire.edu',
           'they/he',
           '585-342-4810',
           '2200 Ridge Road East',
           'Rochester',
           'NY',
           '14622',
           4,
           date '2024-09-01',
           null );

------------------------------------------------------------
-- COURSES
------------------------------------------------------------

insert into course (
   coursenumber,
   fulltitle,
   shorttitle,
   description,
   learningoutcomes,
   prerequisitecoursenumber,
   responsiblefaculty_id
) values ( 'CSCI1010',
           'Introduction to Programming',
           'Intro to Prog',
           'Covers programming basics in Python.',
           'Students will learn programming logic.',
           null,
           1 );

insert into course (
   coursenumber,
   fulltitle,
   shorttitle,
   description,
   learningoutcomes,
   prerequisitecoursenumber,
   responsiblefaculty_id
) values ( 'CSCI2020',
           'Database Design',
           'DB Design',
           'Introduction to relational modeling and SQL.',
           'Students will design normalized databases.',
           'CSCI1010',
           2 );

insert into course (
   coursenumber,
   fulltitle,
   shorttitle,
   description,
   learningoutcomes,
   prerequisitecoursenumber,
   responsiblefaculty_id
) values ( 'CSCI3030',
           'Web Development',
           'Web Dev',
           'Covers HTML, CSS, JavaScript, and frameworks.',
           'Students will build web applications.',
           'CSCI1010',
           3 );

insert into course (
   coursenumber,
   fulltitle,
   shorttitle,
   description,
   learningoutcomes,
   prerequisitecoursenumber,
   responsiblefaculty_id
) values ( 'CSCI4040',
           'Cybersecurity Fundamentals',
           'Cybersec',
           'Covers basic security concepts and practices.',
           'Students will identify and mitigate vulnerabilities.',
           'CSCI2020',
           1 );

insert into course (
   coursenumber,
   fulltitle,
   shorttitle,
   description,
   learningoutcomes,
   prerequisitecoursenumber,
   responsiblefaculty_id
) values ( 'CSCI5050',
           'Special Topics in Computer Science',
           'Special Topics in CS',
           'Rotating topics in computer science.',
           'Students will explore advanced topics.',
           null,
           4 );

------------------------------------------------------------
-- SECTIONS
------------------------------------------------------------

insert into section (
   coursenumber,
   sectionnumber,
   faculty_id,
   term_id,
   mode_id
) values ( 'CSCI1010',
           '001',
           1,
           1,
           1 );

insert into section (
   coursenumber,
   sectionnumber,
   faculty_id,
   term_id,
   mode_id
) values ( 'CSCI2020',
           '001',
           2,
           1,
           2 );

insert into section (
   coursenumber,
   sectionnumber,
   faculty_id,
   term_id,
   mode_id
) values ( 'CSCI3030',
           '001',
           3,
           1,
           1 );

insert into section (
   coursenumber,
   sectionnumber,
   faculty_id,
   term_id,
   mode_id
) values ( 'CSCI4040',
           '001',
           1,
           2,
           2 );

insert into section (
   coursenumber,
   sectionnumber,
   faculty_id,
   term_id,
   mode_id
) values ( 'CSCI1010',
           '001',
           2,
           2,
           1 );

------------------------------------------------------------
-- ENROLLMENTS
------------------------------------------------------------

insert into enrollment (
   student_id,
   section_id,
   status_id
) values ( 1,
           1,
           1 );

insert into enrollment (
   student_id,
   section_id,
   status_id
) values ( 2,
           2,
           4 );

insert into enrollment (
   student_id,
   section_id,
   status_id
) values ( 3,
           3,
           1 );

insert into enrollment (
   student_id,
   section_id,
   status_id
) values ( 4,
           4,
           4 );

insert into enrollment (
   student_id,
   section_id,
   status_id
) values ( 2,
           3,
           2 );

------------------------------------------------------------
-- STUDENT STATUS HISTORY
------------------------------------------------------------

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 1,
           1,
           date '2023-09-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 1,
           3,
           date '2025-01-15' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 1,
           1,
           date '2025-09-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 2,
           1,
           date '2022-09-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 2,
           5,
           date '2026-05-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 3,
           2,
           date '2024-09-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 4,
           1,
           date '2022-09-01' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 4,
           3,
           date '2023-01-15' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 4,
           3,
           date '2024-01-15' );

insert into studentstatushistory (
   student_id,
   studentstatus_id,
   statuschangedate
) values ( 5,
           1,
           date '2024-09-01' );

------------------------------------------------------------
-- GRADUATE THESIS
------------------------------------------------------------

insert into graduatethesis (
   student_id,
   thesistitle,
   studytype,
   irb_required,
   irb_approvaldate,
   proposaldefensedate,
   proposalapproved,
   thesisdefensedate,
   thesisapproved,
   thesisadvisorfaculty_id
) values ( 1,
           'AI for Education',
           'Empirical',
           'Y',
           date '2025-02-01',
           date '2025-03-01',
           'Y',
           null,
           'N',
           1 );

insert into graduatethesis (
   student_id,
   thesistitle,
   studytype,
   irb_required,
   irb_approvaldate,
   proposaldefensedate,
   proposalapproved,
   thesisdefensedate,
   thesisapproved,
   thesisadvisorfaculty_id
) values ( 4,
           'Secure Distributed Systems',
           'Theoretical',
           'N',
           null,
           date '2024-11-15',
           'Y',
           date '2025-04-20',
           'Y',
           3 );

------------------------------------------------------------
-- THESIS COMMITTEE MEMBERS
------------------------------------------------------------

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 1,
           1,
           'Y' );

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 1,
           2,
           'N' );

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 1,
           3,
           'N' );

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 4,
           3,
           'Y' );

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 4,
           1,
           'N' );

insert into thesiscommitteemember (
   student_id,
   faculty_id,
   ischair
) values ( 4,
           4,
           'N' );

commit;