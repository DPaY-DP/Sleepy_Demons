//unique values
name = "guenther";

accDefault = 0.5;
accSlowed = 0.25;
velMaxWalkDefault = 10;
velMaxWalkSlowed = 4;
velMaxPhys = 60;

acc = accDefault;
velMaxWalk = velMaxWalkDefault;
fric = 0.9;

hpMax = 56;

hp = hpMax;
hpLast = hpMax;

rangeExecute = 80;

intervalSabotage = 120;
intervalRecoverFlee = 60;
intervalRecoverExecute = 300;

limitSlowness = 25;
payoffSlowness = 300;

intervalRandomWalk = 300;
timerRandomWalk = 0;

event_inherited();


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
	0, 
	0,
	0,
		//Fast: Guenther Rush
	{
		strength : 0,
		timer : 0,
		active : 0,
	},
];


//unique states
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


stateSeek.start = function()
{		
	if (instance_exists(gummybear))
	{
		navmesh = get_navmesh(inRoom, gummybear.inRoom);
		if (array_length(navmesh) > 0)
		{
			intent = "gummybear";
			switch_state(stateWalk);
		
			exit;
		}
	}
	
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
		
		//show_debug_message($"{name} looking for sabotage target:\nPOIs: {array_length(_tryEnv.POIs)}; broken: {_tryEnv.broken}")
		//if (array_length(_tryEnv.POIs) != 0)	show_debug_message("1")
		//if (!_tryEnv.broken)					show_debug_message("2")
		
		if (array_length(_tryEnv.POIs) != 0) && (!_tryEnv.broken)
		{
			target = _tryEnv;
			break;
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



stateWalk = new State("Walk");
stateWalk.start = function()
{
}
stateWalk.run = function()
{
	timerRandomWalk--;
	
	walk_navmesh(distanceWaypoint);
	
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	if (array_length(navmesh) == 0) 
	{
		switch (intent)
		{
			case "sabotage": switch_state(stateSabotage);
			break;
			
			case "random":	if (timerRandomWalk <= 0) switch_state(stateSeek);
							else switch_state(stateRandomTarget);
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

stateRecover.run = function()
{	
	apply_physics(0, 0);
	
	timerRecover--;
	if (timerRecover <= 0) switch_state(stateSeek);
	
	var _scare = noone;
	
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


stateSabotage = new State("Sabotage");
stateSabotage.start = function()
{
	timerSabotage = intervalSabotage;
	
	if (array_length(target.POIs) > 0) targetPOI = target.POIs[0];
	else switch_state(stateRandomTarget);
}
stateSabotage.run = function()
{
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	var _dist = point_distance(x, y, targetPOI.x, targetPOI.y);	
	if (_dist > 32)	movement_and_navigation(targetPOI.x, targetPOI.y);
	else
	{
		apply_physics(0, 0);
		
		if (targetPOI.applyDamage) 
		{
			initialize_state(stateSabotage);
			exit;
		}
		
		timerSabotage--;
		if (timerSabotage == 0) 
		{
			with (target) if (array_length(POIs) > 0)
			{
				var _broken = array_shift(POIs);
				_broken.applyDamage = true;
				_broken.image_speed = 1;
	
				array_push(POIsBroken, _broken);	
			}
			
			timerRandomWalk = intervalRandomWalk;
			switch_state(stateRandomTarget);
		}	
	
		var _scare = noone;
	
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
}
stateSabotage.stop = function()
{
	inSaboPosition = false;
	
	target.void_member(id);
	target = undefined;
}

initialize_state(statePlaying);