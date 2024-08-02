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

if (!active) exit;
if (place_meeting(x, y, obj_wall)) || (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	active = false;

	retract = true;

	audio_play_sound(snd_extendoCatch, 0, 0);
}

var _enemy = instance_place(x, y, obj_enemyHitbox)
if (_enemy != noone)
if (_enemy.owner.hp > 0)
{
	active = false;

	_enemy.owner.caught = id;
	target = _enemy.owner.id;

	retract = true;

	audio_play_sound(snd_extendoCatch, 0, 0);	
}