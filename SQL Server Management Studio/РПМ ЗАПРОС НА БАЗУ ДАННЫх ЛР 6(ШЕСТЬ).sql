use [ip(registration dok)]
CREATE TABLE Регистрация(Код_регистратора INT PRIMARY KEY,
Фамилия CHAR(30),
Имя CHAR(30),
Отчество CHAR(30),
Должность CHAR(30),
Дата_приема_на_работу DATETIME)

CREATE TABLE Документ(Код_документа INT PRIMARY KEY, 
Номер_документа CHAR(40),
Дата_регистрации DateTime,
Краткое_содержание_документа CHAR(40),
Тип_документа CHAR(40),
Код_организации_отправителя int foreign key references Организация(Код_организации_отправителя),
Код_регистратора int foreign key references Регистрация(Код_регистратора))

CREATE TABLE Организация(Код_организации_отправителя INT PRIMARY KEY,
Сокращенное_название CHAR(30),
Полное_названи CHAR(200),
Юридический_адрес VARCHAR(100),
Телефон char(50),
ФИО_руководителя CHAR(50))
