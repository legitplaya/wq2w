alter table Оценки
add constraint ch_статус1234
unique(Код_абитуриента, Код_экзамена)