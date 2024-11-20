if (instance_position(mouse_x, mouse_y, id)) && (mouse_check_button_pressed(mb_left))
{
	drag = true;
}

if (drag)
{
	x = mouse_x;
	x = clamp(x, owner.x - owner.sprite_width, owner.x);
	
	var _gain = (x - (owner.x - owner.sprite_width)) / owner.sprite_width;
	_gain = round(_gain * 10) / 10;
	
	x = (owner.x - owner.sprite_width) + owner.sprite_width * _gain;
	
	global.save[$ "volume" + nameGain] = _gain;
	if (nameGain == "Music") audio_sound_gain(obj_main.musicMain, _gain, 0);
	
	if (mouse_check_button_released(mb_left)) drag = false;
}

if (obj_main.mode == "main") instance_destroy();