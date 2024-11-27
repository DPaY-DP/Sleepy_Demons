if place_meeting(x, y, obj_player)
{
	draw_sprite_simple(spr_background_text_UI, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.9 });
	draw_text_simple(GUIwidth * 0.8, GUIheight * 0.9, "Spacebar or LMB \n to continue", { size : 3 * fontscale, color : c_white, font : font_upheaval_scalable });
	draw_message(showMessage);
	
	if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) showMessage++;
	if (showMessage > messageMax) instance_destroy();
}
else instance_destroy();