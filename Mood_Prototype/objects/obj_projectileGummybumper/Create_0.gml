//IMMUTABLE VALUES
spdBase = 20;

intervalBounce = 20;


//GAME VALUES
spd = spdBase;

timerBounce = intervalBounce;

timerDuration = 1800;


//METHODS



//STATES
setup_state_machine();

stateShot = new State();
stateShot.run = function()
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	spd *= 0.95;
	if (spd < 0.4) switch_state(stateBounce);
}


stateBounce = new State();
stateBounce.run = function()
{
	timerDuration--;
	if (timerDuration == 0) instance_destroy();
	
	var _agent = instance_place(x, y, OBJ_agents);
	if (_agent != noone) 
	{
		var _dir = point_direction(x, y, _agent.x, _agent.y);
		with (_agent)
		{
			var _str = point_distance(x, y, xprevious, yprevious) * 4;
		
			hvel = lengthdir_x(_str, _dir);
			vvel = lengthdir_y(_str, _dir);
		}
		
		switch_state(stateDebounce);
	}
}


stateDebounce = new State();
stateDebounce.start = function()
{
	image_blend = c_grey;
}
stateDebounce.run = function()
{
	timerBounce--;
	if (timerBounce == 0)
	{
		timerBounce = intervalBounce;
		
		switch_state(stateBounce);
	}
}
stateDebounce.stop = function()
{
	image_blend = c_white;
}

initialize_state(stateShot);