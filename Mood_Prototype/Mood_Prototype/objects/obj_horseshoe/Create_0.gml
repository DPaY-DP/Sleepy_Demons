image_xscale = size;
image_yscale = size;


//spawn components
instance_create_depth(x, y, depth - 2,	obj_horseshoeColliderLeft,	{ size : size });
instance_create_depth(x, y, depth - 2,	obj_horseshoeColliderRight, { size : size });
instance_create_depth(x, y, depth - 4,	obj_horseshoeTrackerLeft,	{ size : size });