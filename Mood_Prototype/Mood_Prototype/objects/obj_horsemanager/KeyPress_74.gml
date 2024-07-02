show_debug_message("");
instance_create_depth(obj_player.x,obj_player.y,-3,obj_horseshoe);

instance_create_depth(obj_horseshoe.x-44*5,obj_horseshoe.y+37*5,-2,obj_horseshoeColliderLeft);
instance_create_depth(obj_horseshoe.x-1,obj_horseshoe.y,-4,obj_horseshoeTracker);
instance_create_depth(obj_horseshoe.x-1*5,obj_horseshoe.y+37*5,-2,obj_horseshoeColliderRight);