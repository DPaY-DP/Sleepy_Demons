if (timergo = true)
{
	draw_set_halign(fa_center);
	draw_text_transformed(obj_player.x - camera_get_view_x(view_camera[0]) + 380, obj_player.y-camera_get_view_y(view_camera[0]), "You picked up the Pyjama-Launcher!\nChange Weapon with 'Space' or 'Mousewheel'\nCharge it against the Big Demon to make him vulnerable", 1.5, 1.5, 0);
	draw_set_halign(fa_left);
	timer = timer - .1;
}

if timer = 0
{
	instance_destroy();
	
}