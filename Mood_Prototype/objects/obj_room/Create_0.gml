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
alarm[0] = 1;					//every obj_room must be loaded BEFORE every obj_doorway !!
//alarm[1] = 2;					//setup for conjoined (every room needs its points and doors setup before this can run)
//conjoined = false;

//alarm[2] = 3;					//DEBUG


//game values

	//flooding
flood = false;
floodAmount = 0;
floodFactor = 0.005;
floodMax = 1;


	//debug
showDots = true;