use [ip(registration dok)]
CREATE TABLE �����������(���_������������ INT PRIMARY KEY,
������� CHAR(30),
��� CHAR(30),
�������� CHAR(30),
��������� CHAR(30),
����_������_��_������ DATETIME)

CREATE TABLE ��������(���_��������� INT PRIMARY KEY, 
�����_��������� CHAR(40),
����_����������� DateTime,
�������_����������_��������� CHAR(40),
���_��������� CHAR(40),
���_�����������_����������� int foreign key references �����������(���_�����������_�����������),
���_������������ int foreign key references �����������(���_������������))

CREATE TABLE �����������(���_�����������_����������� INT PRIMARY KEY,
�����������_�������� CHAR(30),
������_������� CHAR(200),
�����������_����� VARCHAR(100),
������� char(50),
���_������������ CHAR(50))
