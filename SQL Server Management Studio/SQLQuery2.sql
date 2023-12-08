--1
CREATE TABLE Абитуриенты2 (АбитуриентID varchar(20) primary key, 
Имя varchar(20), 
Направление varchar(20)); 
GO 
CREATE TABLE Поступившие(АбитуриентID varchar(20),Дата date) 
GO 
DECLARE @docHandle int; 
DECLARE @xmlDocument nvarchar(max); -- or xml type 
-- Формирование XML документа
SET @xmlDocument = N'<ROOT> 
<Абитуриенты2 АбитуриентID="1" Имя="Алексей" Направление="Программист"> 
<Поступившие АбитуриентID="1" Дата="2018-08-25"/> 
<Поступившие АбитуриентID="1" Дата="2018-10-03"/> 
</Абитуриенты2> 
<Абитуриенты2 АбитуриентID="2" Имя="Даниил" 
Направление="Дизайнер">
No Orders yet! 
</Абитуриенты2> 
</ROOT>'; 
-- создаем внутренне представление XML-документа и сохраняем указатель
EXEC sp_xml_preparedocument @docHandle OUTPUT, @xmlDocument; 
-- В таблицу заказчиков добавляется набор строк, состоящий из данных заказа
INSERT Абитуриенты2 
SELECT * 
FROM OPENXML(@docHandle, N'/ROOT/Абитуриенты2') 
WITH Абитуриенты2; 
	-- В таблицу заказов добавляется набор строк, состоящий из данных заказа
INSERT Поступившие 
SELECT * 
FROM OPENXML(@docHandle, N'//Поступившие') 
WITH Поступившие; 
-- Извлечение данных из XML документа
SELECT * FROM OPENXML(@docHandle, N'/ROOT/Абитуриенты2/Поступившие') WITH (
АбитуриентID nchar(5) '../@АбитуриентID',
Дата date
); 
-- Удаление дескриптора XML документа 
EXEC sp_xml_removedocument @docHandle;


--2
DECLARE @docHandle int 
DECLARE @XmlDocument nvarchar(1000) 
SET @XmlDocument = N'<ROOT> 
<Абитуриенты2 АбитуриентID="1" Имя="Евгений"> 
<Поступившие АбитуриентID="1" Дата="1996-07-04T00:00:00"/> 
<Поступившие АбитуриентID="1" Дата="1996-08-16T00:00:00"/> 
</Абитуриенты2> 
<Абитуриенты2 АбитуриентID="2" Имя="Константин"> 
<Поступившие АбитуриентID="2" Дата="1996-08-16T00:00:00"/> 
</Абитуриенты2> 
</ROOT>' 

EXEC sp_xml_preparedocument @docHandle OUTPUT, @XmlDocument 
SELECT * 
FROM OPENXML (@docHandle, '/ROOT/Абитуриенты2/Поступившие') 
WITH (
    АбитуриентID varchar(20) '../@АбитуриентID',
    Дата datetime '@Дата'
)
EXEC sp_xml_removedocument @docHandle
