alter table Экзамены
add constraint fk_специальности12
foreign key (Код_дисциплины)
references Дисциплины (Код_дисциплины)