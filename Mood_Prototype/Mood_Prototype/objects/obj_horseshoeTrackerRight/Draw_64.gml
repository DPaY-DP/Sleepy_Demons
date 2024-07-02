draw_self();

if (mouse_check_button_pressed(mb_left))
{
	with (obj_horseshoeColliderRight)
	{
		if (place_meeting(x, y, other.id))
		{
			image_index = 2;
		}
		else image_index = 1;
	}
	
	instance_destroy();
	
	if (obj_horseshoeColliderLeft.image_index = 2) || (obj_horseshoeColliderRight.image_index = 2)
	{
		obj_managerMinigame.won = true;
	}
	
	obj_managerMinigame.gameover = true;
}