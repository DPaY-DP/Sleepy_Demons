function mouse_in_area(_xTop, _yTop, _width, _height)
{
	var bottomX = _xTop + _width;
	var bottomY = _yTop + _height;
	
	if (mouse_x >= _xTop) && (mouse_y >= _yTop) && (mouse_x < bottomX) && (mouse_y < bottomY)
	return true;
	
	return false;
}