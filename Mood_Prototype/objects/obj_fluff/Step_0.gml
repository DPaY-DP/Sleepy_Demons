if (dragged)
{
	x = mouse_x + xOffset;
	y = mouse_y + yOffset;
}

if (mouse_on_me_center_GUI()) && (mouse_check_button_pressed(mb_left))
{
	dragged = true;
	xOffset = x - mouse_x;
	yOffset = y - mouse_y;
	
	audio_play_sound(snd_swishSoundFeather, 0, 0, gainSFX, 0, 0.9 + random(0.2));
}