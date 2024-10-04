event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "\n\nThis time you are under pressure! \n\nThe Demons \nlike to destroy the Environment:\n\n\n\nYour HP on the right will tick\ndown if the objects are damaged.\n\n Approach environment objects\nand HOLD 'E' to repair them.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_sprite(spr_envToilet, 3, GUIwidth * 0.3, GUIheight * 0.48);
					draw_sprite(spr_envWaterDispenser, 3, GUIwidth * 0.5, GUIheight * 0.48);
					draw_sprite(spr_envLittlePool, 3, GUIwidth * 0.8, GUIheight * 0.48);
		break;
	}
}