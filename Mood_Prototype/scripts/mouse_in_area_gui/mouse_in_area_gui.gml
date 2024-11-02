function mouse_in_area_GUI(_xTop, _yTop, _width, _height)
{
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	var bottomX = _xTop + _width;
	var bottomY = _yTop + _height;
	
	if (0) draw_rectangle(_xTop, _yTop, _xTop + _width, _yTop + _height, false);			//debug visualizer
	
	if (_mouseX >= _xTop) && (_mouseY >= _yTop) && (_mouseX < bottomX) && (_mouseY < bottomY)
	return true;
	
	return false;
}