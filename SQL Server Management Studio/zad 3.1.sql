alter table Заявления
add constraint fk_специальности
foreign key (Код_специальности)
references Специальности (Код_специальности)