//immutable data
	//native camera resolution
native_width = 640 * 2;
native_height = 360 * 2;

	//display (and therefore window) size relative to camera resolution
zoom = 1.5;

window_set_size(native_width * zoom, native_height * zoom)
window_size = [windowWidth, windowHeight];

global.GUIScale = windowHeight / native_height;


//methods
toggle_fullscreen = function()
{
	if (window_get_fullscreen()) 
	{
		window_set_fullscreen(false);
		window_set_size(native_width * zoom, native_height * zoom);
	}
	else
	{
		alarm[0] = 1;
		alarm[1] = 2;
	}
	
	alarm[2] = 3;
}


//states
setup_state_machine();

stateFollowPlayer = new State();
stateFollowPlayer.start = function()
{
}
stateFollowPlayer.run = function()
{
	if (instance_exists(obj_player))
	{	
		var toX = obj_player.x - camWidth / 2;
		var toY = obj_player.y - camHeight / 2;
	
		var distX = toX - camX;
		var distY = toY - camY;
	
		if (abs(distX) < 0.1) distX = 0;
		if (abs(distY) < 0.1) distY = 0;
	
		camera_set_view_pos(cam, min(room_width - camWidth, camX + distX / 20), min(room_height - camHeight, camY + distY / 20));
		if (camX < 0) camera_set_view_pos(cam, 0, camY);
		if (camY < 0) camera_set_view_pos(cam, camX, 0);
	}
}
stateFollowPlayer.stop = function()
{
}

stateLock = new State();
stateLock.start = function(_x)
{
	xTo = _x;
	yTo = _x;
}
stateLock.run = function()
{	
	var distX = xTo - camX;
	var distY = yTo - camY;
	
	var _intervalX = distX / 90;
	var _intervalY = distY / 90;
	
	if (abs(_intervalX) < 0.1) _intervalX = 0;
	if (abs(_intervalY) < 0.1) _intervalY = 0;
	
	camera_set_view_pos(cam, min(room_width - camWidth, camX + _intervalX), min(room_height - camHeight, camY + _intervalY));
	if (camX < 0) camera_set_view_pos(cam, 0, camY);
	if (camY < 0) camera_set_view_pos(cam, camX, 0);
}
stateLock.stop = function()
{
}

initialize_state(stateFollowPlayer);

//responsive data
//if (global.save.fullscreen) toggle_fullscreen();