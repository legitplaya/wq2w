create table students(
id tinyint not null primary key identity(1,1),
fam varchar(6) unique,
name varchar (30) not null,
pol varchar (3) check (pol = '���' or pol = '���'),
gr varchar(6) default '��5-21'
)

create table uspev(
id_s tinyint references students(id), dics varchar(30),
ocenka decimal (3,2),
primary key (id_s, dics))

Insert into students (fam,name,pol)
values ('������', '������', '���')

insert into uspev (id_s,dics, ocenka)
values (9,'���', 5)

update students
set fam = 'fd'
where id = 6
