function frames_to_speed(sprite, gameframes)
{
	var animation_frames = sprite_get_number(sprite) - 1;
	var animation_speed = sprite_get_speed(sprite);
	var factor = 60 / animation_speed;
	return animation_frames * factor / gameframes;
}
