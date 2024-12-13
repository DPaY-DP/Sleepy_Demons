#region IMMUTABLE VALUES
distanceWaypoint = 40;
distanceUnstuck = 10;

intervalUnstuck = 10;
iterationsUnstuck = 0;

fleeFromPlayer = true;

damageBase = 0.04;

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

navmesh = [];


enum enumMovementMods
{
	GLUETRAP = 0,
	MINIYUM  = 1,
	
	GUENTHER_RUSH = 5,
}


movementMods = [
		//Slow: Gluetrap
	{
		strength : 0,
		timer : 0,
		active : 0,
	},
		//Slow: Miniyum
	{
		strength : 0,
		timer : 0,
		active : 0,
	},
];

buildupSlowness = 0;

sleepSounds = [snd_sleepyDemon01,snd_sleepyDemon02,snd_sleepyDemon03,snd_sleepyDemon04]; //LUIZSOUND Array for sleep sounds
idleSounds = [snd_demonChatter01, snd_demonChatter02, snd_demonChatter03, snd_demonChatter04, snd_demonChatter05, snd_demonChatter06, snd_demonChatter07, snd_demonChatter08, snd_demonChatter09, snd_demonChatter10]; //LUIZSOUND Array for idle Chatter
idleTimer = random_range(10*room_speed,30*room_speed);

gummybear = noone;
#endregion


#region CONSTRUCTORS
#endregion


#region METHODS
draw_hpbar = function(_size)
{
	var _width = 48 * 1 + (_size - 1) / 2;
	var _height = 6 * _size;

	var _widthReal = _width * (hp / hpMax);

	var _xBar = x - _width / 2;
	var _yBar = y + 12;

	draw_set_color(c_dkgray);
	draw_rectangle(_xBar, _yBar, _xBar + _width, _yBar + _height, false);
	draw_set_color(c_red);
	if (_widthReal) draw_rectangle(_xBar, _yBar, _xBar + _widthReal, _yBar + _height, false);
	draw_set_color(c_white);
}

apply_physics = function(_hacc, _vacc)
{	
	//apply accelleration
		//if there is an accellerative force exalted by the player...
	var _velMaxWalk = velMaxWalk;		

	var _length = array_length(movementMods);
	for (var i = 0; i < _length; i++)
	{
		var _effect = movementMods[i];
		if (is_struct(_effect))
		if (_effect.active)
		{
			_hacc *= (1 + _effect.strength / 10);
			_vacc *= (1 + _effect.strength / 10);
			
			if (_effect.strength > 0) _velMaxWalk *= (1 + _effect.strength / 2);
			else					  _velMaxWalk *= (10 / (10 - _effect.strength / 2));
			
			_effect.timer--;
			if (_effect.timer == 0) 
			{
				_effect.active = 0;
				_effect.strength = 0;
			}
		}
	}
	
	if (_hacc != 0)
	{
		if (sign(_hacc) == 1)
		{
			if (hvel + _hacc < _velMaxWalk) hvel += _hacc;
		}
	
		if (sign(_hacc) == -1) 
		{
			if (hvel + _hacc > - _velMaxWalk) hvel += _hacc;
		}
	}

	if (_vacc != 0)
	{
		if (sign(_vacc) == 1)
		{
			if (vvel + _vacc < _velMaxWalk) vvel += _vacc;
		}
	
		if (sign(_vacc) == -1) 
		{
			if (vvel + _vacc > - _velMaxWalk) vvel += _vacc;
		}
	}
	
	hvel = clamp(hvel, -velMaxPhys, velMaxPhys);
	vvel = clamp(vvel, -velMaxPhys, velMaxPhys);
	
	hvel *= fric;
	vvel *= fric;
	

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
			_loop++;
			
			if (_loop == 1000) if (global.debugmode) show_message($"Y-collision loop overflow!\n\nPablo {id} in room {inRoom.number}\n x: {x}, y: {y}, vvel : {vvel}");
		}
	
		if (_doEffect) do_effect_dust(x, y + sign(vvel) * sprite_height / 2);
	
		vvel = 0;
	}
}

movement_and_navigation = function(_xTo, _yTo)
{	
	var _dir = undefined;
		
	var _goaldir = point_direction(x, y, _xTo, _yTo);
	if (hvel != 0) || (vvel != 0) 
	{
		var _movedir = point_direction(0, 0, hvel, vvel);
		if(!audio_is_playing(snd_stepsDemon))
		{
			audio_play_sound_at(snd_stepsDemon, x, y, 0, 100, 150, 1, 0, 0, gainSFX, 0, 1 + random_range(-.2, .2));		//LUIZSOUND
		}

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
	}
	else 
	{
		_dir = _goaldir;
		drawArrow = false;
		audio_stop_sound(snd_stepsDemon);	//LUIZSOUND
	}
	
	
	var _return = [x, y];
	
	var _hacc = lengthdir_x(acc, _dir);
	var _vacc = lengthdir_y(acc, _dir);
	
	apply_physics(_hacc, _vacc);
	
	array_push(_return, x);
	array_push(_return, y);
	
	return _return
}

get_navmesh = function(_idInRoom, _idTargetRoom)
{
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
	
			//FLAW:
			//Currently we are not checking ALL of of the routes for instant completion, but only each per iteration
			//This means that if route[1] is an instant completion, but route[0] finds a completion after 1 step, it will
			//prefer and return route[0] as solution, because it never got to check route[1] in the first place
			//
			//PROPOSED FIX:
			//Add 1 for statement before this while loop checking the ends of all proposed routes before going into the
			//pathfinding algorithm
	
	var _lengthRoutes = array_length(_routes);
	for (var i = 0; i < _lengthRoutes; i++)
	{			
		//get current route; current room and doors
		var _currentRoute = _routes[i];
		var _currentRoom = array_last(_currentRoute);
			
			//is checked room target room?
		if (_currentRoom == _idTargetRoom)
		{
			array_pop(_currentRoute)
			return _currentRoute
		}
	}
	
	
	var _whilesafe = 0;
	while (true)
	{
		//iterate through routes
		var _forsafe = 0;
		var _lengthRoutes = array_length(_routes);
		
		for (var i = 0; i < _lengthRoutes; i++)
		{			
			//get current route; current room and doors
			var _currentRoute = _routes[i];
			var _currentRoom = array_pop(_currentRoute);
			
				//is checked room target room?
			if (_currentRoom == _idTargetRoom)
			{
				return _currentRoute
			}
			
				//if not
				//get doors of current room
			var _currentDoors = _currentRoom.doors;
			
				//var _debugCurrentDoors = [];
				//var _lengthDoorsCurrentRoom = array_length(_currentDoors);
				//for (var l = 0; l < _lengthDoorsCurrentRoom; l++)
				//{
				//	array_push(_debugCurrentDoors, _currentDoors[l].toRoom.number);
				//}
			
			_checked[_currentRoom.number] = true;
			
			var _deadEnd = true;
			var _modifyRoute = true;		//boolean meant to check whether we want to modify the current route or create a new one
			
			//iterate through connected rooms of current route room
			var _lengthDoorsCurrentRoom = array_length(_currentDoors);
			for (var l = 0; l < _lengthDoorsCurrentRoom; l++)
			{
				//get current door and corresponding room
				var _currentDoor = _currentDoors[l];
				var _idToRoom = _currentDoor.toRoom;
				
				if	(_currentDoor.object.sabotaged) ||
					(_checked[_idToRoom.number]) 
				{
					continue;
				}
				
				var _copyRoute = ds_clone(_currentRoute);
				array_push(_copyRoute, _currentDoor.entrypoint);
				array_push(_copyRoute, _currentDoor.exitpoint);
				array_push(_copyRoute, _idToRoom);
					
				if (_modifyRoute)			//if true - modify current route
											//if false - create a new route instead
				{
					_routes[i] = _copyRoute;
					_modifyRoute = false;
					
					var _checkRoute = _routes[i];
				
						//if (_idToRoom == _idTargetRoom)
						//{
						//	array_pop(_routes[i]);
						//	return _routes[i];
						//}
				}
				else 
				{
					array_push(_routes, _copyRoute);
					
					var _checkRoute = _routes[array_length(_routes) - 1];
					
						//if (_idToRoom == _idTargetRoom)
						//{
						//	array_pop(_routes[array_length(_routes) - 1]);
						//	return _routes[array_length(_routes) - 1];
						//}
				}
				
				if (_idToRoom == _idTargetRoom)
				{					
					array_pop(_checkRoute);
					return _checkRoute;
				}
				
				_deadEnd = false;
			}
			
			if (_deadEnd) 
			{
				array_delete(_routes, i, 1);
				_lengthRoutes--;
				i--;
			}
			
			_forsafe++;
			if (_forsafe > 100)
			{
				break;
			}
		}
		
		_whilesafe++;
		if (_whilesafe > 100)
		{
			break;
		}
	}
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
	var _yIterate = _yDist / _iterations;
	
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
				}
				else 
				{
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
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

reset_membership = function()
{
	if (target != undefined) 
	if (object_is_ancestor(target.object_index, OBJ_env)) target.void_member(id);
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
	apply_physics(0, 0);
	
	if (timerPlaying > 0) timerPlaying--;
	else
	{
		if (timerReady > 0) timerReady--;
		else switch_state(stateSeek);
	}
	
	var _scare = noone;
	
	if (obj_player.inRoom == inRoom)
	{
		timerPlaying = 0;
	
		var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
		if (_distPlayer < rangePlayerFlee) _scare = obj_player;
	}
	
	if (instance_exists(obj_projectileStinkbomb))
	{
		var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
			
		var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
		if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
	}
	
	if (hp != hpLast) _scare = obj_player;
	
	if (_scare != noone) switch_state(stateFlee, _scare);
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
			
			case "gummybear": switch_state(stateGummybear);
			break;
		}
	}
	
	var _scare = noone;
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (obj_player.inRoom == inRoom) && (_distPlayer < rangePlayerFlee) && (intent != "recover")
	{
		_scare = obj_player;
	}
	
	if (instance_exists(obj_projectileStinkbomb))
	{
		var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
			
		var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
		if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
	}
	
	if (hp != hpLast) _scare = obj_player;
	
	if (_scare != noone) switch_state(stateFlee, _scare);
	
	if (hp == 0) switch_state(stateExecute);
}
stateWalk.stop = function()
{
}


stateSeek = new State("Seek");
stateSeek.start = function()
{	
	reset_membership();
	
	if (instance_exists(gummybear))
	{
		show_debug_message($"room info: room: {inRoom}, gummyRoom: {gummybear.inRoom}");
		navmesh = get_navmesh(inRoom, gummybear.inRoom);
		//if (array_length(navmesh) == 0) switch_state(stateRandomTarget);
		show_debug_message($"navmesh: {navmesh}");
		
		
		intent = "gummybear";
		switch_state(stateWalk);
		
		exit;
	}
	
	//select env object
		//get total number of env objects
	var _number = instance_number(OBJ_env);
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
		_envs[i] = instance_find(OBJ_env, i);
	}
	_envs = array_shuffle(_envs);
	
	do
	{
		//get random env object (last from shuffled array)
		var _tryEnv = array_pop(_envs);
		
		//see if it is a valid sabotage target (hp remaining)		
		if (array_length(_tryEnv.POIs) != 0) && (!_tryEnv.broken)
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
	reset_membership();
	
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
stateFlee.start = function(_scareId)
{
	reset_membership();
	
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
			
			if (_door.object.sabotaged) continue;
			
			var _distMe = point_distance(x, y, _door.object.x, _door.object.y);
			var _distPlayer = point_distance(_scareId.x, _scareId.y, _door.object.x, _door.object.y);
			
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
	timerWait = 600;
}
stateWait.run = function()
{
	apply_physics(0, 0);
	
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
	
		//flee?
	var _scare = noone;
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (obj_player.inRoom == inRoom) && (_distPlayer < rangePlayerFlee)
	{
		_scare = obj_player;
	}
	if (instance_exists(obj_projectileStinkbomb))
	{
		var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
			
		var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
		if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
	}
	if (hp != hpLast) _scare = obj_player;
	if (_scare != noone) switch_state(stateFlee, _scare);
	
		//move on?
	if (timerWait > 0) timerWait--;
	else switch_state(stateSeek);
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
	apply_physics(0, 0);
	
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	var _dist = point_distance(x, y, pointSabo.x, pointSabo.y);
	if (_dist > 20) 
	{
		movement_and_navigation(pointSabo.x, pointSabo.y);
		inSaboPosition = false;
	}
	else inSaboPosition = true;
	
	if (array_length(target.POIs) == 0)
	{
		timerCackle--;
		if (timerCackle == 0) switch_state(stateSeek);
	}
	
	
	
	var _scare = noone;
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (obj_player.inRoom == inRoom) && (_distPlayer < rangePlayerFlee)
	{
		_scare = obj_player;
	}
	
	if (instance_exists(obj_projectileStinkbomb))
	{
		var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
			
		var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
		if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
	}
	
	if (hp != hpLast) _scare = obj_player;
	
	if (_scare != noone) switch_state(stateFlee, _scare);
	
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
	apply_physics(0, 0);
	
	timerRecover--;
	if (timerRecover <= 0) switch_state(stateSeek);
	
	
	
	var _scare = noone;
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (obj_player.inRoom == inRoom) && (_distPlayer < rangePlayerFlee)
	{
		_scare = obj_player;
	}
	
	if (instance_exists(obj_projectileStinkbomb))
	{
		var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
			
		var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
		if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
	}
	
	if (hp != hpLast) _scare = obj_player;
	
	if (_scare != noone) switch_state(stateFlee, _scare);
	
	
	
	if (hp == 0) switch_state(stateExecute);
}
stateRecover.stop = function()
{
}


stateGummybear = new State("Gummybear");
stateGummybear.start = function()
{
}
stateGummybear.run = function()
{
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;

	if (instance_exists(gummybear)) movement_and_navigation(gummybear.x, gummybear.y);
	else 
	{
		gummybear = noone;
		switch_state(stateSeek);
	}
}
stateGummybear.stop = function()
{	
	
}


stateExecute = new State("Execute");
stateExecute.start = function()
{
	reset_membership();
	
	timerRecover = intervalRecoverExecute;
	
	image_speed = 0;
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
	
	var _lineCheck = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);
	//show_debug_message(_lineCheck)
	if	(point_distance(x, y, obj_player.x, obj_player.y) < rangeExecute) && (_lineCheck == noone)	
	{
		if (keyExecute) && (!instance_exists(obj_managerMinigame))
		{
			//show_debug_message("keyExecute pressed")
			instance_create_layer(x, y, "Overlay", obj_managerMinigame, { enemy : id });
		}
	}
}
stateExecute.draw = function()
{
	var _lineCheck = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);
	if	(point_distance(x, y, obj_player.x, obj_player.y) < rangeExecute) && (_lineCheck == noone)
	{
		if (!instance_exists(obj_managerMinigame)) draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
	}
}
stateExecute.stop = function()
{
	image_speed = 1;
}


stateSleep = new State("Sleep");
stateSleep.start = function()
{
	audio_play_sound_at(array_get(sleepSounds, random_range(0,array_length(sleepSounds))), x, y, 0, 100, 150, 1, 0, false, gainSFX);
	instance_create_layer(x, y, "Glue", obj_enemySleeping, { sprite_index : asset_get_index("spr_" + name + "Sleep"), image_alpha : 0.75 } );
	
	var _shufflebag = obj_loadout.reload();
	
	if (_shufflebag != undefined) 
	{
		var _image = 0;
		switch (obj_loadout.weaponsEquipped[_shufflebag[0]].object_index)
		{
			case obj_weaponGluelauncher:	_image = 0;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponBlackhole:		_image = 1;
											get_size = function() { return 2 }
			break;							
											
			case obj_weaponMiniyum:			_image = 2;
											get_size = function() { return 0.6 + random(0.4) }
			break;							
											
			case obj_weaponGummybear:		_image = 3;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponStinkbomb:		_image = 4;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponCatchmines:		_image = 5;
											get_size = function() { return 2 }
			break;
			
		}
		
		repeat (min(_shufflebag[1], 8)) 
		{
			instance_create_depth(x, y, depth, obj_ammoAnim, { size : get_size(), image_index : _image });
		}
	}
	
	instance_destroy(myHitbox);
	instance_destroy();
}

stateLock = new State("Lock");

initialize_state(statePlaying);
#endregion