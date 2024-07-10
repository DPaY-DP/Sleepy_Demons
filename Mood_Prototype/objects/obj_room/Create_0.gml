//immutable values
doors = [];

if (!variable_global_exists("countRooms")) 
{
	number = 0;
	global.countRooms = 1;
}
else
{
	number = global.countRooms;
	global.countRooms++;
}



	//delayed setup
alarm[0] = 1;									//every obj_room must be loaded BEFORE every obj_doorway !!


//game values

	//flooding
flood = false;
floodAmount = 0;
floodFactor = 0.005;
floodMax = 1;