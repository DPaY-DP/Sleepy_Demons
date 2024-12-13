if (dragged)
{
	x = device_mouse_x_to_gui(0) + xOffset;
	y = device_mouse_y_to_gui(0) + yOffset;
}

if (mouse_on_me_center_GUI()) && (mouse_check_button_pressed(mb_left))
{
	dragged = true;
	xOffset = x - device_mouse_x_to_gui(0);
	yOffset = y - device_mouse_y_to_gui(0);
	
	audio_play_sound(snd_swishSoundFeather, 0, 0, gainSFX, 0, 0.9 + random(0.2));
}

if (mouse_check_button_released(mb_left)) dragged = false;