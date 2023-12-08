--1
CREATE TABLE �����������2 (����������ID varchar(20) primary key, 
��� varchar(20), 
����������� varchar(20)); 
GO 
CREATE TABLE �����������(����������ID varchar(20),���� date) 
GO 
DECLARE @docHandle int; 
DECLARE @xmlDocument nvarchar(max); -- or xml type 
-- ������������ XML ���������
SET @xmlDocument = N'<ROOT> 
<�����������2 ����������ID="1" ���="�������" �����������="�����������"> 
<����������� ����������ID="1" ����="2018-08-25"/> 
<����������� ����������ID="1" ����="2018-10-03"/> 
</�����������2> 
<�����������2 ����������ID="2" ���="������" 
�����������="��������">
No Orders yet! 
</�����������2> 
</ROOT>'; 
-- ������� ��������� ������������� XML-��������� � ��������� ���������
EXEC sp_xml_preparedocument @docHandle OUTPUT, @xmlDocument; 
-- � ������� ���������� ����������� ����� �����, ��������� �� ������ ������
INSERT �����������2 
SELECT * 
FROM OPENXML(@docHandle, N'/ROOT/�����������2') 
WITH �����������2; 
	-- � ������� ������� ����������� ����� �����, ��������� �� ������ ������
INSERT ����������� 
SELECT * 
FROM OPENXML(@docHandle, N'//�����������') 
WITH �����������; 
-- ���������� ������ �� XML ���������
SELECT * FROM OPENXML(@docHandle, N'/ROOT/�����������2/�����������') WITH (
����������ID nchar(5) '../@����������ID',
���� date
); 
-- �������� ����������� XML ��������� 
EXEC sp_xml_removedocument @docHandle;


--2
DECLARE @docHandle int 
DECLARE @XmlDocument nvarchar(1000) 
SET @XmlDocument = N'<ROOT> 
<�����������2 ����������ID="1" ���="�������"> 
<����������� ����������ID="1" ����="1996-07-04T00:00:00"/> 
<����������� ����������ID="1" ����="1996-08-16T00:00:00"/> 
</�����������2> 
<�����������2 ����������ID="2" ���="����������"> 
<����������� ����������ID="2" ����="1996-08-16T00:00:00"/> 
</�����������2> 
</ROOT>' 

EXEC sp_xml_preparedocument @docHandle OUTPUT, @XmlDocument 
SELECT * 
FROM OPENXML (@docHandle, '/ROOT/�����������2/�����������') 
WITH (
    ����������ID varchar(20) '../@����������ID',
    ���� datetime '@����'
)
EXEC sp_xml_removedocument @docHandle
