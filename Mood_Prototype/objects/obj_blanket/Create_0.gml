xStart = x;

grabbed = false;
xOffset = 0;

sensBlanket = 30;

image_xscale = size;
image_yscale = size;


setup_state_machine();

stateIdle = new State();
stateIdle.run = function()
{
	if  (mouse_on_me_center_gui()) &&
		(mouse_check_button_pressed(mb_left))
		switch_state(stateGrab);
}

stateGrab = new State();
stateGrab.start = function()
{
	xOffset = device_mouse_x_to_gui(0) - x;
	image_blend = c_gray;
}
stateGrab.run = function()
{
	x = device_mouse_x_to_gui(0) - xOffset;
	if (x < xStart) x = xStart;
	
	if (x - xprevious > sensBlanket) ||
	   (!mouse_check_button(mb_left))
		switch_state(stateReturn);
}
stateGrab.stop = function()
{
	image_blend = c_white;
}

stateReturn = new State();
stateReturn.run = function()
{
	x -= 10;
	if (x <= xStart) 
	{
		sensBlanket += 15;
		switch_state(stateIdle);
	}
	
	if  (mouse_on_me_center_gui()) &&
		(mouse_check_button_pressed(mb_left))
		switch_state(stateGrab);
}

stateLocked = new State();
stateLocked.run = function()
{
	
}

initialize_state(stateIdle);