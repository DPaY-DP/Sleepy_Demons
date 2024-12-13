//IMMUTABLE VALUES
lockX = x;
lockY = y;


//GAME VALUES
fade = false;


//METHODS
toggle_active = function(true_or_false)
{
	if (true_or_false) 
	{
		x = lockX;
		
		if (place_meeting(x, y, obj_player)) 
		{
			show_debug_message("fade In")
		
			fade = true;
			x = lockX + 4000;
		}
	}
	else x = lockX + 4000;
}