--1
create procedure [dbo].[�������������_Insert]
@�������� varchar (50),
@�������� int
as
insert into ������������� values (@��������, @��������)

--1.2
exec �������������_Insert '���(���)',25
select * from �������������

--2

create procedure �������������_Delete
@���_������������� int
as
begin
begin tran
declare @��������� int
declare @��������� int
select @���������=count(*)
from ���������
where ���_�������������=@���_�������������

if(@���������<>0)
delete ��������� where ���_�������������=@���_�������������
select @���������=count(*)
from ��������
where ���_�������������=@���_�������������

if(@���������<>0)
begin
delete ������ where ���_�������� in
(select ���_�������� from ��������
where ���_������������� = @���_�������������)
delete �������� where ���_����������=@���_�������������
end
delete ������������� where ���_�������������=@���_�������������
commit tran
end

--2.1 try
exec �������������_Delete 14

--3.1
create procedure [dbo].[����������_Insert]
@�������� varchar (50)
as
insert into ���������� values (@��������)

--3.2
create procedure [dbo].[����������_Insert]
@������� varchar (50), @��� varchar (50), @�������� varchar (50), @������ varchar (50), @����� varchar (50)
as
insert into ����������� values (@�������, @���, @��������, @������, @�����)

--3.3
create procedure [dbo].[���������_Insert]
@���_����������� int,
@���_������������� int,
@������ varchar (20)
as
insert into ��������� values (@���_�����������,@���_�������������,@������)


--3.4
create procedure ����������_Delete
@���_���������� int
as
begin
begin tran
declare @��������� int
declare @��������� int
select @���������=count(*)
from ����������
where ���_����������=@���_����������

if(@���������<>0)
delete ���������� where ���_����������=@���_����������
select @���������=count(*)
from ��������
where ���_����������=@���_����������

if(@���������<>0)
begin
delete ������ where ���_�������� in
(select ���_�������� from ��������
where ���_���������� = @���_����������)

delete �������� where ���_����������=@���_����������
end

delete ���������� where ���_����������=@���_����������
commit tran
end


--3.5
create procedure ����������_Delete
@���_����������� int
as
begin
begin tran
declare @����������� int
declare @��������� int
select @�����������=count(*)
from �����������
where ���_�����������=@���_�����������

if(@�����������<>0)
delete ����������� where ���_�����������=@���_�����������
select @���������=count(*)
from �����������
where ������ != '��������'

if(@���������<>0)
begin
delete ������ where ���_�������� in
(select ���_�������� from ��������
where ���_����������� = @���_�����������)

delete ������ where ���_�����������=@���_�����������
commit tran
end
end


--3.6
create procedure �������_Delete1
@���_������� int
as
begin
delete from ������
where ���_��������=@���_�������

delete from ��������
where ���_��������=@���_�������
end

exec �������_Delete1 10


--3.7
alter procedure �������������_Update
@������������� int
as
begin
update �������������
set �������� = �������� * 1.1
end 

exec �������������_Update 120


--3.8
alter procedure �������_Update
@������� int,
@�����_���� date
as
begin
update ��������
set ���� = @�����_����
where ���_�������� = @�������
end 

exec �������_Update 11, '2005-05-20'


--3.9
create procedure ����������_Update
@��� int,
@������ varchar(20)
as
begin
update �����������
set ������ = '��������'
where ���_����������� = @���
update ���������
set ������ = '��������'
where ���_����������� = @���
end 

exec ����������_Update 5, '��������'