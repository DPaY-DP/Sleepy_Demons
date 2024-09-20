if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.9 });
	draw_message(showMessage);
	
	if (keyboard_check_pressed(vk_space)) showMessage++;
	if (showMessage > messageMax) instance_destroy();
}
else instance_destroy();