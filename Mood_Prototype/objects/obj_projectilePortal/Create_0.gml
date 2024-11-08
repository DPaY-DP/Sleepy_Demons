//IMMUTABLE VALUES
spd = 15;

identity = 0;
if (instance_number(obj_projectilePortal_lingering) == 1) identity = 1;



//GAME VALUES
image_index = identity;



//METHODS
burst = function()
{
	with (obj_projectilePortal_lingering) if (identity == other.identity) instance_destroy();
	
	instance_create_depth(x, y, depth, obj_projectilePortal_lingering, { identity : identity });
	instance_destroy();
}


//STATES