//IMMUTABLE VALUES



//GAME VALUES



//SETUP AND SPAWING
image_xscale = size;
image_yscale = size;



//METHODS



//STATES
setup_state_machine();

stateSpawn = new State();
stateSpawn.start = function()
{
	timer = 0;
	intervalSpawn = 45;
	
	image_angle = random(360);
	factorRot = 30;
	
	dir = random(360);
	spd = 5;
}
stateSpawn.run = function()
{	
	timer++;
	
	factorRot = ease_out(timer, 30, -30, intervalSpawn);
	spd = ease_out(timer, 5, -5, intervalSpawn);
	
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	image_angle += factorRot;
	
	if (timer >= intervalSpawn) switch_state(stateReturn);
}
stateSpawn.stop = function()
{
}


stateReturn = new State();
stateReturn.start = function()
{
	timer = 0;
	intervalReturn = 45;
}
stateReturn.run = function()
{	
	timer++;
	
	var _newDir = point_direction(x, y, obj_player.x, obj_player.y);
	
	image_angle += angle_difference(_newDir, image_angle) / 20;
	spd = ease_out(timer, 0, 20, intervalReturn);
	
	x += lengthdir_x(spd, _newDir);
	y += lengthdir_y(spd, _newDir);
	
	if (place_meeting(x, y, obj_player))
	{
		instance_destroy();
		audio_play_sound(snd_pickUpAmmo, 0, 0, gainSFX, 0, 1.4 + random(0.2));
	}
}
stateReturn.stop = function()
{
}

initialize_state(stateSpawn);