if (fade)
{
	draw_sprite_simple(sprite_index, image_index, lockX, lockY, { xscale : image_xscale, yscale : image_yscale, alpha : 0.5, angle : image_angle });
	
	if (!place_meeting(lockX, lockY, obj_player)) 
	{
		show_debug_message("fade Out")
		fade = false;
		x = lockX;
	}
}

draw_self();