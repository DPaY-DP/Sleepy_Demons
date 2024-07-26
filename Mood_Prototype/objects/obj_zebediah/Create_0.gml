event_inherited();

//unique values
name = "zebediah";

acc = 0.65;
velMax = 6;
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



stateSeek.start = function()
{	
	//before sabotaging objects, attempt to instigate other demons
		//get other demons
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
		
		intent = "instigate";
		switch_state(stateWalk);
		
		exit;
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
	
	var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
	if (_distPlayer < rangePlayerFlee) &&
	(obj_player.inRoom == inRoom) switch_state(stateFlee);
}
stateInstigate.stop = function()
{	
	target.targeted = false;
	target = undefined;
}