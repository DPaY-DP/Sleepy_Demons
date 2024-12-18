//immutable values
	//
sabotaged = false;

	//get center
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

	//get rooms
rooms = [];

var _list = ds_list_create();
instance_place_list(x, y, obj_room, _list, false);
rooms = ds_list_to_array(_list);
ds_list_destroy(_list);																								 
																													 
	//get entrypoints
entries = [];

	//get orientation
		//check position of rooms relative to centerpoint of door. 
		//both above == horizontal; both left == vertical. 
		//theoretically, there should be no other possible permutations.
orientation = "horizontal";
show_debug_message($"{x}, {y}")
if (rooms[0].x < xCenter) && (rooms[1].x < xCenter) orientation = "vertical";


if (orientation == "horizontal")
{				
	entries[0] = {
		x : xCenter + (sprite_width / 2) * sign(rooms[0].x - x),		//the x position of the entry point into this doorway is
																			//the xCenter of the door PLUS or MINUS half it's sprite_width.
																			//if the door is to the right of the room, it is MINUS
																			//to the left it's PLUS (that's what sign(x - _door.x) does)
																				
		y : yCenter,														//the y position of the entry point into the doorway is
	};																		//always just yCenter (or xCenter on vertical doors)
		
	entries[1] = {
		x : xCenter + (sprite_width / 2) * sign(rooms[1].x - x),
		y : yCenter,												
	};																		
}
else
{
	entries[0] = {
			x : xCenter,
			y : yCenter + (sprite_height / 2) * sign(rooms[0].y - y),
		};
		
	entries[1] = {
			x : xCenter,
			y : yCenter + (sprite_height / 2) * sign(rooms[1].y - y),
		};
}

	//give rooms connector data
array_push(rooms[0].doors, {
	object : id,
	toRoom : rooms[1],
	entrypoint : entries[0],
	exitpoint : entries[1],
	append : [],
})

array_push(rooms[1].doors, {
	object : id,
	toRoom : rooms[0],
	entrypoint : entries[1],
	exitpoint : entries[0],
	append : [],
})

	//set depth
depth += 50;