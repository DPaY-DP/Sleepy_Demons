obj_horseshoeColliderLeft.image_index = 1;
	
instance_destroy();
instance_create_depth(obj_horseshoe.x - 53 * size, obj_horseshoe.y, depth - 4, obj_horseshoeTrackerRight, { size : size });