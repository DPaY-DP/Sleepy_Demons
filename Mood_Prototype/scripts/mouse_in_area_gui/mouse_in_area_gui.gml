function mouse_in_area_gui(_xTop, _yTop, _width, _height)
{
	var bottomX = _xTop + _width;
	var bottomY = _yTop + _height;
	
	//debug rectangle
	//draw_rectangle_color(_xTop, _yTop, _xTop + _width, _yTop + _height, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 0);
	
	if (device_mouse_x_to_gui(0) >= _xTop) && (device_mouse_y_to_gui(0) >= _yTop) && (device_mouse_x_to_gui(0) < bottomX) && (device_mouse_y_to_gui(0) < bottomY)
	return true;
	
	return false;
}