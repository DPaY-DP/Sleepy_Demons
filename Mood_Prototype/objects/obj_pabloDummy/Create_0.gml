sprite_index = spr_pablo;

event_inherited();

hpMax = 1000000;
hp = hpMax;

walk = function(_dist)
{
	//show_debug_message($"\n		walking navmesh: {navmesh}")
	
	var _xNav = xTo;
	var _yNav = yTo;
	
	var _positions = movement_and_navigation(_xNav, _yNav);
	
	var _xDist = _positions[3] - _positions[1];
	var _yDist = _positions[2] - _positions[0];
	
	var _iterations = 5;
	var _xIterate = _xDist / _iterations;
	var _yIterate = _xDist / _iterations;
	
	for (var i = 0; i < _iterations; i++)
	{
		if (point_distance(x - _xIterate * i, y - _yIterate * i, _xNav, _yNav) < _dist) 
		{
			return false
		}
	}
	
	timerUnstuck++;
	if (timerUnstuck >= intervalUnstuck)
	{
		timerUnstuck = 0;
		if (point_distance(x, y, xLast, yLast) < distanceUnstuck)
		{
			iterationsUnstuck++;
			if (iterationsUnstuck > 2)
			{
				if (lastPoint != undefined)
				{
					array_insert(navmesh, 0, lastPoint);
					
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
					
					//lastPoint = undefined;
					if (global.debugmode) show_message($"Pablo {id} in room {inRoom.number}\nNavigating back to previous waypoint:\n{lastPoint}");
				}
				else 
				{
					iterationsUnstuck = 0;
					xLast = x;
					yLast = y;
					if (global.debugmode) show_message($"Pablo {id} in room {inRoom.number}\ntrying to navigate to a fallback point that is not defined");
				}
			}
		}
		else
		{
			xLast = x;
			yLast = y;
			
			iterationsUnstuck = 0;
		}
	}
	
	return true
}

stateRebound = new State("Rebound");
stateRebound.start = function()
{
	xTo = x;
	yTo = y;
}
stateRebound.run = function()
{
	walk(12);
}
stateRebound.stop = function()
{
}