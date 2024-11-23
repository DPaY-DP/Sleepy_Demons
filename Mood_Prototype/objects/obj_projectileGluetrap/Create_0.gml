//IMMUTABLE VALUES
spd = 20;


//GAME VALUES
timerDuration = 30;


//METHODS
burst = function()
{
	instance_create_depth(x, y, depth, obj_projectileGluetrap_lingering);
	instance_destroy();
	
	audio_play_sound(snd_gummySplat, 0, 0, gainSFX, 0, 1.3);
}


//STATES