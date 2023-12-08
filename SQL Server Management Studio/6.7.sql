--1
select id,name from AD_ACADEMIC_SESSIONS
where id=100
--2
select student_id,exam_grade from AD_EXAM_RESULTS
where exam_grade >= 95
--3
select student_id,exam_grade from AD_EXAM_RESULTS
where exam_grade between 65 and 70
--4
select id,FIRST_NAME,REG_YEAR from AD_STUDENTS
where REG_YEAR  <= '2021-06-01'
--5
select * from AD_COURSES
where DEPT_ID = 10 or DEPT_ID = 30
--6
select * from AD_STUDENTS
where FIRST_NAME like '%j%'
--7
select * from AD_COURSES
where id = 190 or id =193
--8
