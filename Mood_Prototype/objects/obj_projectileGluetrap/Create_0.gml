//IMMUTABLE VALUES
spd = 20;


//GAME VALUES
timerDuration = 30;


//METHODS
burst = function()
{
	instance_create_depth(x, y, depth, obj_projectileGluetrap_lingering);
	instance_destroy();
	
	audio_play_sound_at(snd_gummySplat, x, y, 0, 100, 150, 1, 0, 0, gainSFX, 0, 1.3);
	show_debug_message("burst")
}


//STATES