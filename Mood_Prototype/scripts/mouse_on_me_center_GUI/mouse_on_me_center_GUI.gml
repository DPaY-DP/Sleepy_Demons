function mouse_on_me_center_GUI()
{
	var bottomX = x - sprite_width / 2 + sprite_width;
	var bottomY = y - sprite_height / 2 + sprite_height;
	
	//debug rectangle
	//show_debug_message("fick dich doch du dummer hurensohn")
	//draw_rectangle_color(_xTop, _yTop, _xTop + _width, _yTop + _height, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 0);
	
	if (device_mouse_x_to_gui(0) >= x - sprite_width / 2) && (device_mouse_y_to_gui(0) >= y - sprite_height / 2) && (device_mouse_x_to_gui(0) < bottomX) && (device_mouse_y_to_gui(0) < bottomY)
	return true;
	
	return false;
}