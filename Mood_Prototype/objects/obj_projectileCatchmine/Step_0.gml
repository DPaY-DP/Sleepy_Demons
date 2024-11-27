if (spd > 0)
{
	x += lengthdir_x(spd, image_angle);
	y += lengthdir_y(spd, image_angle);
	
	spd *= 0.95;
	if (spd < 0.2) 
	{
		spd = 0;
		image_index = 1;
	}
}
else if (!catching)
{
	timerDuration--;
	if (timerDuration == 0) instance_destroy();
	
	var _list = ds_list_create();
	collision_circle_list(x, y, range, OBJ_enemy, false, false, _list, true);
	var _targets = ds_list_to_array(_list);
	ds_list_destroy(_list);
	
	var _length = array_length(_targets);
	for (var i = 0; i < _length; i++)
	{
		var _target = _targets[i];
		
		if (_target.hp > 0)
		if (!collision_line(x, y, _target.x, _target.y, obj_wall, false, false))
		{
			catching = true;
			image_index = 2;
			
			var _dir = point_direction(x, y, _target.x, _target.y);
			instance_create_depth(x, y, depth, obj_projectileCatchmineNet, { dir : _dir, owner : id, range : range * 3 });
			audio_play_sound(snd_catchmineThrow, 0, 0, gainSFX);
			break;
		}
	}
}