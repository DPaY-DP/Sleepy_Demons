//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpent, { image_index : enumWeaponEffect.CATCHMINE, dir : image_angle - 70 - random(40), size : 1 });
}


//grappling
if (grappling)
{
	var _x = targetGrapple[0];
	var _y = targetGrapple[1];
	
	var _xMod = lengthdir_x(spdGrapple, dirGrapple);
	var _yMod = lengthdir_y(spdGrapple, dirGrapple);
	
	var _playerCollision = false;	
	with (obj_player)
	{
		if (!place_meeting(x + _xMod, y + _yMod, obj_wall))
		{
			x += _xMod;
			y += _yMod;
		}
		else _playerCollision = true;
	}
	
	var _dist = point_distance(x, y, _x, _y);
	if (_playerCollision)
	{
		grappling = false;
		with (obj_player) switch_state(stateActive);
	}
	
	if (!audio_is_playing(snd_grapplingHookPulling)) audio_play_sound(snd_grapplingHookPulling, 0, 0, gainSFX, 0, grapplePitch);
}


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileCatchmine, { image_angle : image_angle });
	
	audio_play_sound(snd_defaultFire, 0, 0, gainSFX);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);


//secondary action
if (rmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	var _checkDist = 0;
	var _collision = noone;
	while (_collision == noone)
	{
		var _x = x + lengthdir_x(_checkDist, image_angle);
		var _y = y + lengthdir_y(_checkDist, image_angle);
		
		_collision = instance_position(_x, _y, obj_wall); //[obj_wall, OBJ_enemy]);
		
		_checkDist += 8;
		if (_checkDist >= room_width)
		{
			timerFirerate = 0;
			ammo++;
			
			exit;
		}
	}
	
	targetGrapple = [_x, _y];
	grappling = true;
	grapplePitch = random_range(0.9, 1.1);
	with (obj_player) switch_state(stateLock);
	
	dirGrapple = point_direction(x, y, targetGrapple[0], targetGrapple[1]);
	
	audio_play_sound(snd_grapplingHookHit, 0, 0, gainSFX, 0, 1.3);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);