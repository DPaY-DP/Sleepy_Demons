playerRef = instance_find(obj_player, 0);

surf = surface_create(room_width,room_height);
surface_set_target(surf);
draw_clear(c_black);
surface_reset_target();