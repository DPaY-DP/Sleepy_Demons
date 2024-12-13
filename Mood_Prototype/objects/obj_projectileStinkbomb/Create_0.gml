//IMMUTABLE VALUES
spdBase = 10;

range = 200;


//GAME VALUES
timerDuration = 600;
timerStink = 30;

spd = spdBase;

inRoom = noone;

//METHODS
stop = function()
{
	var _roomCheck = instance_place(x, y, obj_room);
	if (_roomCheck != noone) inRoom = _roomCheck;
	if (inRoom == noone) inRoom = instance_nearest(x, y, obj_room);
		
	spd = 0;
}


//STATES