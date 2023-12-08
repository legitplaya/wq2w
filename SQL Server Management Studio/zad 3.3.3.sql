alter table Оценки
add constraint fk_экзамена
foreign key (Код_экзамена)
references Экзамены (Код_экзамена)