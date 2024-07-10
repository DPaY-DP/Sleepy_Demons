//immutable values
spd = 5;



//game values
inRoom = instance_place(x, y, obj_room);					//must start in room !!





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
get_navmesh = function(_idInRoom, _idTargetRoom)
{
	var _iterations = 0;
	
	var _navMesh = [];
	
	var _arrayDoors = array_create(global.countRooms, array_create(0, 0));
	_arrayDoors[_iterations] = _idInRoom.doors;
	
	var _roomsVisited = array_create(global.countRooms, 0);
	_roomsVisited[_idInRoom.number] = true;
		
	do
	{		
		var _currentDoor = array_shift(_arrayDoors[_iterations]);
		var _currentRoom = _currentDoor.toRoom;
		
		array_push(_navMesh, _currentDoor.entrypoint);
		array_push(_navMesh, _currentDoor.exitpoint);
		array_push(_navMesh, _currentRoom.points[0]);
		
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
		}
	}
	until(false)
}

	//Limitation:
	//this implementation does NOT check for length of the way, just takes the first route it finds.


//state machine
setup_state_machine();

stateSeek = new State();
stateSeek.start = function()
{
	//select env object
	if (!instance_exists(obj_env)) 
	{
		switch_state(stateRandomWalk);
		exit;
	}
	
	var _envSeek = instance_find(obj_env, irandom(instance_number(obj_env) - 1));
	var _room = _envSeek.room;
	
	navmesh = get_nav(_room);
	if (navmesh == false) switch_state(stateRandomWalk);
}
stateSeek.run = function()
{
	//iterative navigation towards room
	
	//if in room, switch state to sabotage
}

stateRandomWalk = new State();
stateRandomWalk.start = function()
{
	navpoint = undefined;
	if (instance_number(obj_room) > 1)
	{
		var _roomSeek = instance_find(obj_room, irandom(instance_number(obj_room) - 1));
		
		navmesh = get_nav(_roomSeek);
		if (navmesh != false) exit;
	}
	
	var _inRoom = instance_place(x, y, obj_room);
	if (_inRoom != undefined) inRoom = _inRoom;
	
	navpoint = array_choose(inRoom.points);
}
stateRandomWalk.run = function()
{
	if (navpoint == undefined)
	{
		//go to that point
		
		//if close enough, initialize_state(stateRandomWalk)
		exit;
	}
	
	//approach point
	
	//if close to point, approach next point
	
	//if close to final point, check for env objects again
	//if true, switch_state(stateSeek)
	//if true, switch_state(stateRandomWalk)
}

alarm[0] = 5;