event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:			draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "This is a demon. \n\n\n\n\n It's naptime. \n Approach them and \n Press F\n\n\n\n\n put all of them \nto sleep to clear the level", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
						draw_sprite_ext(spr_pablo, 2, GUIwidth * 0.5, GUIheight * 0.32, 1, 1, 0, c_white, 1);
		break;
	}
}