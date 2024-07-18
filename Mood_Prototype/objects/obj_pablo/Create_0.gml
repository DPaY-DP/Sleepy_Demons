//immutable values
	//movement
acc = 0.5;
hvel = 0;
vvel = 0;
velMax = 5;

fric = 0.9;

distanceWaypoint = 40;

lastPoint = undefined;

timerUnstuck = 0;
intervalUnstuck = 10;
iterationsUnstuck = 0;

distanceUnstuck = 10;

xLast = x;
yLast = y;

distSabotage = 32;
envDamage = 1;



//game values
inRoom = instance_place(x, y, obj_room);					//must start in room !!


rangePlayerFlee = 120;


//spaghetti code
	//prowler
hit = 0;

	//slow / stun
spdNormal = 4;
spdSlowed = spdNormal * 0.5;

slowed = false;
intervalSlowed = 80;
timerSlowed = intervalSlowed;
slowedStarAlpha = 1;
slowedStarFrame = 0;

get_slowed = function(_length)
{
	slowed = true;
	timerSlowed = _length;
}

	//extendo net
caught = undefined;




//methods
movement_and_navigation = function(_xTo, _yTo)
{
	var _dir = undefined;
		
	var _goaldir = point_direction(x, y, _xTo, _yTo);
	if (hvel != 0) || (vvel != 0) 
	{
		var _movedir = point_direction(0, 0, hvel, vvel);
		
		if (abs(_goaldir - _movedir) > 180)
		{
			if (_goaldir > _movedir) _goaldir -= 360;
			else _movedir -= 360;
		}
		
		if (abs(_goaldir - _movedir) > 50) 
		{
			_dir = _goaldir;
			
			drawArrow = false;
		}
		else if (_goaldir > _movedir)
		{
			_dir = _goaldir + (_goaldir - _movedir) * 2;
	
			drawArrow = 
			{
				goal : _goaldir,
				move : _movedir,
				target : _dir,
			}
		}
		else _dir = _movedir - (_movedir - _goaldir) * 2;
		
		//show_debug_message($"\nframe: {global.debugtimer}\ngoaldir = {_goaldir}\nmovedir = {_movedir}\ntargetdir = {_dir}");
	}
	else 
	{
		_dir = _goaldir;
		drawArrow = false;
	}
	
	
	var _return = [x, y];
		
	var _hacc = lengthdir_x(acc, _dir);
	var _vacc = lengthdir_y(acc, _dir);
	
	//apply accelleration
		//if there is an accellerative force exalted by the player...
	if (_hacc != 0)
	{
			//if the current velocity of the player is outside the maximum range, 
			//don't apply the accelleration and
			//apply friction
		if (!in_range(hvel, -velMax, velMax))
		{
			hvel *= fric;
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
	else hvel *= fric;

		//same logic as above
	if (_vacc != 0)
	{
		if (!in_range(vvel, -velMax, velMax))
		{
			vvel *= fric;
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
	else vvel *= fric;

	////collision
	if (!place_meeting(x + hvel, y, obj_wall)) 
	{
		x += round(hvel);
	}
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
		
			//show_debug_message($"hvel: {hvel}")
			//show_debug_message($"Resolving collision, loop {_loop}, x = {x}");
			_loop++;
			
			if (_loop == 1000) show_message($"loop overflow obj_pablo, x: {x}, hvel : {hvel}");
		}
	
		if (_doEffect) do_effect_dust(x + sign(hvel) * sprite_width / 2, y);
	
		hvel = 0;
	}

	if (!place_meeting(x, y + vvel, obj_wall)) 
	{
		y += round(vvel);
	}
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
		
			//show_debug_message($"vvel: {vvel}")
			//show_debug_message($"Resolving collision, loop {_loop}, y = {y}");
			_loop++;
			
			if (_loop == 1000) show_message($"loop overflow obj_pablo, x: {x}, hvel : {hvel}");
		}
	
		if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
		vvel = 0;
	}
	
	array_push(_return, x);
	array_push(_return, y);
	
	return _return
}


get_navmesh = function(_idInRoom, _idTargetRoom)	//Limitation:
{													//this implementation does NOT check for length of the way, just takes the first route it finds.
	if (_idInRoom == _idTargetRoom) return [_idInRoom.centerpoint];
	
	var _iterations = 0;
	
	var _navMesh = [];
	
	var _arrayDoors = array_create(global.countRooms, array_create(0, 0));
	_arrayDoors[_iterations] = ds_clone(_idInRoom.doors);
	
	var _roomsVisited = array_create(global.countRooms, 0);
	_roomsVisited[_idInRoom.number] = true;
		
	do
	{		
		var _currentDoor = array_shift(_arrayDoors[_iterations]);
		var _currentRoom = _currentDoor.toRoom;
		
		array_push(_navMesh, _currentDoor.entrypoint);
		array_push(_navMesh, _currentDoor.exitpoint);
		array_push(_navMesh, _currentRoom.centerpoint);
		
		if (_currentRoom == _idTargetRoom)
		{
			array_pop(_navMesh);
			return _navMesh;
		}
		
		_roomsVisited[_currentRoom.number] = true;
		
		_iterations++;
		
		var _length = array_length(_currentRoom.doors);
		for (var i = 0; i < _length; i++)
		{
			var _door = _currentRoom.doors[i];
			
			if (_roomsVisited[_door.toRoom.number]) continue;
			array_push(_arrayDoors[_iterations], _door);
		}
		
		while (array_length(_arrayDoors[_iterations]) == 0)
		{
			repeat(3) array_pop(_navMesh);
			_iterations--;
			
			if (_iterations < 0) 
			{
				show_debug_message("get_navmesh could not find a route and has returned false.")
				return [];
			}
		}
	}
	until(false)
}

walk_navmesh = function(_dist)
{
	var _xNav = navmesh[0].x;
	var _yNav = navmesh[0].y;
	
	var _positions = movement_and_navigation(_xNav, _yNav);
	
	var _xDist = _positions[3] - _positions[1];
	var _yDist = _positions[2] - _positions[0];
	
	var _iterations = 5;
	var _xIterate = _xDist / _iterations;
	var _yIterate = _xDist / _iterations;
	
	for (var i = 0; i < _iterations; i++)
	{
		if (point_distance(x - _xIterate * i, y - _yIterate * i, _xNav, _yNav) < _dist) 
		{
			lastPoint = array_shift(navmesh);
			break;
		}
	}
	
	timerUnstuck++;
	if (timerUnstuck >= intervalUnstuck)
	{
		timerUnstuck = 0;
		if (point_distance(x, y, xLast, yLast) < distanceUnstuck)
		{
			iterationsUnstuck++;
			if (iterationsUnstuck > 2)
			{
				if (lastPoint != undefined)
				{
					array_insert(navmesh, 0, lastPoint);
					
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
					
					lastPoint = undefined;
					show_message("navigating back to previous waypoint");
				}
				else 
				{
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
					show_message("trying to navigate to a fallback point that is not defined");
				}
			}
		}
		else
		{
			xLast = x;
			yLast = y;
			
			iterationsUnstuck = 0;
		}
	}
}


update_inRoom = function()
{
	var _room = instance_place(x, y, obj_room);
	if (_room != undefined) inRoom = _room;
}


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
	
	alarm[1] = _lifeMax;
}


//state machine
setup_state_machine();

stateWalk = new State("Walk");
stateWalk.start = function()
{
}
stateWalk.run = function()
{
	walk_navmesh(distanceWaypoint);
	inRoom = instance_place(x, y, obj_room);
	
	show_debug_message(navmesh)
	
	if (array_length(navmesh) == 0) 
	{
		switch (intent)
		{
			case "sabotage": switch_state(stateSabotage);
			break;
			
			case "random": switch_state(stateRandomTarget);
			break;
			
			case "recover": switch_state(stateRecover);
			break;
		}
	}
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) && (intent != "recover") switch_state(stateFlee);
}
stateWalk.stop = function()
{
}


stateSeek = new State("Seek");
stateSeek.start = function()
{	
	//select env object
	var _number = instance_number(obj_env);
	var _envs = [];
	
	for (var i = 0; i < _number; i++)
	{
		_envs[i] = instance_find(obj_env, i);
	}
	_envs = array_shuffle(_envs);
	
	do
	{
		var _tryEnv = array_pop(_envs);
		
		if	(_tryEnv.stage < _tryEnv.stageMax) ||
			((_tryEnv.stage == _tryEnv.stageMax) && (_tryEnv.hp < _tryEnv.hpMax))
		{
			break;
		}
		else _tryEnv = undefined;
	}
	until (array_length(_envs) == 0)
	
	if (_tryEnv == undefined) 
	{
		switch_state(stateRandomTarget);
		exit;
	}
	
	envSeek = _tryEnv;
	var _room = envSeek.inRoom;
	
	navmesh = get_navmesh(inRoom, _room);
	if (array_length(navmesh) == 0) switch_state(stateRandomTarget);
	else 
	{
		intent = "sabotage";
		switch_state(stateWalk);
	}
}
stateSeek.run = function()
{
}


stateRandomTarget = new State("RandomTarget");
stateRandomTarget.start = function()
{	
	if (instance_number(obj_room) > 1)
	{
		do var _roomSeek = instance_find(obj_room, irandom(instance_number(obj_room) - 1));
		until (_roomSeek != inRoom)
		
		navmesh = get_navmesh(inRoom, _roomSeek);
	}
	
	if (array_length(navmesh) == 0) navmesh[0] = array_choose(inRoom.points);
	
	intent = "random";
	switch_state(stateWalk);
	
	show_debug_message(state.name)
}


stateFlee = new State("Flee");
stateFlee.start = function()
{
	show_debug_message($"inRoom: {inRoom}")
	
	var _doors = inRoom.doors;
	var _lengthDoors = array_length(_doors);
	
	var _doorExit = undefined;
	if (_lengthDoors == 1) _doorExit = _doors[0];
	else
	{
		var _highest = undefined;
		for (var i = 0; i < _lengthDoors; i++)
		{
			var _door = _doors[i];
			
			var _distMe = point_distance(x, y, _door.object.x, _door.object.y);
			var _distPlayer = point_distance(obj_player.x, obj_player.y, _door.object.x, _door.object.y);
			
			var _factor = _distPlayer - _distMe;
			
			if (_highest == undefined) || (_highest < _factor) 
			{
				_doorExit = _door;
				_highest = _factor;
			}
		}
	}
	
	navmesh = [_doorExit.entrypoint, _doorExit.exitpoint];
	array_push(navmesh, array_choose(_doorExit.toRoom.points));
	
	intent = "recover";
	switch_state(stateWalk);
}
stateFlee.run = function()
{
}
stateFlee.stop = function()
{
}


stateSabotage = new State("Sabotage");
stateSabotage.start = function()
{
	timerCackle = 300;
}
stateSabotage.run = function()
{
	var _dist = point_distance(x, y, envSeek.x, envSeek.y);
	
	if (_dist > distSabotage) movement_and_navigation(envSeek.x, envSeek.y);
	else
	{
		if (envSeek.stage < envSeek.stageMax) envSeek.hp -= envDamage;
		else
		{
			timerCackle--;
			if (timerCackle == 0) switch_state(stateSeek);
		}
	}
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) switch_state(stateFlee);
}
stateSabotage.stop = function()
{
}


stateRecover = new State("Recover");
stateRecover.start = function()
{
	timerRecover = 300;
}
stateRecover.run = function()
{
	timerRecover--;
	if (timerRecover <= 0) switch_state(stateSeek);
	
	inRoom = instance_place(x, y, obj_room);
	if (inRoom == obj_player.inRoom) switch_state(stateFlee);
}
stateRecover.stop = function()
{
}


alarm[0] = 2;