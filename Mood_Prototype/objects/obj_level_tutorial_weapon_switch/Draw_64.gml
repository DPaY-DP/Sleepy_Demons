if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "This time you get 2 weapons. \n\n", { size : 1, color : c_white, font : font_menu });
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.65, "Press 'Spacebar' \n to change btween them", { size : 1, color : c_white, font : font_menu });
	
	draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 0.5, color : c_white, font : font_menu_small });
	
	if mouse_check_button_pressed(mb_any) instance_destroy()
	

}

