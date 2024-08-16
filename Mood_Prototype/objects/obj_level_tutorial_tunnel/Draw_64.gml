if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "This is a demon. \n\n It's naptime. \n Approach him and \n Press F", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
	draw_sprite_ext(spr_pablo, 2, GUIWidth * 0.5, GUIHeight * 0.32, 1, 1, 0, c_white, 1);
	
	draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press 'Space' button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	
	if keyboard_check_pressed(vk_space) instance_destroy()
	

}

else instance_destroy();