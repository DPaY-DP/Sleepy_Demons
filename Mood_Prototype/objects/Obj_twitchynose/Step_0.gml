if (mouse_check_button_pressed(mb_left)) && (place_meeting(x, y, Obj_feather))
{
	x = irandom_range(GUIwidth *  0.2, GUIwidth *  0.8);
	y = irandom_range(GUIheight * 0.2, GUIheight * 0.8);
	ticklescore++;

	audio_play_sound(snd_FeatherTickle, 0, 0, gainSFX, 0, 0.9 + random(0.2));
}