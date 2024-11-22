surface_set_target(surf);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_flashlight, 0, playerRef.x, playerRef.y, 10, 5,playerRef.orientation, c_white, 1)
draw_sprite_ext(spr_areaLight, 0, playerRef.x, playerRef.y, 5, 5, 0, c_white, 1)
surface_reset_target();
gpu_set_blendmode(bm_normal);