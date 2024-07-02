var _dist = point_distance(x, y, obj_player.x, obj_player.y);
var _dir = point_direction(x, y, obj_player.x, obj_player.y);

if (!retract)
{
	x += lengthdir_x(spd, image_angle);
	y += lengthdir_y(spd, image_angle);
	
	if (_dist > 400) retract = true;
}
else
{
	x += lengthdir_x(spdRetract, _dir);
	y += lengthdir_y(spdRetract, _dir);
	
	if (_dist < 80)
	{
		instance_destroy();
		
		if (target != undefined)
		{
			target.get_slowed(80);
			target.caught = undefined;
			target = undefined;
		}
	}
}

timerAlive++;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	instance_destroy();
}