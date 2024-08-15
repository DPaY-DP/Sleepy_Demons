
if place_meeting(x, y, obj_player)
{
	if Mouse_click == 0
	{
	draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
	
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "This time you get 2 weapons. \n\n", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.65, "Press 'Spacebar' \n to change between them", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
	
	draw_text_simple(GUIWidth * 0.8, GUIHeight * 0.9, "Press any Mouse button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	}
	if mouse_check_button_pressed(mb_any) 
	{
		Mouse_click ++;
			
	}
	 
	 if Mouse_click == 1
	 {
		 draw_sprite_simple(spr_background_text_UI, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.9 });
		 draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.45, "\nAdditionally: The Demons can go\nthrough special Tunnels.\nThey Look like this:\n\n\n\nApproach the Tunnel and Press 'F'\nto destroy it!", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
		 draw_sprite_ext(spr_tunnel, 0, GUIWidth * 0.48, GUIHeight * 0.45, 4, 2, 0, c_white, 1);
		 
		 draw_text_simple(GUIWidth * 0.85, GUIHeight * 0.9, "Press any Mouse button\nto continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	 }
	if Mouse_click >= 2 instance_destroy();
}

else instance_destroy();