if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "Pick up the gun \n\n and shoot the demon.", { size : 1, color : c_white, font : font_menu });
	draw_sprite_ext(spr_gun, 0, GUIWidth * 0.5, GUIHeight * 0.45, 1, 1, 0, c_white, 1);
	
	draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 0.5, color : c_white, font : font_menu_small });
	
	if mouse_check_button_pressed(mb_any) instance_destroy()
	

}

