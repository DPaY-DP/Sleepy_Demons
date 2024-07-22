draw_self();

if (obj_managerMinigame.grabbedObject == id)
{
	x = device_mouse_x_to_gui(0);
	y = device_mouse_y_to_gui(0);
	
	if (mouse_check_button_released(mb_left))
	{
		var _hole = instance_place(x, y, obj_hole);
		if (_hole != noone)
		if (_hole.form == form) || (_hole.form == "square")
		{
			x = _hole.x;
			y = _hole.y;

			image_speed = 1;

			obj_managerMinigame.grabbedObject = noone;
			obj_managerMinigame.formsLeft--;
		}
	}
}

if	(obj_managerMinigame.grabbedObject == noone) &&
	(mouse_check_button_pressed(mb_left)) &&
	(mouse_in_area_gui(	x - sprite_width * 0.75, y - sprite_height * 0.75,
						sprite_width * 1.5, sprite_height * 1.5))
{
	obj_managerMinigame.grabbedObject = id;
}