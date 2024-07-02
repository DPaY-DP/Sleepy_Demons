//get inputs
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var _dir = point_direction(x, y, mouse_x, mouse_y);

//speed modification
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
var _hacc = (right - left) * acc;
var _vacc = (down - up) * acc;

if (_hacc != 0)
{
	if (!in_range(hvel, -velMax, velMax))
	{
		hvel *= factorVelDecWalking;
	}
	
	
	
	if (sign(_hacc) == 1)
	{
		if (hvel + _hacc < velMax) hvel += _hacc;
		else if (hvel < velMax) hvel = velMax;
	}
	
	
	
	if (sign(_hacc) == -1) 
	{
		if (hvel + _hacc > -velMax) hvel += _hacc;
		else if (hvel > -velMax) hvel = -velMax;
	}
}
else hvel *= factorVelDecStanding;

if (_vacc != 0)
{
	if (!in_range(vvel, -velMax, velMax))
	{
		vvel *= factorVelDecWalking;
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
else vvel *= factorVelDecStanding;


//collision
if (!place_meeting(x + hvel, y, obj_wall)) x += hvel;
else
{
	x = floor(x);
	hvel = floor(hvel);
	
	var _doEffect = false;
	if (abs(hvel) >= 10) 
	{
		_doEffect = true;
	}

	while (!place_meeting(x + sign(hvel), y, obj_wall)) x += sign(hvel);
	
	if (_doEffect) do_effect_dust(x + sign(hvel) * sprite_width / 2, y);
	
	hvel = 0;
}

if (!place_meeting(x, y + vvel, obj_wall)) y += vvel;
else
{
	y = floor(y);
	vvel = floor(vvel);
	
	var _doEffect = false;
	if (abs(vvel) >= 10) 
	{
		_doEffect = true;
	}

	while (!place_meeting(x, y + sign(vvel), obj_wall)) y += sign(vvel);
	
	if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
	vvel = 0;
}

image_angle = _dir;



//DEBUG
if (keyboard_check_pressed(ord("I"))) with (obj_enemyDemonSaboteur) switch_state(stateExecutable);