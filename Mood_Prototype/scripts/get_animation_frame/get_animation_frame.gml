function get_animation_frame(sprite, gametick)
{
	var _gamespeed = game_get_speed(gamespeed_fps);
	var _spd = sprite_get_speed(sprite);
	var _framelength = _gamespeed / _spd;
	
	return floor(gametick / _framelength);
}