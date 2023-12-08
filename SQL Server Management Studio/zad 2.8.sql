alter table Экзамены
add constraint ch_статус123456
check (Положительный_балл between 1 and 100)