function get_animation_frame(sprite, gametick)
{
	var _spd = sprite_get_speed(sprite);
	var _framelength = fps / _spd;
	
	return floor(gametick / _framelength);
}