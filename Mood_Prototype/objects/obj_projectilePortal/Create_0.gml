//IMMUTABLE VALUES
spd = 15;


//SETUP AND SPAWNING



//GAME VALUES
if (identity) color = #EE777B;
else color = #7EBFFF;



//METHODS
burst = function()
{
	with (obj_projectilePortal_lingering) if (identity == other.identity) instance_destroy();
	
	audio_play_sound(snd_portalOpen, 0, 0, gainSFX, 0, 1 + 0.5 * identity);
	
	instance_create_depth(x, y, depth, obj_projectilePortal_lingering, { identity, color });
	instance_destroy();
}


//STATES