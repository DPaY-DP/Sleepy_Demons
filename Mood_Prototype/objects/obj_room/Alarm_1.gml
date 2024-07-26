		//conjoined rooms
var _iteration = 0;
var _roomsConjoined = [[id]];

while (true)
{
	var _length = array_length(_roomsConjoined[_iteration]);
	for (var i = 0; i < _length; i++)
	{
		var _roomChecking = _roomsConjoined[_iteration];
		var _rX = _roomChecking.x;
		var _rY = _roomChecking.y;
	
		var _checkSum = [
		{ x : 1, y : 0 },		//right
		{ x : -1, y : 0 },		//left
		{ x : 0, y : 1 },		//down
		{ x : 0, y : -1 },		//up
		]
	
		for (var c = 0; c < 4; c++)
		{
			var _chX = _checkSum[c].x;
			var _chY = _checkSum[c].y;
		
			var _room = instance_place(_rX + _chX, _rY + _chY, obj_room);
		
			if (_room != noone)
			{
				array_push(_roomsConjoined[_iteration + 1], _room);
				
				var _pointConnector = {};
				
				switch (c)
				{
					case 3:		_pointConnector.x = x + sprite_width / 2;
								_pointConnector.y = y;
					
					case 2:		_pointConnector.x = x + sprite_width / 2;
								_pointConnector.y = y + sprite_height;
					
					case 1:		_pointConnector.x = x;
								_pointConnector.y = y + sprite_height / 2;
					
					case 0:		_pointConnector.x = x + sprite_width;
								_pointConnector.y = y + sprite_height / 2;
				}
		
				var _myDoors = ds_clone(_roomChecking.doors);
				var _length = array_length(_myDoors);
				for (var l = 0; l < _length; l++)
				{
					array_push(_myDoors[l].append, _pointConnector);
				}
	
				var _theirDoors = ds_clone(_room.doors);
				var _length = array_length(_theirDoors);
				for (var l = 0; l < _length; l++)
				{
					array_push(_theirDoors[l].append, _pointConnector);
				}
	
				array_append(_roomChecking.doors, _theirDoors);
				array_append(_room.doors, _myDoors);
	
				var _myPoints = ds_clone(_roomChecking.points);
				array_append(_roomChecking.points, _room.points, 1);
				array_append(_room.points, _myDoors, 1);
			}
		}
	}
}