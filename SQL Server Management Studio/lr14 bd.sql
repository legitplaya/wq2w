alter proc Student_Select_Faculty
@���_������������� int
as
select �����������.* from ����������� join ��������� on �����������.���_����������� = ���������.���_����������� join ������������� on ���������.���_������������� = �������������.���_�������������
where �������������.���_�������������=@���_�������������


create proc Grade_Select_Course
@CourseId int = 1
as
select �����������.���,�����������.�������,�������������.��������,������.������,����
from (������ inner join ����������� on ������.���_�����������=�����������.���_�����������) 
inner join �������� on ������.���_�������� = ��������.���_��������
join ������������� on ��������.���_������������� = �������������.���_�������������
where ������.���_��������=@CourseId


exec Student_Select_Faculty 3


exec Grade_Select_Course 11