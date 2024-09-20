event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "Now WE will PILLOW those Demons. \n \n Press C to Pillow", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_text_simple(GUIwidth * 0.8, GUIheight * 0.9, "Press 'Space' button \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });	
		break;
	}
}