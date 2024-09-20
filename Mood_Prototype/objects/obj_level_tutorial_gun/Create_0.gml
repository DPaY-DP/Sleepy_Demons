event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "Pick up the gun        \n and shoot the demon. \n Shoot with 'Left Click' of your mouse.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_sprite_ext(spr_gun, 0, GUIwidth * 0.5, GUIheight * 0.25, 2, 2, 0, c_white, 1);
					draw_text_simple(GUIwidth * 0.8, GUIheight * 0.9, "Press 'Space' button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
		break;
	}
}