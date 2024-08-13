if (mouse_on_me()) 
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left)) held = true;
	
	if (held) 
	{
		image_index = 2;
		if (mouse_check_button_released(mb_left)) func();
	}
	
	if (!mouse_check_button(mb_left)) held = false;
}
else 
{
	image_index = 0;
	held = false;
}

x = xReal + 2000 * (obj_main.mode != "main");