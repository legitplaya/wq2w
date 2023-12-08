create database testdatabase1
on primary
( name = testdatabasedata,
filename = 'C:\temp\TestdatabaseD.mdf',
size = 3072kb,
filegrowth = 1024kb)
log on
(name = testdatabase_log,
filename = 'C:\temp\testdatabase_log.ldf',
size=2,
filegrowth=10%)