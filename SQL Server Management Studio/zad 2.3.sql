alter table Заявления
add constraint ch_статус1
unique(Код_дисциплины, Код_специальности)