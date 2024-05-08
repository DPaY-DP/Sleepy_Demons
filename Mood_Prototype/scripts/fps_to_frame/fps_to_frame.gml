function fps_to_frame(sprite, frame)
{
	return (fps / sprite_get_speed(sprite)) * (frame);
}
