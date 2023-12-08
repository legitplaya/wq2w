--1
create procedure [dbo].[Специальность_Insert]
@Название varchar (50),
@Вакансий int
as
insert into Специальности values (@Название, @Вакансий)

--1.2
exec Специальность_Insert 'ФИЛ(РЯЛ)',25
select * from Специальности

--2

create procedure Специальность_Delete
@Код_специальности int
as
begin
begin tran
declare @Заявлений int
declare @Экзаменов int
select @Заявлений=count(*)
from Заявления
where Код_специальности=@Код_специальности

if(@Заявлений<>0)
delete Заявления where Код_специальности=@Код_специальности
select @экзаменов=count(*)
from экзамены
where Код_специальности=@Код_специальности

if(@Экзаменов<>0)
begin
delete Оценки where Код_экзамена in
(select Код_экзамена from Экзамены
where Код_специальности = @Код_специальности)
delete Экзамены where Код_дисциплины=@Код_специальности
end
delete Специальности where Код_специальности=@Код_специальности
commit tran
end

--2.1 try
exec Специальность_Delete 14

--3.1
create procedure [dbo].[Дисциплина_Insert]
@Название varchar (50)
as
insert into Дисциплины values (@Название)

--3.2
create procedure [dbo].[Абитуриент_Insert]
@Фамилия varchar (50), @Имя varchar (50), @Отчество varchar (50), @Статус varchar (50), @Город varchar (50)
as
insert into Абитуриенты values (@Фамилия, @Имя, @Отчество, @Статус, @Город)

--3.3
create procedure [dbo].[Заявление_Insert]
@Код_абитуриента int,
@Код_специальности int,
@Статус varchar (20)
as
insert into Заявления values (@Код_абитуриента,@Код_специальности,@Статус)


--3.4
create procedure Дисциплина_Delete
@Код_дисциплины int
as
begin
begin tran
declare @Дисциплин int
declare @Экзаменов int
select @Дисциплин=count(*)
from Дисциплины
where Код_дисциплины=@Код_дисциплины

if(@Дисциплин<>0)
delete Дисциплины where Код_дисциплины=@Код_дисциплины
select @экзаменов=count(*)
from экзамены
where Код_дисциплины=@Код_дисциплины

if(@Экзаменов<>0)
begin
delete Оценки where Код_экзамена in
(select Код_экзамена from Экзамены
where Код_дисциплины = @Код_дисциплины)

delete Экзамены where Код_дисциплины=@Код_дисциплины
end

delete Дисциплины where Код_дисциплины=@Код_дисциплины
commit tran
end


--3.5
create procedure Абитуриент_Delete
@Код_абитуриента int
as
begin
begin tran
declare @Абитуриенты int
declare @Экзаменов int
select @Абитуриенты=count(*)
from Абитуриенты
where Код_абитуриента=@Код_абитуриента

if(@Абитуриенты<>0)
delete Абитуриенты where Код_абитуриента=@Код_абитуриента
select @экзаменов=count(*)
from Абитуриенты
where Статус != 'зачислен'

if(@Экзаменов<>0)
begin
delete Оценки where Код_экзамена in
(select Код_экзамена from Экзамены
where Код_абитуриента = @Код_абитуриента)

delete Оценки where Код_абитуриента=@Код_абитуриента
commit tran
end
end


--3.6
create procedure Экзамен_Delete1
@Код_экзамен int
as
begin
delete from Оценки
where Код_экзамена=@Код_экзамен

delete from Экзамены
where Код_экзамена=@Код_экзамен
end

exec Экзамен_Delete1 10


--3.7
alter procedure Специальность_Update
@Специальность int
as
begin
update Специальности
set Вакансий = Вакансий * 1.1
end 

exec Специальность_Update 120


--3.8
alter procedure Экзамен_Update
@Экзамен int,
@Новая_дата date
as
begin
update Экзамены
set Дата = @Новая_дата
where Код_экзамена = @Экзамен
end 

exec Экзамен_Update 11, '2005-05-20'


--3.9
create procedure Абитуриент_Update
@Код int,
@Статус varchar(20)
as
begin
update Абитуриенты
set Статус = 'зачислен'
where Код_абитуриента = @Код
update Заявления
set Статус = 'зачислен'
where Код_абитуриента = @Код
end 

exec Абитуриент_Update 5, 'зачислен'