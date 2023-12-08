create table Абитуриенты(
Код_абитуриента int identity not null primary key,
Фамилия varchar(30) not null,
Имя varchar(30) not null,
Отчество varchar(20) not null,
Статус varchar(20) null,
Город varchar(30) not null)