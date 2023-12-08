--1 zadanie
select * from AD_ACADEMIC_SESSIONS
select * from AD_COURSES
select * from AD_STUDENTS
select * from AD_EXAM_RESULTS
select * from AD_STUDENT_ATTENDANCE
select * from AD_DEPARTMENTS
select * from AD_EXAM_TYPES
select * from AD_EXAMS
select * from AD_FACULTY
select * from AD_FACULTY_COURSE_DETAILS
select * from AD_FACULTY_LOGIN_DETAILS
select * from AD_PARENT_INFORMATION
select * from AD_STUDENT_COURSE_DETAILS

--2 zadanie
select student_id,exam_grade
from AD_EXAM_RESULTS
--3
select student_id,exam_eligibility from AD_STUDENT_ATTENDANCE
--4
select login_date_time,FACULTY_ID from AD_FACULTY_LOGIN_DETAILS
--5
select head from AD_DEPARTMENTS
--6
select cast(ID as varchar) +  ' first name is ' + first_name from AD_STUDENTS
--7
select exam_type from AD_EXAMS