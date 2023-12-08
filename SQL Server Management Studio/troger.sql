--1
insert into dbo.students values('��5-20')

--2
create trigger update_uspev
on uspev for update
as
	if update(ocenka)
	begin
	declare @id_s int
	declare @ocenka_old varchar(16)
	declare @ocenka_new varchar(16)
	select @id_s=id_s, @ocenka_new=ocenka from inserted
	select @ocenka_old=ocenka from deleted
	insert into Journal values
	('������ �������� ['+cast(@id_s as varchar(16)) +']
	���� �������� � ['+@ocenka_old+'] �� ['+@ocenka_new+']
	������������� ['+CURRENT_USER+']',getdate())
end