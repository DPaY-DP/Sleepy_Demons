event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "from Now on \nyou get MORE weapons at weaponstations. \n Each new weapon has limited ammo. \n\n Ammo is shown on the bottom left corner. ", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_text_simple(GUIwidth * 0.5, GUIheight * 0.65, "Use MOUSE WHEEL or SPACE BAR \n to cycle through them", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
		break;
	}
}