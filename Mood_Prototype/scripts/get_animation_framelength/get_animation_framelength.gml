function get_animation_framelength(sprite)
{
	var _spd = sprite_get_speed(sprite);
	return fps / _spd;
}