//get point data
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

if (!variable_global_exists("countRoom")) global.countRoom = 0;
numberRoom = global.countRoom++;

flood = false;
floodAmount = 0;
floodFactor = 0.005;
floodMax = 1;


//create walls
//instance_create_depth(x - 32, y - 32, depth, obj_wall, { image_xscale : 2 + sprite_width / 32 });
//instance_create_depth(x - 32, y + sprite_height, depth, obj_wall, { image_xscale : 2 + sprite_width / 32 });

//instance_create_depth(x - 32, y - 32, depth, obj_wall, { image_yscale : 2 + sprite_height / 32 });
//instance_create_depth(x + sprite_width, y - 32, depth, obj_wall, { image_yscale : 2 + sprite_height / 32 });


//method
get_navmesh = function()
{
	var _iterations = 0;
	var _weightRooms = array_create(instance_number(obj_room), undefined);
	_weightRooms[numberRoom] = 0;
	
	var _lengthConnections = array_length(connectedTo);
	var _checkNext = [noone, []];
	for (var i = 0; i < _lengthConnections; i++)
	{
		var _dataConnector = connectedTo[i].connector;
		var _numberRoom = connectedTo[i].room.numberRoom;
		
		if (!_dataConnector.sabotaged)
		if (_weightRooms[_numberRoom] == undefined) 
		{
			_weightRooms[_numberRoom] = _iterations + 1;
			array_push(_checkNext[_iterations + 1], connectedTo[i].room);
		}
	}
	_iterations++;
	
	do
	{
		_checkNext[_iterations + 1] = array_create(0, undefined);
		
		//show_debug_message($"checkNext: {_checkNext}");
		
		var _repeat = false;
		
		var _listLength = array_length(_checkNext[_iterations]);
		for (var i = 0; i < _listLength; i++)
		{
			var _currentRoom = _checkNext[_iterations][i];
			var _lengthConnections = array_length(_currentRoom.connectedTo);
			
			for (var l = 0; l < _lengthConnections; l++)
			{
				var _dataConnector = _currentRoom.connectedTo[l].connector;
				var _numberRoom = _currentRoom.connectedTo[l].room.numberRoom;
			
				if (!_dataConnector.sabotaged)
				if (_weightRooms[_numberRoom] == undefined) 
				{
					_weightRooms[_numberRoom] = _iterations + 1;
					array_push(_checkNext[_iterations + 1], _currentRoom.connectedTo[l].room);
					_repeat = true;
				}
			}
		}
		_iterations++;
	}
	until (_repeat == false)
	
	show_debug_message($"targetRoom: {numberRoom}\nweights: {_weightRooms}")
	
	return _weightRooms
}

//setup rooms
connectedTo = [];