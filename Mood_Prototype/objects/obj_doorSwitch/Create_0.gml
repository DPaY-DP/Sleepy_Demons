buttonPress = false;
doorTimer = 0;
timerGoal = 2 * room_speed; 

activate = function()
{
	var _lineCheck = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);
	if	(point_distance(x, y, obj_player.x, obj_player.y) < 120) && (_lineCheck == noone)
	{
		if (!instance_exists(obj_managerMinigame)) draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
		
		if(keyExecute) 
		{
			buttonPress = true;
			 instance_deactivate_object(obj_playerDoor);
		}
	}
	
	if(buttonPress) doorTimer++;
	
	if(doorTimer >= timerGoal) 
	{
		buttonPress = false;
		doorTimer = 0;
		 instance_activate_object(obj_playerDoor);
	}
}