//global methods
get_waypoints = function(_roomWeights)
{
	var _waypoints = [];							//this array will hold, in order, the rooms the character needs to travel 
													//through to reach their destination. Current room is not included. Final
													//room is.
	
	if (_roomWeights[inRoom.numberRoom] != 0)		//if current room is not target room, start pathing algorithm
	{
		var _numberWaypoint = 0;
		var _checkroom = inRoom;										//this variable holds the data for the room the algorithm is currently
																		//checking. During initialization of the algorithm, that data is of the
																		//room the character is currently in
		
		var _weightCheckroom = _roomWeights[_checkroom.numberRoom];		//get the weight value (how far it is from the destination) of the room
																		//to check
																		
		var _lowest = _weightCheckroom;									//this value holds the room weight value of the current room,
																		//It will get updated to only go lower until the target room is reached.
			
		do																//go through this loop until you have reached the target room (_lowest == 0)
		{
			var _lengthConnectors = array_length(_checkroom.connectedTo);
			
			for (var i = 0; i < _lengthConnectors; i++)
			{
				var _dataConnection = _checkroom.connectedTo[i];
				var _dataConnector = _dataConnection.connector;
				
				if (!_dataConnector.sabotaged)
				{
					var _weightCheckroom = _roomWeights[_dataConnection.room.numberRoom];
					
					if (_weightCheckroom < _lowest)
					{
						_lowest = _weightCheckroom;
						_waypoints[_numberWaypoint] = _dataConnection;
						
						break;
					}
				}
			}
				
			_checkroom = _waypoints[_numberWaypoint].room;				//ERROR02: THIS LINE SOMETIMES CAUSES A 
																		//OUT OF RANGE ERROR
			_numberWaypoint++;
		}
		until (_lowest == 0)
	}

	return _waypoints
}


create_party = function()
{
	var _idParty = array_length(global.parties);
	myParty = { id : _idParty, leader : id, members : [], slots : 2, sabotageObject : undefined };
		
	amLeader = true;
		
	do																						//this finds an env object not currently being sabotaged
	{																						//then sets its beingSabo'd var to true so other groups
		var _numberEnv = instance_number(obj_env);											//cannot access it
		myParty.sabotageObject = instance_find(obj_env, irandom(_numberEnv - 1));
	}
	until (myParty.sabotageObject.beingSabotaged = false)
	myParty.sabotageObject.beingSabotaged = true;
		
	sabotageRoom = myParty.sabotageObject.inRoom;
		
	array_push(global.parties, myParty);
		
	roomWeights = sabotageRoom.get_navmesh();
	waypoints = get_waypoints(roomWeights);
}


join_party = function(_party)
{
	myParty = _party;
	amLeader = false;
	array_push(_party.members, id);
			
	myParty.slots -= slotsize;
			
	sabotageObject = myParty.sabotageObject;
	waypoints = get_waypoints(myParty.leader.roomWeights);
}


leave_party = function()
{
	if (amLeader)
	{
		if (array_length(myParty.members) == 0)					//deleted party as leader
		{
			myParty.sabotageObject.beingSabotaged = false;
			
			array_delete(global.parties, myParty.id, 1);
			
			myParty = undefined;
			amLeader = undefined;
		}
		else													//promoted member to leader
		{
			myParty.leader = myParty.members[0];
			myParty.slots -= myParty.members[0].slotsize;
			array_delete(myParty.members, 0, 1);
			
			myParty.leader.amLeader = true;
			
			myParty = undefined;
			amLeader = undefined;
		}
	}
	else														//left as member
	{
		var _lengthMembers = array_length(myParty.members);
		for (var i = 0; i < _lengthMembers; i++)
		{
			if (myParty.members[i] == id) 
			{
				array_delete(myParty.members, i, 1);
				break;
			}
		}
		
		myParty.slots -= slotsize;
		
		myParty = undefined;
		amLeader = undefined;
	}
}


//state machine
setup_state_machine();

	//default state
stateIdle = new State("Idle");
stateIdle.start = function()
{
	timerIdle = 30; //###DEBUG 500;
	
	var _roomWidth = inRoom.sprite_width;
	var _roomHeight = inRoom.sprite_height;
	
	xIdle = inRoom.x + _roomWidth * 0.2 + random(_roomWidth * 0.6);
	yIdle = inRoom.y + _roomHeight * 0.2 + random(_roomHeight * 0.6);
}
stateIdle.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	//behavior
	timerIdle--;
	
	var _dir = point_direction(x, y, xIdle, yIdle);
	var _dist = point_distance(x, y, xIdle, yIdle);
	
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
	
	image_angle = _dir;
	
	if (_dist < 10) 
	{
		var _roomWidth = inRoom.sprite_width;
		var _roomHeight = inRoom.sprite_height;
	
		xIdle = inRoom.x + _roomWidth * 0.2 + random(_roomWidth * 0.6);
		yIdle = inRoom.y + _roomHeight * 0.2 + random(_roomHeight * 0.6);
	}
	
	//breakout cases
	if (timerIdle <= 0) && (instance_exists(obj_env)) switch_state(stateSeek);
	
	if	(obj_player.inRoom == inRoom) &&
		(distance_to_object(obj_player) < rangeDetection)	switch_state(stateFlee);
	
	if (hp == hpMax) switch_state(stateExecutable);
}
stateIdle.stop = function()
{
	
}


	//group and sabotage states
stateSeek = new State("Seek");
stateSeek.start = function()
{
	//get party
	var _amountParties = array_length(global.parties);
	
	var _newparty = true;
	var _joinParty = undefined;
	for (var i = 0; i < _amountParties; i++)
	{
		var _currentParty = global.parties[i];
		
		if (_currentParty.slots >= slotsize) 
		{
			_newparty = false;
			_joinParty = _currentParty;
			break;
		}
	}
	
	if (_newparty) create_party();
	else join_party(_joinParty);
	
	setNewRoom = true;
	stage = 0;
}
stateSeek.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	
	//seeking behavior
	if (array_length(waypoints) > 0)
	{
		if (setNewRoom)
		{
			setNewRoom = false;
			
			var _dataRoom = waypoints[0];
			toRoom = _dataRoom.room;
			connector = _dataRoom.connector;
		}
	
		//flee behavior
		switch (stage)
		{
			case 0:			var _dir = point_direction(x, y, connector.xCenter, connector.yCenter);
							var _dist = point_distance(x, y, connector.xCenter, connector.yCenter);
						
							if (_dist < 10) stage++;
			break;
		
			case 1:			var _dir = point_direction(x, y, toRoom.xCenter, toRoom.yCenter);
							var _dist = point_distance(x, y, toRoom.xCenter, toRoom.yCenter);
						
							if (_dist < 10) stage++;
			break;
		}
		
		if (stage < 2)
		{
			x += lengthdir_x(spd, _dir);
			y += lengthdir_y(spd, _dir);
			
			image_angle = _dir;
		}
		else
		{
			stage = 0;
			setNewRoom = true;
			array_delete(waypoints, 0, 1);
		}
	}
	
	
	//breakout cases
	if (array_length(waypoints) == 0) switch_state(stateWaitForGroup);
	
	if	(obj_player.inRoom == inRoom) &&
		(distance_to_object(obj_player) < rangeDetection)
	{
		leave_party(myParty);
		switch_state(stateFlee);
	}
	
	if (hp == hpMax) 
	{
		leave_party(myParty);
		switch_state(stateExecutable);
	}
}
stateSeek.stop = function()
{
	
}



stateWaitForGroup = new State("Waiting");
stateWaitForGroup.start = function()
{	
	var _roomWidth = inRoom.sprite_width;
	var _roomHeight = inRoom.sprite_height;
	
	xIdle = inRoom.x + _roomWidth * 0.2 + random(_roomWidth * 0.6);
	yIdle = inRoom.y + _roomHeight * 0.2 + random(_roomHeight * 0.6);
}
stateWaitForGroup.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	//behavior	
	var _dir = point_direction(x, y, xIdle, yIdle);
	var _dist = point_distance(x, y, xIdle, yIdle);
	
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
	
	image_angle = _dir;
	
	if (_dist < 10) 
	{
		var _roomWidth = inRoom.sprite_width;
		var _roomHeight = inRoom.sprite_height;
	
		xIdle = inRoom.x + _roomWidth * 0.2 + random(_roomWidth * 0.6);
		yIdle = inRoom.y + _roomHeight * 0.2 + random(_roomHeight * 0.6);
	}
	
	//breakout cases
	if (amLeader)
	{
		var _startSabo = true;
		
		if (myParty.slots != 0) _startSabo = false;
		else
		{
			var _lengthMembers = array_length(myParty.members);
			for (var i = 0; i < _lengthMembers; i++)
			{
				if (myParty.members[i].inRoom != inRoom) _startSabo = false;
			}
		}
		
		if (_startSabo) 
		{
			for (var i = 0; i < _lengthMembers; i++)
			{
				with (myParty.members[i]) switch_state(stateSabotage);
			}
			switch_state(stateSabotage);
		}
	}
	
	if	(obj_player.inRoom == inRoom) &&
		(distance_to_object(obj_player) < rangeDetection)
	{
		leave_party(myParty);
		switch_state(stateFlee);
	}
	
	if (hp == hpMax) 
	{
		leave_party(myParty);
		switch_state(stateExecutable);
	}
}
stateWaitForGroup.stop = function()
{
	
}



stateSabotage = new State("Sabotage");
stateSabotage.start = function()
{
	xTo = myParty.sabotageObject.x;
	yTo = myParty.sabotageObject.y;
}
stateSabotage.run = function()
{	
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	//behavior
	var _dist = point_distance(x, y, xTo, yTo);
	var _dir = point_direction(x, y, xTo, yTo);
	
	if (_dist > 128)
	{
		x += lengthdir_x(spd, _dir);
		y += lengthdir_y(spd, _dir);
			
		image_angle = _dir;
	}
	else
	{
		myParty.sabotageObject.hp -= 0.04;
	}
	
	//breakout cases
	if (myParty.slots != 0) switch_state(stateWaitForGroup);
	
	if (myParty.sabotageObject.stage == myParty.sabotageObject.stageMax) 
	{
		leave_party(myParty);
		switch_state(stateCackle);
	}
	
	if	(obj_player.inRoom == inRoom) &&
		(distance_to_object(obj_player) < rangeDetection) 
		{
			leave_party(myParty);
			switch_state(stateFlee);
		}	
		
	if (hp == hpMax) 
	{
		leave_party(myParty);
		switch_state(stateExecutable);
	}
}
stateSabotage.stop = function()
{
}



stateCackle = new State("Cackle");
stateCackle.start = function()
{
	timerCackle = 300;
}
stateCackle.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	//behavior
	timerCackle--;
	
	//breakout cases	
	if (hp == hpMax) switch_state(stateExecutable);
	if (timerCackle <= 0) switch_state(stateIdle);
}
stateCackle.stop = function()
{
	
}


	//specific states
stateFlee = new State("Flee");
stateFlee.start = function()
{	
	//get valid connectors
	var _validConnectors = [];
	var _lengthConnectors = array_length(inRoom.connectedTo);
	for (var i = 0; i < _lengthConnectors; i++)
	{
		var _dataRoom = inRoom.connectedTo[i];
		
		if (!_dataRoom.connector.sabotaged) array_push(_validConnectors, _dataRoom);
	}
	
	var _lengthConnectors = array_length(_validConnectors);
	var _rand = irandom(_lengthConnectors - 1);
	
	var _dataRoom = inRoom.connectedTo[_rand];
	toRoom = _dataRoom.room;
	connector = _dataRoom.connector;
	
	stage = 0;
}
stateFlee.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	//flee behavior
	switch (stage)
	{
		case 0:			var _dir = point_direction(x, y, connector.xCenter, connector.yCenter);
						var _dist = point_distance(x, y, connector.xCenter, connector.yCenter);
						
						if (_dist < 10) stage++;
		break;
		
		case 1:			var _dir = point_direction(x, y, toRoom.xCenter, toRoom.yCenter);
						var _dist = point_distance(x, y, toRoom.xCenter, toRoom.yCenter);
						
						if (_dist < 10) stage++;
		break;
	}
	
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
			
	image_angle = _dir;
	
	//breakout cases
	if (hp == hpMax) switch_state(stateExecutable);
	
	if (stage == 2) 
	{
		switch_state(stateIdle);
		timerIdle = 200;
	}
}
stateFlee.stop = function()
{
	
}



stateLast = new State();
stateLast.start = function()
{
}
stateLast.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	
	//idle behavior
	
	
	//breakout cases	
	if (hp == hpMax) switch_state(stateExecutable);
}
stateLast.stop = function()
{
	
}



stateExecutable = new State();
stateExecutable.start = function()
{
	image_blend = c_grey;
	
	timerRecover = 500;
	recover = true;
}
stateExecutable.run = function()
{
	//update room
	var _room = instance_place(x, y, obj_room);
	if (_room != noone) inRoom = instance_place(x, y, obj_room);
	
	if (distance_to_object(obj_player) <= rangeFinisher)
	{
		draw_sprite(spr_UI_button, 0, x, y);
		if  (keyboard_check_pressed(ord("F"))) &&
			(!instance_exists(obj_managerMinigame))			
		{
			instance_create_layer(x, y, "Overlay", obj_managerMinigame, { game : "finisher", enemy : id });
			
			recover = false;
			timerRecover = 500;
		}
	}
	
	if (recover) timerRecover--;
	if (timerRecover <= 0)
	{
		hp = hpMax / 2;
		switch_state(stateIdle);
	}
}
stateExecutable.stop = function()
{
	image_blend = c_white;
}

initialize_state(stateIdle);