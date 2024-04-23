//unique values
vulnerable = true;

spd = spdEnemies;

slotsize = 1;


//inherited values and behavior

enemyHPCurrent = 0;
executable = false;
rangeFinisher = 60;

rangeDetection = 120;

hp = 0;
hpMax = 6;

executable = false;
rangeFinisher = 60;

rangeDetection = 120;

inRoom = instance_place(x, y, obj_room);

idParty = undefined;
myParty = undefined;
myLeader = undefined;
amLeader = undefined;


//methods
draw_hpbar = function()
{
	draw_rectangle(x + -5, y + -40, x + hpMax+5, y + -20, 1);
	draw_rectangle_colour(x + 0, y + -35, x + hp, y + -25, $FF05E1FF & $FFFFFF, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, $FF05E1FF & $FFFFFF, 0);
}

get_waypoints = function()
{
	var _waypoints = [];
	
	if (roomWeights[inRoom.numberRoom] != 0)
	{
		var _numberWaypoint = 0;
		var _checkRoom = inRoom;
				
		var _inRoomNumber = inRoom.numberRoom;
		var _roomWeightValue = roomWeights[_inRoomNumber];
			
		var _lowest = _roomWeightValue;
			
		do
		{
			var _lengthConnectors = array_length(_checkRoom.connectedTo);
			for (var i = 0; i < _lengthConnectors; i++)
			{
				var _dataRoom = _checkRoom.connectedTo[i];
				var _dataConnector = _dataRoom.connector;
				if (_dataConnector.sabotaged) continue;								//this will not crash unless there is a room that has ONLY tunnel access
				
				var _connectedRoomNumber = _dataRoom.room.numberRoom;
				var _roomWeightValue = roomWeights[_connectedRoomNumber];
					
				//show_debug_message($"in for {i}: _roomNumber: {_connectedRoomNumber}; _roomWeightValue: {_roomWeightValue} versus lowest: {_lowest}");
				if (_roomWeightValue < _lowest)
				{
					_lowest = _roomWeightValue;
					_waypoints[_numberWaypoint] = _dataRoom;
				}
			}
				
			_checkRoom = _waypoints[_numberWaypoint].room;			//THIS LINE SOMETIMES CAUSES A 
																	//OUT OF RANGE ERROR
																		//maybe a pathfinding gets triggered in a moment where
																		//the enemy is in a doorway for some reason
			_numberWaypoint++;
		}
		until (_lowest == 0)
	}

	return _waypoints
}

leave_party = function(_group)
{
	if (amLeader)
	{
		if (array_length(myParty.members) == 0)
		{
			myParty.sabotageObject.beingSabotaged = false;
			
			array_delete(global.parties, idParty, 1);
			
			idParty = undefined;
			myParty = undefined;
			myLeader = undefined;
			amLeader = undefined;
			
			//show_debug_message("deleted party")
		}
		else
		{
			myParty.leader = myParty.members[0];
			myParty.slots -= myParty.members[0].slotsize;
			array_delete(myParty.members, 0, 1);
			
			myParty.leader.myLeader = myParty.leader;
			myParty.leader.amLeader = true;
			
			idParty = undefined;
			myParty = undefined;
			myLeader = undefined;
			amLeader = undefined;
			
			//show_debug_message("promoted member")
		}
	}
	else
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
		
		idParty = undefined;
		myParty = undefined;
		myLeader = undefined;
		amLeader = undefined;
		
		//show_debug_message("left as member")
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
	inRoom = instance_place(x, y, obj_room);
	
	//behavior
	timerIdle--;
	
	var _dir = point_direction(x, y, xIdle, yIdle);
	var _dist = point_distance(x, y, xIdle, yIdle);
	
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
	
	if (_dist < 10) 
	{
		var _roomWidth = inRoom.sprite_width;
		var _roomHeight = inRoom.sprite_height;
	
		xIdle = inRoom.x + _roomWidth * 0.2 + random(_roomWidth * 0.6);
		yIdle = inRoom.y + _roomHeight * 0.2 + random(_roomHeight * 0.6);
	}
	
	//breakout cases
	if (timerIdle <= 0) switch_state(stateSeek);
	
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
	//select seek leader
	var _amountParties = array_length(global.parties);
	
	var _newparty = true;
	
	for (var i = 0; i < _amountParties; i++)
	{
		var _currentParty = global.parties[i];
		
		if (_currentParty.slots >= slotsize) 
		{
			_newparty = false;
			
			idParty = i;
			myParty = _currentParty;
			myLeader = _currentParty.leader;
			amLeader = false;
			array_push(_currentParty.members, id);
			
			myParty.slots -= slotsize;
			
			sabotageObject = myParty.sabotageObject;
			roomWeights = myLeader.roomWeights;
			
			waypoints = get_waypoints();
			break;
		}
	}
	
	if (_newparty) 
	{
		idParty = array_length(global.parties);
		myParty = { leader : id, members : [], slots : 2, sabotageObject : undefined };
		
		myLeader = id;
		amLeader = true;
		
		do
		{
		var _numberEnv = instance_number(obj_env);
		myParty.sabotageObject = instance_find(obj_env, irandom(_numberEnv - 1));
		}
		until (myParty.sabotageObject.beingSabotaged = false)
		myParty.sabotageObject.beingSabotaged = true;
		
		sabotageRoom = myParty.sabotageObject.inRoom;
		
		array_push(global.parties, myParty);
		
		roomWeights = sabotageRoom.get_navmesh();
		waypoints = get_waypoints();
		
		//show_debug_message($"attempting to go to room {sabotageRoom.numberRoom}");
		//show_debug_message(waypoints)
	}
	
	setNewRoom = true;
	stage = 0;
}
stateSeek.run = function()
{
	//update room
	var _updateRoom = instance_place(x, y, obj_room);
	
	if (_updateRoom != noone) inRoom = _updateRoom;
	
	
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
	inRoom = instance_place(x, y, obj_room);
	
	//behavior	
	var _dir = point_direction(x, y, xIdle, yIdle);
	var _dist = point_distance(x, y, xIdle, yIdle);
	
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
	
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
	inRoom = instance_place(x, y, obj_room);
	
	//behavior
	var _dist = point_distance(x, y, xTo, yTo);
	var _dir = point_direction(x, y, xTo, yTo);
	
	if (_dist > 128)
	{
		x += lengthdir_x(spd, _dir);
		y += lengthdir_y(spd, _dir);
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
	inRoom = instance_place(x, y, obj_room);
	
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
	inRoom = instance_place(x, y, obj_room);
	
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
	inRoom = instance_place(x, y, obj_room);
	
	
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
	if (distance_to_object(obj_player) <= rangeFinisher)
	{
		draw_sprite(spr_UI_button, 0, x, y);
		if (keyboard_check_pressed(ord("F"))) 
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