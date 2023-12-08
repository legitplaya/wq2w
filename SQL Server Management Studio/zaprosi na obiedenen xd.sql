select r_id, r_name, c_id, c_room, c_name
From rooms join computers on r_id=c_room

select r_id,r_name,c_id,c_room,c_name
From rooms Left Join computers on r_id = c_room

select r_id,r_name,c_id,c_room,c_name
From rooms left join computers on r_id=c_room
where c_room is null

select r_id, r_name,c_id,c_room,c_name
From rooms Right join computers on r_id=c_room

select r_id,r_name,c_id,c_room,c_name
From rooms right join computers on r_id = c_room
where c_room is null

select r_id,r_name,c_id,c_room,c_name
from rooms full join computers
on r_id=c_room

select r_id,r_name,c_id,c_room,c_name
from rooms full join computers on r_id=c_room
where r_id is null or c_id is null

select r_id,r_name,c_id,c_room,c_name
From rooms,computers

select r_id,r_name,c_id,c_room,c_name
From rooms cross join computers
where r_id != c_room