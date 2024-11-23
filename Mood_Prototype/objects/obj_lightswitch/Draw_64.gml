draw_self();

if  (mouse_on_me_center_GUI()) &&
	(mouse_check_button_pressed(mb_left)) &&
	(!turnedOn)
{
	image_index = 1;
	obj_managerMinigame.switchesActivated++;
	turnedOn = true;
	
	audio_play_sound(choose(snd_lightSwitch1, snd_lightSwitch3), 0, 0, gainSFX, 0, 0.9 + random(0.2));
}

