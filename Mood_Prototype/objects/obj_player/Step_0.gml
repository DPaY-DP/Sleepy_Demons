//get inputs
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

//visuals
orientation = point_direction(x, y, mouse_x, mouse_y);

////speed modification
inRoom = instance_place(x, y, obj_room);

	//flood behavior (remake)

	//booster behavior (remake)
	//if (place_meeting(x,y, obj_booster)) booster_cd = 10;
	//if (booster_cd > 0)
	//{
	//	booster_speed = 5;
	//	booster_cd =  booster_cd - .1;
	//}
	//else
	//{
	//	booster_speed = 0;
	//}

//movement
//get accelleration
	//reads out the players input and converts it into accelleration defined by the acc variable
var _hacc = (right - left) * acc;
var _vacc = (down - up) * acc;


//apply accelleration
	//if there is an accellerative force exalted by the player...
if (_hacc != 0)
{
		//if the current velocity of the player is outside the maximum range, 
		//don't apply the accelleration and
		//apply friction
	if (!in_range(hvel, -velMax, velMax))
	{
		hvel *= frictionWalking;
	}
	
		//read accelleration direction
	if (sign(_hacc) == 1)
	{
		//if current velocity plus current accelleration does NOT break the velocity maximum, apply accelleration to velocity
		if (hvel + _hacc < velMax) hvel += _hacc;
			//if current velocity plus current accelleration DOES break the velocity maximum, but current velocity is yet below
			//the maximum, set velocity to maximum velocity
		else if (hvel < velMax) hvel = velMax;
	}
	
	if (sign(_hacc) == -1) 
	{
		if (hvel + _hacc > -velMax) hvel += _hacc;
		else if (hvel > -velMax) hvel = -velMax;
	}
}
	//if there is no accellerative force applied by the player,
	//apply friction
else hvel *= frictionStanding;


	//same logic as above
if (_vacc != 0)
{
	if (!in_range(vvel, -velMax, velMax))
	{
		vvel *= frictionWalking;
	}
	
	if (sign(_vacc) == 1)
	{
		if (vvel + _vacc < velMax) vvel += _vacc;
		else if (vvel < velMax) vvel = velMax;
	}
	
	if (sign(_vacc) == -1) 
	{
		if (vvel + _vacc > -velMax) vvel += _vacc;
		else if (vvel > -velMax) vvel = -velMax;
	}
}
else vvel *= frictionStanding;


////collision
if (!place_meeting(x + hvel, y, obj_wall)) x += round(hvel);
else
{
	x = round(x);
	hvel = round(hvel);
	
	var _doEffect = false;
	if (abs(hvel) >= 10) _doEffect = true;

	var _loop = 1;
	while (!place_meeting(x + sign(hvel), y, obj_wall)) && (_loop < 1000)
	{
		x += sign(hvel);
		
		show_debug_message($"Resolving collision, loop {_loop}, x = {x}");
		_loop++;
	}
	
	if (_doEffect) do_effect_dust(x + sign(hvel) * sprite_width / 2, y);
	
	hvel = 0;
}



if (!place_meeting(x, y + vvel, obj_wall)) y += round(vvel);
else
{
	y = round(y);
	vvel = round(vvel);
	
	var _doEffect = false;
	if (abs(vvel) >= 10) _doEffect = true;

	var _loop = 1;
	while (!place_meeting(x, y + sign(vvel), obj_wall)) && (_loop < 1000)
	{
		y += sign(vvel);
		
		show_debug_message($"Resolving collision, loop {_loop}, y = {y}");
		_loop++;
	}
	
	if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
	vvel = 0;
}


//DEBUG
if (keyboard_check_pressed(ord("I"))) with (obj_enemyDemonSaboteur) switch_state(stateExecutable);