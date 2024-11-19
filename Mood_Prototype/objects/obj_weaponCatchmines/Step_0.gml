//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;


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
}


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb) && (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileCatchmine, { image_angle : image_angle });
}


//secondary action
if (rmb) && (timerFirerate == 0) && (ammo > 0)
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
			show_debug_message("nah bruv")
			
			exit;
		}
		
		show_debug_message(_checkDist)
	}
	
	targetGrapple = [_x, _y];
	grappling = true;
	with (obj_player) switch_state(stateLock);
	audio_play_sound(snd_grapple, 0, 0, 1, 0, 0.8 + random(0.4));
	
	dirGrapple = point_direction(x, y, targetGrapple[0], targetGrapple[1]);
}