if place_meeting(x, y, obj_player)
{
	if Mouse_click == 0
	{
		draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
		draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "Pick up the gun        \n and shoot the demon. \n Shoot with 'Left Click' of your mouse.", { size : 1, color : c_white, font : font_menu });
		draw_sprite_ext(spr_gun, 0, GUIWidth * 0.62, GUIHeight * 0.35, 1, 1, 0, c_white, 1);
	
		draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 0.5, color : c_white, font : font_menu_small });
	}
	
	if mouse_check_button_pressed(mb_any) Mouse_click ++;
	
	if Mouse_click == 1
	{
		draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
		draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "During the Game you will get different weapons \n Some of them has a secondary abbility. \n Use it with 'Right Click' ", { size : 1, color : c_white, font : font_menu });
		
	
		draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 0.5, color : c_white, font : font_menu_small });
	}
	if Mouse_click >= 2 instance_destroy();

}

else instance_destroy();