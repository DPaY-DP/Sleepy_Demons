//get point data
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

distInteract = 50;

sabotaged = false;

//connect rooms
var connection = [];

with (obj_room)
if (instance_place(x, y, other.id))
{
	array_push(connection, id);
}

array_push(connection[0].connectedTo, { connector : id, room : connection[1] });
array_push(connection[1].connectedTo, { connector : id, room : connection[0] });


//set visuals
depth += 50;