//IMMUTABLE VALUES
spd = 40;


//GAME VALUES
timerDuration = 30;


//METHODS
burst = function()
{
	instance_create_depth(x, y, depth, obj_projectileGluetrap_lingering);
	instance_destroy();
}


//STATES