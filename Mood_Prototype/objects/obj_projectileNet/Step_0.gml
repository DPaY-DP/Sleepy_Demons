var _dist = point_distance(x, y, obj_player.x, obj_player.y);
var _dir = point_direction(x, y, obj_player.x, obj_player.y);

if (!retract)
{
	x += lengthdir_x(spd, image_angle);
	y += lengthdir_y(spd, image_angle);
	
	if (_dist > range) retract = true;
}
else
{
	x += lengthdir_x(spdRetract, _dir);
	y += lengthdir_y(spdRetract, _dir);
	
	if (target != undefined)
	{
		if (timerTick > 0) timerTick--;
		else
		{
			var _damage = floor(damageTick);
			
			var _color = c_red;
			instance_create_layer(target.x, target.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

			target.hp -= _damage;
			
			damageTick += 0.5;
			timerTick = intervalTick;
		}
	}
	
	if (_dist < 80)
	{
		instance_destroy();
		
		if (target != undefined)
		{
			//target.get_slowed(80);
			target.caught = undefined;
			target = undefined;
		}
	}
}

timerAlive++;

if (!active) exit;
if (place_meeting(x, y, obj_wall)) || (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	//active = false;

	retract = true;

	audio_play_sound(snd_extendoCatch, 0, 0);
}

var _enemy = instance_place(x, y, obj_enemyHitbox)
if (_enemy != noone)
if (_enemy.owner.hp > 0)
{
	//deactivate
	active = false;
	
	//sound
	audio_play_sound(snd_extendoCatch, 0, 0);	

	//catching logic
	_enemy.owner.caught = id;
	target = _enemy.owner.id;

	retract = true;

	//damage applied
	var _color = c_red;
	instance_create_layer(target.x, target.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

	target.hp -= damage;
}