create table Заявления(
Код_заявления int identity not null primary key,
Код_абитуриента int not null,
Код_специальности int not null,
Статус varchar(20) null)
