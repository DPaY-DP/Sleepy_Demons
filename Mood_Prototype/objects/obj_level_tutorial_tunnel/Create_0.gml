event_inherited();

messageMax = 0;

draw_message = function(_num)
{
	switch (_num)
	{
		case 0:		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, "\nDemons can go\nthrough special Tunnels.\nThey Look like this:\n\n\n\nApproach the Tunnel and Melee attack\nto disable it.\nUse RMB to reclaim your pillow\nfrom the tunnel.", { size : 6 * fontscale, color : c_white, font : font_upheaval_scalable });
					draw_sprite_ext(spr_tunnelTut, 0, GUIwidth * 0.48, GUIheight * 0.45, 4, 4, 0, c_white, 1);
		break;
	}
}


instance_deactivate_layer("Enemies_1");

instance_activate_layer("Rooms_1");
instance_activate_layer("More_Doors");

