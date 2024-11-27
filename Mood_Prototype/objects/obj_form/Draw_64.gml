draw_self();

if (obj_managerMinigame.grabbedObject == id)
{
	x = device_mouse_x_to_gui(0);
	y = device_mouse_y_to_gui(0);
	
	//if (mouse_check_button_released(mb_left))
	//{
		var _hole = instance_place(x, y, obj_hole);
		if (_hole != noone)
		if (point_distance(x, y, _hole.x, _hole.y) < 60)		//(drop distance
		if (_hole.form == form) || (_hole.form == "square")
		{
			x = _hole.x;
			y = _hole.y;

			image_speed = 1;
			canBeGrabbed = false;

			obj_managerMinigame.grabbedObject = noone;
			obj_managerMinigame.formsLeft--;
			
			audio_play_sound(snd_squareHoleDrop, 0, 0, gainSFX * 3, 0, 0.8 + random(0.2));
		}
	//}
}

if	(canBeGrabbed) &&
	(obj_managerMinigame.grabbedObject == noone) &&
	(mouse_check_button_pressed(mb_left)) &&
	(mouse_in_area_GUI(	x - sprite_width * 0.75, y - sprite_height * 0.75,
						sprite_width * 1.5, sprite_height * 1.5))
{
	obj_managerMinigame.grabbedObject = id;
}

if (mouse_check_button_released(mb_left))
{
	obj_managerMinigame.grabbedObject = noone;
}