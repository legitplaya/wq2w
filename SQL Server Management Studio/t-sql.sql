--1
create procedure procedure123456
@id varchar(20),
@fam varchar(20),
@gr varchar(20)
as
select id,fam,gr from dbo.students

exec procedure123456
@id = 7,
@fam = 'sofron',
@gr = 'ip5-21'

--2
alter procedure procedure123456
@id tinyint,
@fam varchar(20),
@gr varchar(20)
as
alter table dbo.students
add constraint gr
default 'ip5-21' for gr

--1
create proc p1
@gr varchar(30)
as
select *
from dbo.students
where gr=@gr

exec p1 '»Ô5-21'

