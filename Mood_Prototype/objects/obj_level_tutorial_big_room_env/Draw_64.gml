if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "\n\nThe Demons like to destroy\nthe Environment:\n\n\n\n Approach environment objects\nand press 'E' to repair them.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
	draw_sprite_size(spr_env, 3, GUIWidth * 0.5, GUIheight * 0.5, 2); 
	
	draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press 'Space' button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	
	if keyboard_check_pressed(vk_space) instance_destroy()
	

}

else
{
		instance_destroy();
}
