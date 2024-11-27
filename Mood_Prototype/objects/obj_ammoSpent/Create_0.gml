//IMMUTABLE VALUES



//GAME VALUES



//METHODS



//STATES
setup_state_machine();

stateSpawn = new State();
stateSpawn.start = function()
{
	timer = 0;
	intervalSpawn = 45;
	
	image_angle = random(360);
	factorRot = 10;
	
	spd = 5;
}
stateSpawn.run = function()
{	
	timer++;
	
	factorRot = ease_out(timer, 10, -10, intervalSpawn);
	spd = ease_out(timer, 5, -5, intervalSpawn);
	
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	image_angle += factorRot;
	
	if (timer >= intervalSpawn) switch_state(stateDespawn);
}
stateSpawn.stop = function()
{
}


stateDespawn = new State();
stateDespawn.start = function()
{
}
stateDespawn.run = function()
{	
	image_alpha -= 0.02;
	
	if (image_alpha <= 0) instance_destroy();
}
stateDespawn.stop = function()
{
}

initialize_state(stateSpawn);