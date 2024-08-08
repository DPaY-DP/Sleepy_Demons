if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "The Demons like to destroy the Environment  \n It will turn 'Red' if at least 2 vandalize it. \n Approach it and \n Press 'E' to repair.", { size : 1, color : c_white, font : font_menu });
	draw_sprite_size(spr_env, 3, GUIWidth * 0.85, y, 2); 
	
	draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 0.5, color : c_white, font : font_menu_small });
	
	if mouse_check_button_pressed(mb_any) instance_destroy()
	

}

else
{
		instance_destroy();
}
