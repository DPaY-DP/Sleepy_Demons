//immutable values
doors = [];

number = global.countRooms;
global.countRooms++;

global.playerHere = 0;
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