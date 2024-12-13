//IMMUTABLE VALUES
spdBase = 20;

range = 200;

factorCircleBase = 1;
factorCircle = factorCircleBase;
factorFactorCircle = 0.025;


//GAME VALUES
timerDuration = 600;

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