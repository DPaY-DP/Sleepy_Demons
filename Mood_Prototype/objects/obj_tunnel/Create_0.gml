//immutable values
	//tunnel variables
sabotaged = false;

	//get center
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

	//get rooms
rooms = [];

var _list = ds_list_create();
instance_place_list(x, y, obj_room, _list, false);
rooms = list_to_array(_list);
ds_list_destroy(_list);																								 
																													 
	//get entrypoints
entries = [];

if (sprite_width / sprite_height >= 1)									// orientation: 0 = vertical, 1 = horizontal
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
})

array_push(rooms[1].doors, {
	object : id,
	toRoom : rooms[0],
	entrypoint : entries[1],
	exitpoint : entries[0],
})

	//set depth
depth += 50;



//states
setup_state_machine();


stateIdle = new State();
stateIdle.start = function()
{
}
stateIdle.run = function()
{
	if (point_distance(xCenter, yCenter, obj_player.x, obj_player.y) < 60)
	if (!sabotaged) && (keySabotage) && (!instance_exists(obj_managerMinigame))
	{
		instance_create_layer(xCenter, yCenter, "Overlay", obj_managerMinigame, { tunnel : id, game : "tunnel" });
	}	
}
stateIdle.draw = function()
{
	if (!sabotaged) && (point_distance(xCenter, yCenter, obj_player.x, obj_player.y) < 60) draw_sprite_simple(spr_UI_button, 2, xCenter, yCenter);
	
	image_index = sabotaged;
}
stateIdle.stop = function()
{
	
}

initialize_state(stateIdle);