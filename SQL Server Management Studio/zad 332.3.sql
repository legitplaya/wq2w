alter table Оценки
add constraint fk_абитуриента1
foreign key (Код_абитуриента)
references Абитуриенты (Код_абитуриента)