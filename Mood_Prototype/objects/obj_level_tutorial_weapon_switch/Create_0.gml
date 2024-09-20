event_inherited();

messageMax = 1;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "This time you get 2 weapons. \n\n", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_text_simple(GUIwidth * 0.5, GUIheight * 0.65, "Press 'Spacebar' \n to change between them", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_text_simple(GUIwidth * 0.8, GUIheight * 0.9, "Press 'Space' button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
		break;
		
		case 1:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "\nAdditionally: The Demons can go\nthrough special Tunnels.\nThey Look like this:\n\n\n\nApproach the Tunnel and Press 'F'\nto destroy it!", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_sprite_ext(spr_tunnel, 0, GUIwidth * 0.48, GUIheight * 0.45, 4, 2, 0, c_white, 1);
					draw_text_simple(GUIwidth * 0.85, GUIheight * 0.9, "Press 'Space' button\nto continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
		break;
	}
}