
	
	if (!instance_exists(OBJ_enemy)) 
{
	if (room == room_win)
	{}

	if (room == room_mechanicsabotage)
	{
		room_goto_next();
		global.countRoom = 0;
		global.envHP = 1000;
	}
	
	if (room == room_e00)
	{
		show_debug_message("Hund");
	room_goto(room_win);
	global.countRoom = 0;
	global.envHP = 1000;
	
	show_debug_message("UFF");
	
	}
		if (room == room_lose)
	{}

	if (room == room_bigdemon)
	{
		show_debug_message("Hund");
	room_goto_next();
	global.countRoom = 0;
	global.envHP = 1000;
	
	show_debug_message("UFF");
	
	}
		if (room == room_a000)
	{
		show_debug_message("Hund");
	room_goto_next();
	global.countRoom = 0;
	global.envHP = 1000;
	
	show_debug_message("UFF");
	
	}
}

	
