alter table Экзамены
add constraint ch_статус12
unique(Код_дисциплины, Код_специальности)