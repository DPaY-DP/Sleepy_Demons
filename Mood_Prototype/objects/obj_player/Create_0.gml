#region IMMUTABLE VALUES
accDefault = 1.25;
velMaxDefault = 7;

frictionStandingDefault = 0.75;
frictionWalkingDefault = 0.5;
			//knockback is LESS effective while moving to incentivize the player to keep moving
			//instead of standing still like an idiot

accWater = 0.99;
velMaxWater = 5.5;

frictionStandingWater = 0.55;
frictionWalkingWater = 0.4;

spdRepair = 1;
#endregion


#region GAME VALUES
acc = accDefault;
velMax = velMaxDefault;

frictionStanding = frictionStandingDefault;
frictionWalking = frictionWalkingDefault;

orientation = 0;

dir = 0;

vel = 0;
hvel = 0;
vvel = 0;
#endregion


#region METHODS
do_effect_dust = function(_x, _y)
{
	var _lifeMax = 20;
	
	//ef_dust
	ps = part_system_create();
	part_system_draw_order(ps, true);

	//Emitter
	ptype1 = part_type_create();
	part_type_shape(ptype1, pt_shape_cloud);
	part_type_size(ptype1, 1, 2, 0, 0);
	part_type_scale(ptype1, 0.25, 0.25);
	part_type_speed(ptype1, 5, 5, 0, 0);
	part_type_direction(ptype1, 0, 360, 0, 0);
	part_type_gravity(ptype1, 0, 270);
	part_type_orientation(ptype1, 0, 0, 0, 0, false);
	part_type_colour3(ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
	part_type_alpha3(ptype1, 1, 1, 1);
	part_type_blend(ptype1, false);
	part_type_life(ptype1, 10, _lifeMax);

	pemit1 = part_emitter_create(ps);
	part_emitter_region(ps, pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pemit1, ptype1, 5);
	part_emitter_delay(ps, pemit1, 2, 0, time_source_units_frames)
	
	part_system_depth(ps, depth - 1);

	part_system_position(ps, _x, _y);
	
	alarm[0] = _lifeMax;
}
#endregion


#region SPAWNING AND SETUP
instance_create_depth(x, y, depth - 2, obj_playerHand);
instance_create_depth(x, y, depth - 1, obj_weapon);
#endregion

#region STATE MACHINE
setup_state_machine();

stateActive = new State();
stateActive.start = function()
{
	
}
stateActive.run = function()
{
	//get inputs
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));

	//visuals
	orientation = point_direction(x, y, mouse_x, mouse_y);

	////speed modification
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;

	if (inRoom.flood)
	{
		acc = accWater;
		velMax = velMaxWater;
	
		frictionStanding = frictionStandingWater;
		frictionWalking = frictionWalkingWater;
	}
	else
	{
		acc = accDefault;
		velMax = velMaxDefault;

		frictionStanding = frictionStandingDefault;
		frictionWalking = frictionWalkingDefault;
	}

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
	if (!place_meeting(x + hvel, y, OBJ_colliderPlayer)) x += round(hvel);
	else
	{
		x = round(x);
		hvel = round(hvel);
	
		var _doEffect = false;
		if (abs(hvel) >= 10) _doEffect = true;

		var _loop = 1;
		while (!place_meeting(x + sign(hvel), y, OBJ_colliderPlayer)) && (_loop < 1000)
		{
			x += sign(hvel);
		
			//show_debug_message($"Resolving collision, loop {_loop}, x = {x}");
			_loop++;
		}
	
		if (_doEffect) do_effect_dust(x + sign(hvel) * sprite_width / 2, y);
	
		hvel = 0;
	}



	if (!place_meeting(x, y + vvel, OBJ_colliderPlayer)) y += round(vvel);
	else
	{
		y = round(y);
		vvel = round(vvel);
	
		var _doEffect = false;
		if (abs(vvel) >= 10) _doEffect = true;

		var _loop = 1;
		while (!place_meeting(x, y + sign(vvel), OBJ_colliderPlayer)) && (_loop < 1000)
		{
			y += sign(vvel);
		
			//show_debug_message($"Resolving collision, loop {_loop}, y = {y}");
			_loop++;
		}
	
		if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
		vvel = 0;
	}
}
stateActive.draw = function()
{
	var _iterations = floor(abs(hvel + vvel) / 8);
	var _dist = 6;
	var _dir = point_direction(0, 0, hvel, vvel);

	for (var i = 0; i < _iterations; i++)
	{
		var _alpha = 1 - i / _iterations;
	
		draw_sprite_simple(sprite_index, 0, x - lengthdir_x(_dist * i, _dir), y - lengthdir_y(_dist * i, _dir), { angle : image_angle, alpha : _alpha });
	}

	draw_sprite_simple(sprite_index, 0, x, y, { angle : orientation });
}

stateLock = new State("Lock");
stateLock.draw = function()
{
	draw_sprite_simple(sprite_index, 0, x, y, { angle : orientation });
}

initialize_state(stateActive);
#endregion

#region DEBUG
#endregion