while (place_meeting(x, y, other.id))
{
	x -= lengthdir_x(spd, dir);
	y -= lengthdir_y(spd, dir);
}

instance_create_depth(x, y, depth, obj_pillowPickup);
instance_destroy();