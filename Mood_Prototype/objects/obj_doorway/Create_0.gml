//get point data
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

if (!variable_global_exists("countDoor")) global.countDoor = 0;
numberDoor = global.countDoor++;

sabotaged = false;



//connect rooms
var _idRooms = [];

with (obj_room)
if (instance_place(x, y, other.id))
{
	array_push(_idRooms, id);
}

array_push(_idRooms[0].connectedTo, { connector : id, room : _idRooms[1] });
array_push(_idRooms[1].connectedTo, { connector : id, room : _idRooms[0] });


//set visuals
depth += 50;