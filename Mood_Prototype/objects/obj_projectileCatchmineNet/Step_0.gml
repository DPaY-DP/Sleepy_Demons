	//protracting and retracting
var _dist = point_distance(x, y, owner.x, owner.y);
var _dir = point_direction(x, y, owner.x, owner.y);

if (!retract)
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
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
	
	if (_dist < 30)
	{
		if (caught != noone)
		{
			spdRetract = 0;
			
			timerDespawn--;
			if (timerDespawn == 0) || (caught.state.name == "Execute") 
			{
				instance_destroy();
				instance_destroy(owner);
			}
		}
		else
		{
			instance_destroy();
			instance_destroy(owner);
		}
	}
}


	//wall bounce
if (!active) exit;
if (place_meeting(x, y, obj_wall)) || (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	retract = true;

	audio_play_sound_at(snd_extendoCatch, x, y, 0, 100, 150, 1, 0, 0, gainSFX);
}


	//catching enemies
var _enemy = instance_place(x, y, obj_enemyHitbox);
if (_enemy != noone)
if (_enemy.owner.hp > 0)
{
	//deactivate
	active = false;
	
	//sound
	audio_play_sound_at(snd_extendoCatch, x, y, 0, 100, 150, 1, 0, 0, gainSFX);	

	//catching logic
	caught = _enemy.owner;
	retract = true;
}