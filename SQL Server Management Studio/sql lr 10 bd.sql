--1
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]  
	FOR XML RAW  
--2
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]  
	FOR XML RAW, ELEMENTS 
--3
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]  
	FOR XML RAW ('Город'), ELEMENTS  
--4
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты] 
	FOR XML RAW, ROOT('Фамилия')  
--5
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты] 
	FOR XML RAW, TYPE
--6
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]   
	FOR XML RAW, ELEMENTS XSINIL  
--7
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]   
	FOR XML RAW, XMLSCHEMA  
--8
SELECT Код_абитуриента, Имя
	FROM [dbo].[Абитуриенты]    
	FOR XML RAW, XMLSCHEMA ('urn:example.com')  
--9
SELECT Cust.Код_абитуриента, OrderHeader.Код_абитуриента,       
    OrderHeader.Код_заявления,OrderHeader.Статус, 	Cust.Город
	FROM Абитуриенты Cust, Заявления OrderHeader  
	WHERE Cust.Код_абитуриента = OrderHeader.Код_абитуриента
	ORDER BY Cust.Код_абитуриента
	FOR XML AUTO  
--10
SELECT OrderHeader.Код_абитуриента,OrderHeader.Код_заявления,   
	OrderHeader.Статус, Cust.Код_абитуриента, Cust.Город
	FROM Абитуриенты Cust, Заявления OrderHeader  
	WHERE Cust.Код_абитуриента = OrderHeader.Код_абитуриента  
	FOR XML AUTO   
--11
SELECT 
    OrderHeader.Код_абитуриента AS 'Cust.Код_абитуриента',
    OrderHeader.Код_заявления AS 'Cust.Код_заявления',
    OrderHeader.Статус,
    Cust.Код_абитуриента,
    Cust.Город
FROM 
    Абитуриенты AS Cust
JOIN 
    Заявления AS OrderHeader ON Cust.Код_абитуриента = OrderHeader.Код_абитуриента
FOR XML AUTO, ELEMENTS
--12
	SELECT C.Код_абитуриента, COUNT(*) AS NoOfOrders  
	FROM Абитуриенты AS C INNER JOIN Заявления AS SOKF
 	on C.Код_абитуриента = SOKF.Код_абитуриента
	GROUP BY C.Код_абитуриента
	for xml auto
--13
SELECT P.Код_экзамена+' '+P.Оценка as Name,SOH.Код_заявления
	FROM Абитуриенты AS C INNER JOIN Заявления AS SOH ON
  	C.Код_абитуриента = SOH.Код_абитуриента JOIN Оценки AS P ON 	P.Код_абитуриента= C.Код_абитуриента
	FOR XML AUTO
--14
SELECT 1 as Tag,  
      		NULL as Parent,  
       	E.Код_абитуриента as [Employee!1!EmpID],  
       	NULL as [Name!2!FName],  
       	NULL as [Name!2!LName]  
	FROM  Абитуриенты AS E  
	INNER JOIN Заявления AS P  
	ON  E.Код_абитуриента = P.Код_абитуриента
	UNION ALL  
	SELECT 2 as Tag,  
       	1 as Parent,  
       	E.Код_абитуриента,  
       	Имя,   
       	Фамилия
	FROM  Абитуриенты AS E  
	INNER JOIN Заявления AS P  
	ON  E.Код_абитуриента = P.Код_абитуриента
	ORDER BY [Employee!1!EmpID],[Name!2!FName]  
	FOR XML EXPLICIT  
--15
SELECT Код_абитуриента, Имя
	FROM Абитуриенты  
	WHERE Код_абитуриента=7  
	FOR XML PATH  
--16
SELECT Код_абитуриента as "@PmId", Имя
	FROM Абитуриенты
	WHERE Код_абитуриента=7  
	FOR XML PATH
--17
SELECT e.Код_абитуриента "@EmpID",   
       	 Имя  "EmpName/First",   
       	 Отчество "EmpName/Middle",   
       	 Фамилия   "EmpName/Last"  
	FROM   Абитуриенты E, Заявления C  
	WHERE  E.Код_абитуриента = C.Код_заявления
	AND    E.Код_абитуриента=1  
	FOR XML PATH  
--18
Select Код_абитуриента as 'data()'
from Абитуриенты for xml path('')

