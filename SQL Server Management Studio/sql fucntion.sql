select fam+' ' +name as ���, avg(ocenka) as '������� ����',
(select avg(ocenka) from uspev) as '����� ������� ����'
from students inner join uspev on students.id=uspev.id_s
group by fam+' '+name
having avg(ocenka)>(select avg(ocenka)from uspev)

CREATE FUNCTION func()
RETURNS FLOAT
AS
BEGIN
    DECLARE @average FLOAT;
    SELECT @average = AVG(ocenka) FROM uspev;
    RETURN @average;
END;





create FUNCTION [EMK\ip521-20].[func1]()
RETURNS TABLE
AS
RETURN (
    SELECT fam + ' ' + name AS ���,
           AVG(ocenka) AS �������_����,
           (SELECT AVG(ocenka) FROM uspev) AS �����_�������_����
    FROM students
    INNER JOIN uspev ON students.id = uspev.id_s
    GROUP BY fam + ' ' + name
    HAVING AVG(ocenka) > (SELECT AVG(ocenka) FROM uspev)
);
select * from [EMK\ip521-20].[func1]()