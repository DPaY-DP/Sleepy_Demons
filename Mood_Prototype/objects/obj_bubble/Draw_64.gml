draw_self();
imageScale = clickedTimes * 0.1;
image_xscale = 1 + imageScale;
image_yscale = 1 + imageScale;

if(clickedTimes == clickedGoal)
{
	image_speed = 1;
	fastclickwon = true;

	audio_play_sound(snd_ClickGamePop, 0, 0, gainSFX);
}

draw_text_simple(GUIwidth / 2, GUIheight / 2, string(clickedGoal-clickedTimes), { color : c_gray, font : font_upheaval_scalable, size : fontscale * 14});

if(image_index == 4)
{
	image_speed = 0;
}


if(mouse_check_button_pressed(mb_left)) && instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)
{
	if(clickedTimes < clickedGoal) clickedTimes++;

	audio_play_sound(snd_mouseClick, 0, 0, gainSFX, 0, 0.9 + random(0.2));
}