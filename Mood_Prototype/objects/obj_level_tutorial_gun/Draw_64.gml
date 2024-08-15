if place_meeting(x, y, obj_player)
{
	if Mouse_click == 0
	{
		draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
		draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "Pick up the gun        \n and shoot the demon. \n Shoot with 'Left Click' of your mouse.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
		draw_sprite_ext(spr_gun, 0, GUIWidth * 0.5, GUIHeight * 0.25, 2, 2, 0, c_white, 1);
	
		draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	}
	
	if mouse_check_button_pressed(mb_any) Mouse_click ++;
	
	//if Mouse_click == 1
	//{
	//	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	//	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "During the Game you will\nget different weapons \n Some of them have a secondary abbility.\nUse it with 'Right Click' ", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
		
	
	//	draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	//}
	if Mouse_click >= 1 instance_destroy();

}

else instance_destroy();