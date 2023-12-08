alter table Абитуриенты
add constraint ch_статус
check(статус in ('не зачислен','зачислен','забрал документы'))