draw_self();

if (instance_exists(OBJ_enemy))
{
	var _lineCheck = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);
	
	if (point_distance(x, y, obj_player.x, obj_player.y) < 120) && (_lineCheck == noone)
	{
		if (!instance_exists(obj_managerMinigame)) draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
		
		if (keyExecute) 
		{
			buttonPress = true;
			image_index++;
			with (obj_timerDoor) toggle_active(false);
		}
	}
	
	if (buttonPress) doorTimer++;
	
	if (doorTimer >= timerGoal) 
	{
		buttonPress = false;
		doorTimer = 0;
		image_index--;
		with (obj_timerDoor) toggle_active(true);
	}
}