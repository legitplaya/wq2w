--1
if(datalength(host_name())/2>9)
select left(host_name(),6) as '��� ����������'
else
select HOST_NAME() as '��� ����������'

--2-3
declare @num int, @cnt int
set @num = 19
if(@num=0) set @cnt = 1
else begin
set @cnt = 0
while (@num <> 0) begin
set @cnt = @cnt +1 
set @num= @num/10
end
end
select @cnt as '���������� ����'

--4
if Permissions (OBJECT_ID('�������������'), '��������') &1 = 1
Print '������ ����'
else
print'���� �������'

--5
declare @funt float, @value float
declare @kg int, @gr int
set @funt = 3.3
set @value = @funt*456.6
set @kg  = @value/1000
set @gr = cast(@value as int) %1000

print cast(@funt as varchar) + ' ����(�/��) - ��� ' + 
cast(@kg as varchar) + ' �� '+ cast(@gr as varchar) + ' �. '

--6
select ' �� ����� �� ������ '+ @@SERVERNAME + ' ��� ' + SYSTEM_USER + ' with '+ DB_NAME()


--7
declare @d datetime
select @d = create_date
from sys.databases
where name = 'tempdb'
declare @Minutes int = datediff(MI, dateadd(yy, datediff(yy, 0, @d),0),@d)
print cast(@Minutes / 60 as varchar) + ' ����� ' + cast(@Minutes % 60 as varchar)+' �����' 


--8
declare @year int
set @year = DATEPART(yy, getdate())
if @year %4 <> 0
print '��� �� ����������'
else 
begin
if @year %100 <>0
print '��� ����������'
else
if @year % 400 <> 0 
print '��� �� ����������'
else print '��� ����������' end


--9
declare @text nvarchar(100)
declare @i int = 1, @ch nvarchar, @sum int = 0
set @text = '1234567890'
declare @length int =  LEN(@text)

while(@i<= @length)
begin
set @ch = SUBSTRING(@text, @i, 1)
if (@ch >= '0' and @ch <= '9') begin
set @sum = @sum + cast (@ch as int)
end
set @i = @i +1
end
print @sum


--10
DECLARE @text VARCHAR(100)
DECLARE @count INT = 3

SET @text = '�������123'
SET @text = REPLACE(@text, ' ', '')

SET @count = LEN(@text)

DECLARE @price INT = @count * 19

PRINT CAST((@price / 100) AS NVARCHAR) + ' ���. ' + CAST((@price % 100) AS NVARCHAR) + ' ���.'

--11
DECLARE @str nvarchar(100), @str_shift nvarchar(100) = ''
SET @str = '�� ������ ������'
DECLARE @length int = LEN(@str), @j int = 1
DECLARE @abc nvarchar(33) = '��������������������������������'
DECLARE @i int, @sdv int = 3

WHILE (@j <= @length)
	BEGIN
		SET @i = CHARINDEX(SUBSTRING(@str, @j, 1), @abc)
		DECLARE @index int = @i + @sdv
		IF (@index > 33)
			SET @index = @index - 33
		SET @str_shift = @str_shift + SUBSTRING(@abc, @index, 1)
		SET @j = @j + 1
	END
PRINT @str_shift


--12
DECLARE @fio NVARCHAR(100)
SET @fio = '������� ���������� ���'
DECLARE @abc NVARCHAR(33) = '��������������������������������'
DECLARE @length INT = LEN(@fio), @i INT = 1
DECLARE @sum INT = 0

WHILE (@i <= @length)
BEGIN 
    DECLARE @numb INT = CHARINDEX(LOWER(SUBSTRING(@fio, @i, 1)), @abc)
    SET @sum = @sum + @numb
    SET @i = @i + 1
END

WHILE (@sum > 9)
BEGIN
    DECLARE @str_sum NVARCHAR(100) = CAST(@sum AS NVARCHAR)
    SET @length = LEN(@str_sum)
    SET @sum = 0
    SET @i = 1

    WHILE (@i <= @length)
    BEGIN
        SET @numb = CAST(SUBSTRING(@str_sum, @i, 1) AS INT)
        SET @sum = @sum + @numb
        SET @i = @i + 1
    END
END 

PRINT @sum
