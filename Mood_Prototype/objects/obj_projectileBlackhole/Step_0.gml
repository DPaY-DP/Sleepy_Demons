x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

//sound
if (!audio_is_playing(snd_blackholeGunStartTief)) && (!audio_is_playing(snd_blackholeGunLoopTief))
audio_play_sound_at(snd_blackholeGunLoopTief, x, y, 0, 100, 150, 1, 0, 0, gainSFX);

//spd *= 0.98;
//if (spd <= 3) spd = 0;

//force = forceBase + forceBoost - (1 - (spd / spdBase));
range = rangeBase + rangeBoost - (1 - (spd / spdBase));

with (OBJ_enemy)
{	
	var _dist = point_distance(x, y, other.x, other.y);
	
	if (_dist <= other.range)
	{
		if (_dist <= other.force)
		{
			hvel = 0;
			vvel = 0;
		}
		else
		{
			var _dir = point_direction(x, y, other.x, other.y);
			
			var _force = other.force * (1 - 0.5 * (_dist / other.range));
		
			hvel += lengthdir_x(other.force, _dir);
			vvel += lengthdir_y(other.force, _dir);
		}
	}
}

timerDuration--;
if (timerDuration == 0) instance_destroy();