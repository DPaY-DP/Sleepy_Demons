draw_self();

if (mouse_check_button_released(mb_left))
{
	with (obj_horseshoeColliderLeft)
	{		
		if (place_meeting(x, y, other.id))
		{
			image_index = 2;
		}
		else image_index = 1;
	}
	
	instance_destroy();
	instance_create_depth(obj_horseshoe.x - 53 * size, obj_horseshoe.y, depth - 4, obj_horseshoeTrackerRight, { size : size });
}