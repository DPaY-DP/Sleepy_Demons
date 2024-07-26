#region IMMUTABLE VALUES

//global values
distanceWaypoint = 40;
distanceUnstuck = 10;

intervalUnstuck = 10;
iterationsUnstuck = 0;

myHitbox = instance_create_depth(x, y, depth, obj_enemyHitbox, { owner : id });
#endregion


#region GAME VALUES
inRoom = instance_place(x, y, obj_room);					//must start in room !!

hvel = 0;
vvel = 0;

target = undefined;
inSaboPosition = false;

targeted = false;

xLast = x;
yLast = y;
lastPoint = undefined;

timerUnstuck = 0;

hitCombo = { burstId : undefined, hits : 0 };
#endregion



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


#region CONSTRUCTORS
#endregion


#region METHODS
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
			
			if (_loop == 1000) if (global.debugmode) show_message($"X-collision loop overflow!\n\nPablo {id} in room {inRoom.number}\n x: {x}, y: {y}, hvel : {hvel}");
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
			
			if (_loop == 1000) if (global.debugmode) show_message($"Y-collision loop overflow!\n\nPablo {id} in room {inRoom.number}\n x: {x}, y: {y}, vvel : {vvel}");
		}
	
		if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
		vvel = 0;
	}
	
	array_push(_return, x);
	array_push(_return, y);
	
	return _return
}

get_navmesh = function(_idInRoom, _idTargetRoom)
{
	//show_debug_message($"\n\n	##########\n	Beginning navmesh calculations\n	##########\n\n	From room {_idInRoom.number} to room {_idTargetRoom.number}\n\n");
	
	if (_idInRoom == _idTargetRoom) return [_idInRoom.centerpoint];
	
	var _checked = array_create(global.countRooms, false);
	_checked[_idInRoom.number] = true;
	
	//establish routes array by taking all doors of first room
	var _routes = [];
	var _lengthDoorsStartRoom = array_length(_idInRoom.doors);
	for (var i = 0; i < _lengthDoorsStartRoom; i++)
	{
		var _door = _idInRoom.doors[i];
		if (!_door.object.sabotaged) array_push(_routes, [_door.entrypoint, _door.exitpoint, _door.toRoom]);
	}
	
	var _whilesafe = 0;
	while (true)
	{
		//iterate through routes
		var _forsafe = 0;
		var _lengthRoutes = array_length(_routes);
		
		//show_debug_message($"\nall routes:											{_routes}")
		for (var dbg = 0; dbg < _lengthRoutes; dbg++)
		{
			//show_debug_message($"	{_routes[dbg]}; room #{array_last(_routes[dbg]).number}")
		}
		
		for (var i = 0; i < _lengthRoutes; i++)
		{
			//get current route; current room and doors
			var _currentRoute = _routes[i];
			//show_debug_message($"\nloop {i}, currentRoute: {_currentRoute}");
			var _currentRoom = array_pop(_currentRoute);
			//show_debug_message($"currentRoom: {_currentRoom}");
			
			if (_currentRoom == _idTargetRoom)
			{
				//show_debug_message("Found it!");
				return _currentRoute
			}
			
			var _currentDoors = _currentRoom.doors;
			//show_debug_message($"currentDoors: {_currentDoors}");
			
			_checked[_currentRoom.number] = true;
			
			var _deadEnd = true;
			var _modifyRoute = true;
			//iterate through connected rooms of current route room
			var _lengthDoorsCurrentRoom = array_length(_currentDoors);
			for (var l = 0; l < _lengthDoorsCurrentRoom; l++)
			{
				//get current door and corresponding room
				var _currentDoor = _currentDoors[l];
				var _idToRoom = _currentDoor.toRoom;
				
				//show_debug_message($"\nChecking if room has been travelled to: {_checked} for room {_idToRoom.number}");
				
				if	(_currentDoor.object.sabotaged) ||
					(_checked[_idToRoom.number]) 
				{
					//show_debug_message($"		Has been travelled, looping"); 
					continue;
				}
				
				var _copyRoute = ds_clone(_currentRoute);
				array_push(_copyRoute, _currentDoor.entrypoint);
				array_push(_copyRoute, _currentDoor.exitpoint);
				array_push(_copyRoute, _idToRoom);
					
				if (_modifyRoute) 
				{
					_routes[i] = _copyRoute;
					_modifyRoute = true;
					
					//show_debug_message($"		Appended Route: {_copyRoute}")
				}
				else 
				{
					array_push(_routes, _copyRoute);
					//show_debug_message($"		Pushed new Route: {_copyRoute}")
				}
				
				if (_idToRoom == _idTargetRoom)
				{
					array_pop(_routes[i]);
					return _routes[i]
				}
				
				_deadEnd = false;
			}
			
			if (_deadEnd) 
			{
				//show_debug_message("		Dead End Detected")
				//show_debug_message($"\n			DELETING FROM ARRAY _routes:\n		Before: {_routes}");
				array_delete(_routes, i, 1);
				_lengthRoutes--;
				i--;
				//show_debug_message($"		After: {_routes}");
			}
			
			_forsafe++;
			if (_forsafe > 100)
			{
				//show_message("overflow FOR");
				break;
			}
		}
		
		_whilesafe++;
		if (_whilesafe > 100)
		{
			//show_message("overflow WHILE");
			break;
		}
	}
}

walk_navmesh = function(_dist)
{
	//show_debug_message($"\n		walking navmesh: {navmesh}")
	
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
					
					//lastPoint = undefined;
					if (global.debugmode) show_message($"Pablo {id} in room {inRoom.number}\nNavigating back to previous waypoint:\n{lastPoint}");
				}
				else 
				{
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
					if (global.debugmode) show_message($"Pablo {id} in room {inRoom.number}\ntrying to navigate to a fallback point that is not defined");
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

#endregion


#region STATE MACHINE
setup_state_machine();

statePlaying = new State("Playing");
statePlaying.start = function()
{
		//lower initial playing time that others
	timerPlaying = 10 * 60;
	timerPlaying += irandom(300);
	timerReady = 3 * 60;
}
statePlaying.run = function()
{
	if (timerPlaying > 0) timerPlaying--;
	else
	{
		if (timerReady > 0) timerReady--;
		else switch_state(stateSeek);
	}
	
	if (obj_player.inRoom == inRoom)
	{
		timerPlaying = 0;
	
		var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
		if (_distPlayer < rangePlayerFlee) switch_state(stateFlee);
	}
	
	show_debug_message($"hp = {hp}; hpLast = {hpLast}");
	
	if (hp != hpLast) switch_state(stateFlee);
}
statePlaying.stop = function()
{
}


stateWalk = new State("Walk");
stateWalk.start = function()
{
}
stateWalk.run = function()
{
	walk_navmesh(distanceWaypoint);
	
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	if (array_length(navmesh) == 0) 
	{
		switch (intent)
		{
			case "sabotage": switch_state(stateWait);
			break;
			
			case "random": switch_state(stateRandomTarget);
			break;
			
			case "recover": switch_state(stateRecover);
			break;
			
			case "instigate": switch_state(stateInstigate);
			break;
		}
	}
	
	//show_debug_message(navmesh)
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) && (intent != "recover") &&
	(obj_player.inRoom == inRoom) switch_state(stateFlee);
	
	if (hp != hpLast) switch_state(stateFlee);
	
	if (hp == 0) switch_state(stateExecute);
}
stateWalk.stop = function()
{
}


stateSeek = new State("Seek");
stateSeek.start = function()
{	
	//select env object
		//get total number of env objects
	var _number = instance_number(obj_env);
	var _envs = [];
		
		//if there are none, begin random walk
	if (_number == 0)
	{
		switch_state(stateRandomTarget);
		exit;
	}
	
		//add all env objects into an array and shuffle	
	for (var i = 0; i < _number; i++)
	{
		_envs[i] = instance_find(obj_env, i);
	}
	_envs = array_shuffle(_envs);
	
	do
	{
		//get random env object (last from shuffled array)
		var _tryEnv = array_pop(_envs);
		
		//see if it is a valid sabotage target (hp remaining)
		if	(_tryEnv.stage > 0) ||
			((_tryEnv.stage == 0) && (_tryEnv.hp < _tryEnv.hpMax))
		{
			//if valid, attempt to join
			if (_tryEnv.add_member(id)) break;
			else _tryEnv = undefined;
		}
		else _tryEnv = undefined;
	}
	until (array_length(_envs) == 0)
	
	//if no valid env objects could be found or none of them had spaces remaining,
	//begin randomwalk
	if (_tryEnv == undefined) 
	{
		switch_state(stateRandomTarget);
		exit;
	}
	
	target = _tryEnv;
	
	navmesh = get_navmesh(inRoom, target.inRoom);
	if (array_length(navmesh) == 0) switch_state(stateRandomTarget);
	else 
	{
		intent = "sabotage";
		switch_state(stateWalk);
	}
}


stateRandomTarget = new State("RandomTarget");
stateRandomTarget.start = function()
{	
	if (target != undefined) 
	{
		if (target.object_index == obj_env) target.void_member(id);
		else if (target.object_index == OBJ_enemy) target.targeted = false;
		
		target = undefined;
	}
	
	if (instance_number(obj_room) > 1)
	{
		do var _roomSeek = instance_find(obj_room, irandom(instance_number(obj_room) - 1));
		until (_roomSeek != inRoom)
		
		navmesh = get_navmesh(inRoom, _roomSeek);
	}
	
	if (array_length(navmesh) == 0) navmesh[0] = array_choose(inRoom.points);
	
	intent = "random";
	switch_state(stateWalk);
}


stateFlee = new State("Flee");
stateFlee.start = function()
{
	if (target != undefined) 
	{
		if (target.object_index == obj_env) target.void_member(id);
		else if (target.object_index == OBJ_enemy) target.targeted = false;
		
		target = undefined;
	}
	
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


stateWait = new State("Wait");
stateWait.start = function()
{
	
}
stateWait.run = function()
{
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	var _dist = point_distance(x, y, target.pointMeet.x, target.pointMeet.y);
	
	movement_and_navigation(target.pointMeet.x, target.pointMeet.y);
	
	var _length = array_length(target.members);
	var _beginSabo = true;
	
	if (_length >= target.membersSabo)
	{
		for (var i = 0; i < _length; i++)
		{
			if (target.members[i].inRoom != inRoom)
			{
				_beginSabo = false;
				break;
			}
		}
	}
	else _beginSabo = false;
	
	if (_beginSabo) switch_state(stateSabotage);
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) &&
	(obj_player.inRoom == inRoom) switch_state(stateFlee);
	
	if (hp != hpLast) switch_state(stateFlee);
	
	if (hp == 0) switch_state(stateExecute);
}
stateWait.stop = function()
{
}


stateSabotage = new State("Sabotage");
stateSabotage.start = function()
{
	timerCackle = intervalCackle;
	
	pointSabo = target.get_point_sabo(id);
	inSaboPosition = false;
}
stateSabotage.run = function()
{
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	var _dist = point_distance(x, y, pointSabo.x, pointSabo.y);
	if (_dist > 20) 
	{
		movement_and_navigation(pointSabo.x, pointSabo.y);
		inSaboPosition = false;
	}
	else inSaboPosition = true;
	
	if ((target.stage == 0) && (target.hp == 0))
	{
		timerCackle--;
		if (timerCackle == 0) switch_state(stateSeek);
	}
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) &&
	(obj_player.inRoom == inRoom) switch_state(stateFlee);

	if (hp != hpLast) switch_state(stateFlee);
	
	if (hp == 0) switch_state(stateExecute);
}
stateSabotage.stop = function()
{
	inSaboPosition = false;
	
	target.void_member(id);
	target = undefined;
}

stateRecover = new State("Recover");
stateRecover.start = function()
{
	timerRecover = intervalRecoverFlee;
}
stateRecover.run = function()
{	
	timerRecover--;
	if (timerRecover <= 0) switch_state(stateSeek);

	if (inRoom == obj_player.inRoom) switch_state(stateFlee);
	
	if (hp != hpLast) switch_state(stateFlee);
	
	if (hp == 0) switch_state(stateExecute);
}
stateRecover.stop = function()
{
}


stateExecute = new State("Execute");
stateExecute.start = function()
{
	if (target != undefined) 
	{
		if (target.object_index == obj_env) target.void_member(id);
		else if (target.object_index == OBJ_enemy) target.targeted = false;
		
		target = undefined;
	}
	
	timerRecover = intervalRecoverExecute;
}
stateExecute.run = function()
{	
	if (!instance_exists(obj_managerMinigame)) timerRecover--;		//this is a poor implementation, as it keeps ALL downed enemies from running
																	//while a minigame is taking place.
	if (timerRecover <= 0) 
	{
		hp = hpMax / 2;
		switch_state(stateSeek);
	}

	if	(point_distance(x, y, obj_player.x, obj_player.y) < rangeExecute) &&
	(obj_player.inRoom == inRoom)
	{
		if (keyboard_check_pressed(ord("F"))) && (!instance_exists(obj_managerMinigame))
		{
			instance_create_layer(x, y, "Overlay", obj_managerMinigame, { enemy : id, game : "finisher" });
		}
	}
}
stateExecute.draw = function()
{
	if	(point_distance(x, y, obj_player.x, obj_player.y) < rangeExecute) &&
		(obj_player.inRoom == inRoom)
	{
		if (!instance_exists(obj_managerMinigame)) draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
	}
}
stateExecute.stop = function()
{
}


stateSleep = new State("Sleep");
stateSleep.start = function()
{
	instance_create_depth(x, y, depth, obj_enemySleeping, { sprite_index : asset_get_index("spr_" + name + "Sleep") } );
	instance_destroy();
}

stateLock = new State();

alarm[0] = 2;
#endregion