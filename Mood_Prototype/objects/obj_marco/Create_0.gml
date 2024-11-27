event_inherited();

//unique values
name = "marco";

accDefault = 0.8;
accSlowed = 0.45;
velMaxWalkDefault = 12;
velMaxPhys = 60;
velMaxSlowed = 3.5;

acc = accDefault;
velMaxWalk = velMaxWalkDefault;
fric = 0.9;

hpMax = 18;

hp = hpMax;
hpLast = hpMax;

envDamage = 0.05;

rangeExecute = 80;
rangePlayerFlee = 120;

intervalCackle = 300;
intervalRecoverFlee = 60;
intervalRecoverExecute = 300;

intervalInstigate = 180;

limitSlowness = 10;
payoffSlowness = 300;

//unique methods
reset_membership = function()
{
	if (target != undefined) 
	{
		if (object_is_ancestor(target.object_index, OBJ_env)) target.void_member(id);
		else if (object_is_ancestor(target.object_index, OBJ_enemy)) target.targeted = false;
		
		target = undefined;
	}
}

//unique states
//before sabotaging objects, attempt to instigate other demons
		//get other demons
statePlaying.start = function()
{
		//lower initial playing time that others
	timerPlaying = 0;
	//timerPlaying += irandom(300);
	timerReady = 3 * 60;
}


stateSeek.start = function()
{	
	reset_membership();
	
	if (instance_exists(gummybear))
	{
		navmesh = get_navmesh(inRoom, gummybear.inRoom);
		if (array_length(navmesh) == 0) switch_state(stateRandomTarget);
		
		intent = "gummybear";
		switch_state(stateWalk);
		
		exit;
	}
	
	
	//Instigate
	var _number = instance_number(OBJ_enemy);
	var _enemies = [];
	
	for (var i = 0; i < _number; i++)
	{
		 var _enemy = instance_find(OBJ_enemy, i);
		 if (_enemy.name == name) continue;
		 if (_enemy.state.name != "Playing") continue;
		 if (_enemy.targeted) continue;
		 
		 var _dist = point_distance(x, y, _enemy.x, _enemy.y);
		 
		 var _added = false;
		 
		 var _length = array_length(_enemies);
		 for (var l = 0; l < _length; l++)
		 {
			 if (_dist < _enemies[l][1])
			 {
				array_insert(_enemies, l, [_enemy, _dist]);
				
				_added = true;
			 }
		 }
		 
		 if (!_added) array_push(_enemies, [_enemy, _dist]);
	}
	
	if (array_length(_enemies) > 0)
	{
		target = _enemies[0][0];
		target.targeted = true;
		navmesh = get_navmesh(inRoom, target.inRoom);
		show_debug_message($"Zebediah: {inRoom.number}, {target.name}, {target.inRoom.number}, {navmesh}")
		
		intent = "instigate";
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
		show_debug_message($"{name} looking for sabotage target:\nPOIs: {array_length(_tryEnv.POIs)}; broken: {_tryEnv.broken}")
		
		//if (array_length(_tryEnv.POIs) != 0)	show_debug_message("1")
		//if (!_tryEnv.broken)					show_debug_message("2")
		
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


stateInstigate = new State("Instigate");
stateInstigate.start = function()
{
	timerInstigate = intervalInstigate;
	
	done = false;
}
stateInstigate.run = function()
{
	var _updateRoom = instance_place(x, y, obj_room);
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	if (!done)
	{
		var _dist = point_distance(x, y, target.x, target.y);
		if (_dist > 20) 
		{
			movement_and_navigation(target.x, target.y);
		}
		else
		{
			if (timerInstigate > 0) timerInstigate--;
			else 
			{
				target.timerPlaying = 0;
				
				timerCatchBreath = target.timerReady + 30;
				done = true;
			}
		}
	}
	else
	{
		if (timerCatchBreath > 0) timerCatchBreath--;
		else switch_state(stateSeek);
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
}
stateInstigate.stop = function()
{	
	target.targeted = false;
	target = undefined;
}