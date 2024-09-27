event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "\n\nThe Demons like to destroy\nthe Environment:\n\n\n\n Approach environment objects\nand HOLD 'E' to repair them.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_sprite_size(spr_env, 3, GUIwidth * 0.5, GUIheight * 0.5, 2);
		break;
	}
}