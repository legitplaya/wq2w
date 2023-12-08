alter table Заявления
add constraint fk_абитуриента
foreign key (Код_абитуриента)
references Абитуриенты (Код_абитуриента)