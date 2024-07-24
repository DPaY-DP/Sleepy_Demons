x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

timerAlive++;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	instance_destroy();
}

if (active)
if (point_distance(x, y, xStart, yStart) > range) || (place_meeting(x, y, OBJ_colliderPlayer))
{
	explode();
}

//if (audioExplosion != undefined) && (!audio_is_playing(audioExplosion))
//{
//	audio_play_sound(snd_acidSizzle, 0, 0);
//	audioExplosion = undefined;
//}