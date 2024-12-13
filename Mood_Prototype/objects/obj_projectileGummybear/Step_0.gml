if (spd > 0)
{
	x += lengthdir_x(spd, image_angle);
	y += lengthdir_y(spd, image_angle);
	
	spd *= 0.95;
	if (spd < 0.05) stop();
}
else
{
	timerDuration--;
	if (timerDuration == 0) instance_destroy();
	
	if (timerDuration mod 60 == 0)
	{
		var _eligible = [];
		
		with (OBJ_enemy)
		{
			if (gummybear == noone) && (hp > 0)
			array_push(_eligible, id);
		}
		_eligible = array_shuffle(_eligible);
		
		var _enemy = array_pop(_eligible);
		
		with (_enemy)
		{
			gummybear = other.id;
			switch_state(stateSeek);
		}
	}
}