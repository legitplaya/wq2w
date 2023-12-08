� ������� 1.
create database Metlov1
on
(name=metlov_dat,
filename='C:\TEMP\metlov1.mdf',
size=10,
maxsize=50,
filegrowth=5)
log on
(name=metlov_log,
filename='C:\TEMP\metlovlog1.ldf',
size=5mb,
maxsize=25mb,
filegrowth=5mb)

sp_helpdb Metlov1



� ������� 2
sp_addumpdevice 'disk', 'backupdisk_metlov1', 'c:\temp\metlob1.bak'

backup database Metlov1 TO backupdisk_metlov1



� ������� 3
create user thirsExercise for login thirsExercise
EXEC sp_addrolemember 'db_owner', 'thirsExercise';



� ������� 4
� ������� ���� ������
create DATABASE Exercise5
ON
(
NAME = Exercise4_dat,
FILENAME = 'C:\TEMP\Exercise5.mdf',
SIZE = 5MB,
MAXSIZE = 10MB,
FILEGROWTH = 20%
)
LOG ON
(
NAME = Exercise4_log,
FILENAME = 'C:\TEMP\Exercise5.ldf',
SIZE = 2MB,
MAXSIZE = 5MB,
FILEGROWTH = 1MB
);
sp_helpdb Exercise5



� ������� 5.
alter database Exercise4
add filegroup Exercise5;

alter database Exercise4
add file
(
name = Exercise5,
filename = 'C:\TEMP\Exercise5.ndf',
size = 2MB,
filegrowth = 10%
)
to filegroup Exercise5;



� ������� 7.
select
db_name(database_id) as DatabaseName,
sum(size/128.0) as TotalSizeMB,
sum(cast(fileproperty(name, 'SpaceUsed') as float)/128.0) as UsedSpaceMB,
sum((size - cast(fileproperty(name, 'SpaceUsed') as float))/128.0) as FreeSpaceMB
from
sys.master_files
where
database_id = db_id('Exercise4')
group by
database_id;



� ������� 8.


-- ������� ���������� ��� ����� ���� ������
USE Exercise5;

-- ����� ��������� ������ � ���������� TRUNCATEONLY
DBCC SHRINKDATABASE (Exercise5, TRUNCATEONLY);


� ������� 9.
BACKUP DATABASE Exercise5
TO DISK = 'C:\TEMP\Exercise5_FullBackup.bak'
WITH INIT, FORMAT, NAME = 'Exercise5 Full Backup';
BACKUP LOG Exercise5
TO DISK = 'C:\TEMP\Exercise5_LogBackup.trn'
WITH INIT, FORMAT, NAME = 'Exercise5 Log Backup';



� ������� 10.
RESTORE DATABASE Exercise5
FROM DISK = 'C:\TEMP\Exercise5_FullBackup.bak'
WITH REPLACE, RECOVERY;