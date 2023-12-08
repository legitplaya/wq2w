alter table Экзамены
add constraint fk_специальности1
foreign key (Код_специальности)
references Специальности (Код_специальности)