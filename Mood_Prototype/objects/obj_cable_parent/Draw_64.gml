draw_self();

if(mouse_check_button(mb_left)) && instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self) && drawline = 0{
	dragging = true
	start_connect = 1

	audio_play_sound(choose(snd_cableStretch, snd_cableStretch2), 0, 0, gainSFX);
}

if (dragging = true) && drawline = 0
{
	draw_line_width_color(x, y, 
	x + lengthdir_x(_dist, point_direction(x, y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))), 
	y + lengthdir_y(_dist, point_direction(x, y,device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))), 
	20 * global.GUIScale,cablecolor,cablecolor);
}

if (mouse_check_button_released(mb_left)) && (dragging)
{
	dragging = false;
	audio_play_sound(snd_cablebreak, 0, 0, gainSFX, 0, 0.8 + random(0.4));

}

if (dragging = true ) && instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_cable_color)
{
	
	dragging = false
	drawline = 1
	global.number_of_cables += 1;
	
	audio_play_sound(snd_ClickGamePop, 0, 0, gainSFX, 0, 0.3 + global.number_of_cables * 0.1);
}

if drawline = 1
{
	draw_line_width_color(self.x, self.y,obj_cable_color.x, obj_cable_color.y,20 * global.GUIScale,cablecolor, cablecolor)
}


