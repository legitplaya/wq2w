create table Оценки(
Код_оценки int identity not null primary key,
Код_абитуриента int not null,
Код_экзамена int not null,
Оценка int null)
