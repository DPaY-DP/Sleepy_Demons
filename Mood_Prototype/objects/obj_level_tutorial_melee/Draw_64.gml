if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "Now WE will PILLOW those Demons. \n \n Press C to Pillow", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });

	
	draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	
	if mouse_check_button_pressed(mb_any) instance_destroy()
	

}

else instance_destroy();