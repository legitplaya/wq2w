--1
SELECT ���_�����������, ���
	FROM [dbo].[�����������]  
	FOR XML RAW  
--2
SELECT ���_�����������, ���
	FROM [dbo].[�����������]  
	FOR XML RAW, ELEMENTS 
--3
SELECT ���_�����������, ���
	FROM [dbo].[�����������]  
	FOR XML RAW ('�����'), ELEMENTS  
--4
SELECT ���_�����������, ���
	FROM [dbo].[�����������] 
	FOR XML RAW, ROOT('�������')  
--5
SELECT ���_�����������, ���
	FROM [dbo].[�����������] 
	FOR XML RAW, TYPE
--6
SELECT ���_�����������, ���
	FROM [dbo].[�����������]   
	FOR XML RAW, ELEMENTS XSINIL  
--7
SELECT ���_�����������, ���
	FROM [dbo].[�����������]   
	FOR XML RAW, XMLSCHEMA  
--8
SELECT ���_�����������, ���
	FROM [dbo].[�����������]    
	FOR XML RAW, XMLSCHEMA ('urn:example.com')  
--9
SELECT Cust.���_�����������, OrderHeader.���_�����������,       
    OrderHeader.���_���������,OrderHeader.������, 	Cust.�����
	FROM ����������� Cust, ��������� OrderHeader  
	WHERE Cust.���_����������� = OrderHeader.���_�����������
	ORDER BY Cust.���_�����������
	FOR XML AUTO  
--10
SELECT OrderHeader.���_�����������,OrderHeader.���_���������,   
	OrderHeader.������, Cust.���_�����������, Cust.�����
	FROM ����������� Cust, ��������� OrderHeader  
	WHERE Cust.���_����������� = OrderHeader.���_�����������  
	FOR XML AUTO   
--11
SELECT 
    OrderHeader.���_����������� AS 'Cust.���_�����������',
    OrderHeader.���_��������� AS 'Cust.���_���������',
    OrderHeader.������,
    Cust.���_�����������,
    Cust.�����
FROM 
    ����������� AS Cust
JOIN 
    ��������� AS OrderHeader ON Cust.���_����������� = OrderHeader.���_�����������
FOR XML AUTO, ELEMENTS
--12
	SELECT C.���_�����������, COUNT(*) AS NoOfOrders  
	FROM ����������� AS C INNER JOIN ��������� AS SOKF
 	on C.���_����������� = SOKF.���_�����������
	GROUP BY C.���_�����������
	for xml auto
--13
SELECT P.���_��������+' '+P.������ as Name,SOH.���_���������
	FROM ����������� AS C INNER JOIN ��������� AS SOH ON
  	C.���_����������� = SOH.���_����������� JOIN ������ AS P ON 	P.���_�����������= C.���_�����������
	FOR XML AUTO
--14
SELECT 1 as Tag,  
      		NULL as Parent,  
       	E.���_����������� as [Employee!1!EmpID],  
       	NULL as [Name!2!FName],  
       	NULL as [Name!2!LName]  
	FROM  ����������� AS E  
	INNER JOIN ��������� AS P  
	ON  E.���_����������� = P.���_�����������
	UNION ALL  
	SELECT 2 as Tag,  
       	1 as Parent,  
       	E.���_�����������,  
       	���,   
       	�������
	FROM  ����������� AS E  
	INNER JOIN ��������� AS P  
	ON  E.���_����������� = P.���_�����������
	ORDER BY [Employee!1!EmpID],[Name!2!FName]  
	FOR XML EXPLICIT  
--15
SELECT ���_�����������, ���
	FROM �����������  
	WHERE ���_�����������=7  
	FOR XML PATH  
--16
SELECT ���_����������� as "@PmId", ���
	FROM �����������
	WHERE ���_�����������=7  
	FOR XML PATH
--17
SELECT e.���_����������� "@EmpID",   
       	 ���  "EmpName/First",   
       	 �������� "EmpName/Middle",   
       	 �������   "EmpName/Last"  
	FROM   ����������� E, ��������� C  
	WHERE  E.���_����������� = C.���_���������
	AND    E.���_�����������=1  
	FOR XML PATH  
--18
Select ���_����������� as 'data()'
from ����������� for xml path('')

